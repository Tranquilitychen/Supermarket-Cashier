package com.sy.dao;

import java.util.List;

import com.sy.pojo.Goods;
import com.sy.pojo.Goodstype;
import org.apache.ibatis.annotations.Param;

public interface CateMapper {
	// 1. 查询商品分类信息
	List<Goodstype> selAll();

	// 1.0 根据商品 gtNo 查询商品
	Goodstype selTypeForGtNo(@Param("gtNo") String gtNo);

	// 1.1 查询最后一个 商品分类信息
	Goodstype selLastGoodsType();

	// 1.2 查询商品分类信息是否存在
	Goodstype selGoodsTypeRepeat(Goodstype goodsType);

	// 1.3 查询gtNo类型中 商品子节点 的 最大的id
	String selChildrenType(String gtNo);

	// 2.插入顶层节点
	int insGoodsTypeParent(Goodstype goodsType);

	// 3. 更新节点的 isParent
	int updGoodsTypeIsParent(@Param("gtIsparent") long gtIsparent, @Param("gtNo") String gtNo);

	// 3.1 更新 节点的 描述，名称，备注
	int updGoodsTypeDescript(Goodstype goodsType);

	// 3.2 更新 节点状态
	int updCateState(@Param("gtNo") String gtNo, @Param("status") long status);

	// 4.1 删除 多个 商品内容
	Integer delAllGoodsType(@Param("gt_nos") String[] gt_nos);

	// 4.2 查询节点是否被商品占用
	List<Goods> selGoodsByGtNo(@Param("gt_nos") String[] gt_nos);

	// 4.3 查询删除节点的所有子节点
	List<Goodstype> selGoodsTypeByGtNo(@Param("gtNo") String gtNo);

	// 4.4 更新删除节点的 isParent 与 gtLevel


}
