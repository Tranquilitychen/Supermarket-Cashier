package com.sy.dao;

import com.sy.pojo.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author manager
 */
public interface OrdersMapper {

    /**
     * 查询所有订单
     * @return
     */
    List<Orders> findAll();

    /**
     * 保存数据的方法
     * @param orders
     */
    Integer ordersSave(@Param("orders") Orders orders);

    /**
     * 多条删除
     * @param o_nos
     * @return
     */
    Integer deleteOrders(@Param("o_nos") String[] o_nos);
}
