package com.sy.web.controller;

import com.sy.dto.ResultDto;
import com.sy.pojo.Goodstype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sy.service.CateService;

@Controller
public class CateController {
	@Autowired
	private CateService cateServiceImpl;
	
	// 1. 1跳转 到 分类列表
	@RequestMapping("/cate/list")
	public String showAllCate(Model model) {
		model.addAttribute("cates", cateServiceImpl.selAllGoodsTypes());
		return "cate/cate-list";
	}

	// 1.2 跳转 到 添加分类
	@RequestMapping("/cate/insertPage")
	public String cateInsertPage() {
		return "cate/cate-add";
	}

	// 1.2 添加顶层父节点页面
    @ResponseBody
	@RequestMapping("/cate/insert")
	public ResultDto<Object> cateInsert(Goodstype goodsType){
		System.out.println("goodsType : " + goodsType);
		return cateServiceImpl.insertGoodsType(goodsType);
	}

	// 1.3 添加子节点页面
	@RequestMapping("/cate/insertChildrenPage")
	public String childrenCate(String gtPno, Integer gtLevel, Model model){
		System.out.println("gtPno:" + gtPno);
		System.out.println("gtLevel:" + gtLevel);

		model.addAttribute("childrenPno", gtPno);
		model.addAttribute("childrenLevel",gtLevel + 1);
		return "cate/cate-add-children";
	}

	// 1.3 添加子节点Controller
	@ResponseBody
	@RequestMapping("/cate/insertChildren")
	public ResultDto<Object> addChildren(Goodstype goodsType){
		return cateServiceImpl.insertGoodsTypeChildren(goodsType);
	}

	// 2.编辑
	// 2.编辑 页面
	@RequestMapping("/cate/updatePage")
	public String updatePage(String gtNo, Model model){
		Goodstype goodsType = cateServiceImpl.selGoodsTypeByNo(gtNo);
		model.addAttribute("updGtNo", gtNo);
		model.addAttribute("updType", goodsType);
		return "cate/cate-edit";
	}

	// 编辑 操作
	@ResponseBody
	@RequestMapping("/cate/update")
	public ResultDto<Object> updCate(Goodstype goodsType){
		return  cateServiceImpl.updGoodsTypeDescript(goodsType);
	}

	// 3.删除 所有
	@ResponseBody
	@RequestMapping("/cate/delAll")
	public ResultDto<Object> delGoodsType(String gtNos){
		return cateServiceImpl.delAllGoodsType(gtNos);
	}

	// 4. 更新 显示状态
	@ResponseBody
	@RequestMapping("/cate/update/state")
	public ResultDto<Object> updCateState(String gtNo, long status){
		return cateServiceImpl.updCateState(gtNo,status);
	}
}
