package com.sy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统统计图
 */
@Controller
public class SytController {

    /**
     * 饼状图
     * @return
     */
    @RequestMapping("/syt/pie")
    public String pie(){
        return "syt/pie-simple";
    }
    /**
     * 折线图
     * @return
     */
    @RequestMapping("/syt/area")
    public String area(){
        return "syt/area-stack";
    }
    /**
     * 柱状图
     * @return
     */
    @RequestMapping("/syt/bar")
    public String bar(){
        return "syt/bar-stack";
    }
    /**
     * 仪表图
     * @return
     */
    @RequestMapping("/syt/gauge")
    public String gauge(){
        return "syt/gauge";
    }
}
