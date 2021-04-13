package com.fatehole.office.controller;

import com.fatehole.office.util.ResponseBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/12/22:29
 */
@RestController
public class LoginController {

    @GetMapping("/login")
    public ResponseBean login() {
        return ResponseBean.error("尚未登录，请先登录！");
    }
}
