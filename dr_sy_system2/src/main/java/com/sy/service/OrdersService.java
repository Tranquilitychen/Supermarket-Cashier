package com.sy.service;

import com.sy.dto.ResultDto;
import com.sy.pojo.Orders;

import java.util.List;

/**
 * @author manager
 */
public interface OrdersService {

    /**
     *获取所有订单
     * @param page 当前页码
     * @param pageSize 当前页容量
     * @return
     */
    List<Orders> getAllOrders(Integer page, Integer pageSize);

    /**
     * 添加订单的方法
     * @param orders
     * @return
     */
    ResultDto<Orders> addOrder(Orders orders);

    /**
     * 删除多个订单
     * @param oNos
     * @return
     */
    ResultDto<String> deleteOrders(String oNos);


    /**
     * 获取订单总数
     * @return
     */
    ResultDto<Object> selTotalOd();



}
