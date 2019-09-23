package com.sy.service.impl;

import com.github.pagehelper.PageHelper;
import com.sy.dao.OrdersMapper;
import com.sy.dto.ResultDto;
import com.sy.pojo.Orders;
import com.sy.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author manager
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    public List<Orders> getAllOrders(Integer page, Integer pageSize) {
        //分页
        PageHelper.startPage(page,pageSize);
        return ordersMapper.findAll();
    }


    @Override
    public ResultDto<Orders> addOrder(Orders orders) {

        Integer ordersSave = ordersMapper.ordersSave(orders);
        if (ordersSave > 0){
            return new ResultDto<>(200,"保存成功！！！");
        }

        return new ResultDto<>(2001,"保存失败！！！");
    }

    /**
     * 删除多个员工
     * @param oNos
     * @return
     */
    @Override
    public ResultDto<String> deleteOrders(String oNos) {
        if (oNos == null || oNos.isEmpty()){
            return new ResultDto<>(5001,"删除数据异常！！！");
        }
        String[] o_nos = oNos.split(",");
        Integer rows = ordersMapper.deleteOrders(o_nos);

        if (rows > 0){
            return new ResultDto<>(200, "删除成功");
        }
        return new ResultDto<>(5002,"删除失败");
    }

    @Override
    public ResultDto<Object> selTotalOd() {
        List<Orders> orderss = ordersMapper.findAll();
        return new ResultDto<Object>(203,"查询订单总数成功",orderss.size());
    }
}
