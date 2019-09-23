package com.sy.service;

import java.util.List;

import com.sy.dto.ResultDto;
import com.sy.pojo.Goodstype;

public interface CateService {
	//1. 根据 gtNo 查询商品类型
	Goodstype selGoodsTypeByNo(String gtNo);
	// 2. 显示所有的商品分类
	List<Goodstype> selAllGoodsTypes();

	// 3. 添加商品分类（父节点）
	ResultDto<Object> insertGoodsType(Goodstype goodsType);

	// 4. 添加商品分类（子节点）
	ResultDto<Object> insertGoodsTypeChildren(Goodstype goodsType);

	// 5. 编辑商品内容（修改）
	ResultDto<Object> updGoodsTypeDescript(Goodstype goodsType);

	// 6. 删除商品内容(多个, 单个添加 ， )
	ResultDto<Object> delAllGoodsType(String gtNos);

	// 7. 更新 状态
	ResultDto<Object> updCateState(String gtNo, long status);
}
