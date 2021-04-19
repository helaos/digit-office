package com.fatehole.office.controller;

import com.fatehole.office.model.Hr;
import com.fatehole.office.model.Menu;
import com.fatehole.office.service.MenuService;
import com.fatehole.office.util.ResponseBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/16/11:54
 */
@RestController
@RequestMapping("/system/config")
public class SystemConfigController {

    @Autowired
    private MenuService menuService;

    @GetMapping("/menu")
    public ResponseBean getMenusByHrId() {
        List<Menu> result = menuService.getMenusByHrId(((Hr) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId());
        if (null == result || result.isEmpty()) {
            return ResponseBean.error("获取失败");
        }
        return ResponseBean.ok("获取成功", result);
    }
}
