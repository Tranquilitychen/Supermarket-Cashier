package com.sy.web.controller;


import com.github.pagehelper.PageInfo;
import com.sy.dto.ResultDto;
import com.sy.pojo.Goods;
import com.sy.pojo.Goodstype;
import com.sy.service.GoodsService;
import com.sy.service.GoodstypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class GoodsController {

    //注入属性

    @Autowired
    private GoodsService goodsServiceImpl;

    @Autowired
    private GoodstypeService goodstypeServiceImpl;


    @RequestMapping("/goods/list")
    public String goodsPage(Model model,
                            @RequestParam(name = "page",defaultValue = "1") Integer page,
                            @RequestParam(name = "pageSize",defaultValue = "3") Integer pageSize) {

        //调用service去获取数据
        List<Goods> goods = goodsServiceImpl.getAllGoods(page,pageSize);
        //封装成pageInfo
        PageInfo<Goods> pageInfo = new PageInfo<>(goods);
        //将数据转发到goods-list.jsp
        //将数据转发到goods-list.jsp
        model.addAttribute("goods",goods);
        model.addAttribute("total",goods.size());
        model.addAttribute("pageInfo",pageInfo);

        //返回视图
        return "goods/goods-list";
    }

    /*@ResponseBody
    @RequestMapping("showPageInfo")
    public PageInfo<Goods> pageInfo(){
        List<Goods> goods = goodsServiceImpl.selAllGoods();

        // 封装成pageInfo
        PageInfo<Goods> pageInfo = new PageInfo<>(goods);
        // 将数据转发到 employee-list.jsp
        return pageInfo;
    }*/

    /**
     * 商品的添加页面
     * @return
     */
    /**
     * 商品的添加页面
     * @return
     */
    @RequestMapping("/goods/add")
    public String add(Model model){

        //调用service获取数据
        List<Goodstype> goodstypes =goodstypeServiceImpl.getAllList();
        model.addAttribute("goodstypes", goodstypes);

        return "goods/goods-add";
    }

    /**
     * 添加商品的方法
     * @param goods
     * @return
     */
    //web请求的映射

    @RequestMapping("/goods/add/action")
    //用于ajax异步请求

    @ResponseBody
    public ResultDto<Object> addAction(Goods goods){
        ResultDto<Object> objectResultDto = goodsServiceImpl.addGoods(goods);
        return objectResultDto;
    }

    /**
     * 多条删除商品
     * @param gNos
     * @return
     */
    @RequestMapping("/goods/delete")
    @ResponseBody
    public ResultDto<String>deletegoods(String gNos){
            return goodsServiceImpl.deleteGoods(gNos);
    }
}
