package com.sy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @RequestMapping("/hello")
    public String hello(){

        return "hello";
    }

    @RequestMapping("/hello1")
    public String hello1(){

        return "hello1";
    }

}
