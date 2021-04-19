package com.fatehole.office.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fatehole.office.model.Hr;
import com.fatehole.office.service.HrService;
import com.fatehole.office.util.ResponseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.*;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;

import java.io.PrintWriter;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/12/21:42
 */
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private HrService hrService;

    @Autowired
    private CustomSecurityMetadataSource customSecurityMetadataSource;

    @Autowired
    private CustomAccessDecisionManager customAccessDecisionManager;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(hrService);
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/login");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                // .anyRequest().authenticated()
                .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
                    @Override
                    public <O extends FilterSecurityInterceptor> O postProcess(O object) {
                        object.setAccessDecisionManager(customAccessDecisionManager);
                        object.setSecurityMetadataSource(customSecurityMetadataSource);
                        return object;
                    }
                })
                .and()
                .formLogin()
                .usernameParameter("username")
                .passwordParameter("password")
                .loginProcessingUrl("/doLogin")
                .loginPage("/login")
                .successHandler((request, response, authentication) -> {
                    response.setContentType("application/json;charset=utf-8");
                    PrintWriter out = response.getWriter();
                    Hr hr = (Hr) authentication.getPrincipal();
                    // 防止密码泄露
                    hr.setPassword(null);
                    ResponseBean ok = ResponseBean.ok("登录成功！", hr);
                    String result = new ObjectMapper().writeValueAsString(ok);
                    out.write(result);
                    out.flush();
                    out.close();
                })
                .failureHandler((request, response, exception) -> {
                    response.setContentType("application/json;charset=utf-8");
                    PrintWriter out = response.getWriter();
                    ResponseBean error = ResponseBean.error("登录失败！");
                    if (exception instanceof LockedException) {
                        error.setMsg("账户已被锁定，请联系管理员解除！");
                    } else if (exception instanceof CredentialsExpiredException) {
                        error.setMsg("密码过期，请联系管理员！");
                    } else if (exception instanceof AccountExpiredException) {
                        error.setMsg("账户过期，请联系管理员！");
                    } else if (exception instanceof DisabledException) {
                        error.setMsg("账户已被禁用，请联系管理员解除");
                    } else if (exception instanceof BadCredentialsException) {
                        error.setMsg("用户名或密码错误！请重新输入！");
                    }
                    String result = new ObjectMapper().writeValueAsString(error);
                    out.write(result);
                    out.flush();
                    out.close();
                })
                .permitAll()
                .and()
                .logout()
                .logoutSuccessHandler((request, response, authentication) -> {
                    response.setContentType("application/json;charset=utf-8");
                    PrintWriter out = response.getWriter();
                    out.write(new ObjectMapper().writeValueAsString(ResponseBean.ok("注销成功！")));
                    out.flush();
                    out.close();
                })
                .permitAll()
                .and()
                // 为了方便开发，暂时将csrf关闭
                .csrf().disable().exceptionHandling()
                // 没有认证时，在这里处理结果，不要重定向
                .authenticationEntryPoint((request, response, authException) -> {
                    response.setContentType("application/json;charset=utf-8");
                    PrintWriter out = response.getWriter();
                    ResponseBean error = ResponseBean.error("访问失败！");
                    if (authException instanceof InsufficientAuthenticationException) {
                        error.setMsg("请求失败，请联系管理员！");
                    }
                    out.write(new ObjectMapper().writeValueAsString(error));
                    out.flush();
                    out.close();
                });
    }
}
