package com.sy.service.impl;


import com.github.pagehelper.PageHelper;
import com.sy.dao.GoodstypeMapper;
import com.sy.dto.ResultDto;
import com.sy.pojo.Goodstype;
import com.sy.service.GoodstypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class GoodstypeServiceImpl implements GoodstypeService {

    @Autowired
    private GoodstypeMapper goodstypeMapper;

    @Override
    public List<Goodstype> getAllList(){

        return goodstypeMapper.allFind();

    }

    @Override
    public ResultDto<Goodstype> addList(Goodstype goodstype){

        Integer save = goodstypeMapper.save(goodstype);
        if (save > 0){
            return new ResultDto<>(200,"保存成功");
        }
        return new ResultDto<>(2001,"保存失败");

    }
    @Override
    public ResultDto<String> delList(String gtNos){
        if(gtNos == null || gtNos.isEmpty()){
            return new ResultDto<>(8001,"数据删除异常");
        }
        String[] gt_nos = gtNos.split(",");

        Integer rows = goodstypeMapper.delete(gt_nos);

        if (rows > 0){
            return new ResultDto<>(200,"删除成功");
        }
        return new ResultDto<>(8002,"删除失败!");
    }
    @Override
    public ResultDto<String> updateState(String gtNo,Integer status) {
        if (gtNo== null || gtNo.isEmpty() || status == null) {
            return new ResultDto<>(4001, "更新数据异常!");
        }
        Integer rows = goodstypeMapper.updateState(gtNo, status);
        if (rows > 0){
            return new ResultDto<>(200,"更新状态成功!");

        }
        return new ResultDto<>(4002,"更新状态失败！");

    }

    @Override
    public ResultDto<Object> selTotalGdt() {
        List<Goodstype> goodstypes = goodstypeMapper.allFind();
        return new ResultDto<Object>(202,"查询商品类别成功",goodstypes.size());
    }

}
