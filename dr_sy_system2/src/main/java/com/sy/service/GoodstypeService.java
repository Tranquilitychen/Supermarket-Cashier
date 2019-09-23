package com.sy.service;


import com.sy.dto.ResultDto;
import com.sy.pojo.Goodstype;

import java.util.List;


public interface GoodstypeService {

    List<Goodstype> getAllList();

    ResultDto<Goodstype> addList(Goodstype goodstype);

    ResultDto<String>  delList(String gtNos);

    ResultDto<String> updateState(String gtNo, Integer status);

    /**
     * 获取商品类别总数
     * @return
     */
    ResultDto<Object> selTotalGdt();
}
