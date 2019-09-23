package com.sy.web.controller;

import com.github.pagehelper.PageInfo;
import com.sy.dto.ResultDto;
import com.sy.pojo.Orders;
import com.sy.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author manager
 */

@Controller
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    /**
     *
     * @param model
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/order/order")
    public String list(Model model,
                       @RequestParam(name = "page", defaultValue = "1") Integer page,
                       @RequestParam(name = "pageSize", defaultValue = "4") Integer pageSize){
        List<Orders> orders = ordersService.getAllOrders(page,pageSize);

        PageInfo<Orders> ordersPageInfo = new PageInfo<>(orders);
        model.addAttribute("ordersPageInfo",ordersPageInfo);
        model.addAttribute("orders", orders);
        return "order/order-list";
    }

    /**
     * 订单添加页面
     * @return
     */
    @RequestMapping("/order/add")
    public String add(){
        return "order/order-add";
    }

    /**
     * 添加订单方法
     * @param orders
     * @return
     */
    @PostMapping("/order/add/ordersAction")
    @ResponseBody
    public ResultDto<Orders> addOrdersAction(Orders orders){
        return ordersService.addOrder(orders);
    }

    /**
     * 多条删除订单
     * @param oNos
     * @return
     */
    @RequestMapping("/order/deleteOrders")
    @ResponseBody
    public ResultDto<String> deleteOrders(String oNos){
        return ordersService.deleteOrders(oNos);
    }


}
