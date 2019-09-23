package com.sy.service;

import com.sy.dto.ResultDto;
import com.sy.pojo.Goods;

import java.util.List;

public interface GoodsService {

    /**
     * 查询所有商品
     * @param page 当前的页码
     * @param pageSize 当前的页容量
     * @return
     */
    List<Goods> getAllGoods(Integer page,Integer pageSize);

    ResultDto<Object> addGoods(Goods goods);

    /**
     * 删除多个员工
     * @param gNos
     * @return
     */
    ResultDto<String>deleteGoods(String gNos);

    /**\
     * 获取所有商品总数
     * @return
     */
    ResultDto<Object> selTotalGd();
}

