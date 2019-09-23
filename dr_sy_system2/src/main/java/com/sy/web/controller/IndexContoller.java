package com.sy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexContoller {

    @RequestMapping("/home")
    public String home(){ return "index"; }

    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }
        }
