package com.fatehole.office.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/12/21:47
 */
@RestController
public class HelloController {


    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }
}
