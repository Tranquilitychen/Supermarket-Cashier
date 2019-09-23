package com.sy.dao;

import com.sy.pojo.Goodstype;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodstypeMapper {

    List<Goodstype> allFind();

    Goodstype findByName(@Param("name") String name);

    Integer save(@Param("goodstype") Goodstype goodstype);

    Integer delete(@Param("gt_nos") String[] gt_nos);

    Integer updateState(@Param("gtNo") String gtNo, @Param("status") Integer status);





}
