package com.sy.service.impl;

import com.github.pagehelper.PageHelper;
import com.sy.dao.GoodsMapper;
import com.sy.dto.ResultDto;
import com.sy.pojo.Goods;
import com.sy.service.GoodsService;
import com.sy.utils.GoodsNoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;


    @Override
    public List<Goods> getAllGoods(Integer page, Integer pageSize) {

        PageHelper.startPage(page,pageSize);

        return goodsMapper.selAllGoods();
    }

    /**
     * 删除多个员工
     * @param gNos 商品编号的字符串  中间用 , 隔开
     * @return
     */
    @Override
    public ResultDto<String> deleteGoods(String gNos) {

        if (gNos == null || gNos.isEmpty()){
            return new ResultDto<>(5001,"删除数据异常");
        }

        //将gNos转换成字符串数组
        String[] g_nos = gNos.split(",");
        //调用DAO
        //受影响的行数
        Integer rows = goodsMapper.delete(g_nos);
        if (rows > 0){
            return new ResultDto<>(200,"删除成功!");
        }
        return new ResultDto<>(5002,"删除失败!");
    }

    /**
     * 获取所有商品总数
     * @return
     */

    @Override
    public ResultDto<Object> selTotalGd() {
        List<Goods> goodss = goodsMapper.selAllGoods();
        return new ResultDto<Object>(201,"查询商品总数成功",goodss.size());
    }


    /**
     * 添加员工
     * @param goods 类
     * @return
     */
    @Override
    public ResultDto<Object> addGoods(Goods goods) {

        Goods maxGoods = goodsMapper.getlastgNo(goods.getGtNo());
        //获取最大的商品编号
        String maxGNo = maxGoods.getGNo();
        //调用生成商品号的方法
        String gNo = GoodsNoUtil.createGoodsNo(maxGNo);
        goods.setGNo(gNo);
        System.out.println("goods:"+goods);


        Integer index = goodsMapper.addGoods(goods);
        //spring事务回滚
        if (index>0){
            return new ResultDto<>(200,"添加成功!");
        }else{
            return new ResultDto<>(2002,"添加失败");
        }



    }

}
