package com.sy.web.controller;

import com.sy.dto.ResultDto;
import com.sy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class WelcomeController {
    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private GoodstypeService goodstypeService;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private PromService promService;

    /**
     * 获取员工总数
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("welcome/showData")
    public ResultDto<Object> showWelcomeData(HttpServletRequest request){
        ResultDto<Object> objectResultDto = employeeService.selTotalEmpl();
        request.getSession().setAttribute("totalEmpl", objectResultDto.getData());
        // 显示员工数
        return objectResultDto;
    }

    /**
     * 获取商品总数
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("welcome/showGd")
    public ResultDto<Object> showWelcomeGoods(HttpServletRequest request){
        ResultDto<Object> objectResultDto = goodsService.selTotalGd();
        request.getSession().setAttribute("totalGd",objectResultDto.getData());
        return objectResultDto;
    }

    /**
     * 获取商品类别总数
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("welcome/showGdt")
    public  ResultDto<Object> showWelcomeGoodstype(HttpServletRequest request){
        ResultDto<Object> objectResultDto = goodstypeService.selTotalGdt();
        request.getSession().setAttribute("totalGdt",objectResultDto.getData());
        return objectResultDto;
    }

    /**
     * 获取订单总数
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("welcome/showOd")
    public  ResultDto<Object> showWelcomeOrders(HttpServletRequest request){
        ResultDto<Object> objectResultDto = ordersService.selTotalOd();
        request.getSession().setAttribute("totalOd",objectResultDto.getData());
        return objectResultDto;
    }
    /**
     * 获取活动总数
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("welcome/showEt")
    public  ResultDto<Object> showWelcomeEventRecord(HttpServletRequest request){
        ResultDto<Object> objectResultDto = promService.selTotalEt();
        request.getSession().setAttribute("totalEt",objectResultDto.getData());
        return objectResultDto;
    }

}
