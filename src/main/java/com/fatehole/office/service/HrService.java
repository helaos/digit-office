package com.fatehole.office.service;

import com.fatehole.office.mapper.HrMapper;
import com.fatehole.office.model.Hr;
import com.fatehole.office.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/12/20:27
 */
@Service
public class HrService implements UserDetailsService {

    @Autowired
    HrMapper hrMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Hr hr = hrMapper.loadUserByUsername(username);
        if (null == hr) {
            throw new UsernameNotFoundException("该用户不存在！");
        }
        // 登录成功，赋值角色
        hr.setRoles(hrMapper.getHrRolesById(hr.getId()));
        return hr;
    }
}
