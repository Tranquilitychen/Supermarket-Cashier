package com.sy.service.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.sy.dto.ResultDto;
import com.sy.pojo.Goods;
import com.sy.pojo.Goodstype;
import com.sy.utils.CateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sy.dao.CateMapper;
import com.sy.service.CateService;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service
@Transactional(rollbackFor = Exception.class)
public class CateServiceImpl implements CateService{
	@Autowired
	private CateMapper cateMapper;

    /**
     * 1. 查询所有的商品类型
     * @return
     */
	@Override
	public List<Goodstype> selAllGoodsTypes() {
		return cateMapper.selAll();
	}

    @Override
	public Goodstype selGoodsTypeByNo(String gtNo){
        return cateMapper.selTypeForGtNo(gtNo);
    }

	/**
	 *  2. 插入顶层父节点
	 * @return
	 */
	@Override
	public ResultDto<Object> insertGoodsType(Goodstype goodsType) {
		// 查询是否存在父节点
        Goodstype repeatType = cateMapper.selGoodsTypeRepeat(goodsType);

		if (repeatType != null){
			return new ResultDto<>(2012, "商品已存在");
		}

		int index = 0;
		try{
			// -----------下方为插入操作--------------
            Goodstype lastGoodsType = cateMapper.selLastGoodsType();
			// 完善goodType

			// 商品类型等级
			goodsType.setGtLevel(1);
			// 商品类型状态
			goodsType.setGtState(1);
			// 顶层父节点的GtPno
			goodsType.setGtPno("00000000");
			// 顶层父节点没有子节点
			goodsType.setGtIsparent(0);

			// 商品类型id
			CateUtil cateUtil = new CateUtil();
			goodsType.setGtNo(cateUtil.createCateNum(goodsType.getGtPno(), lastGoodsType.getGtNo()));

			System.out.println(goodsType);

			index = cateMapper.insGoodsTypeParent(goodsType);
		}catch (Exception e){
			e.printStackTrace();
			return new ResultDto<>(2011, "插入数据库异常");
		}

		if(index == 1){
			return new ResultDto<>(200, "添加商品类别成功！");
		}else{
			return new ResultDto<>(2010, "添加商品类别失败！");
		}
	}

	/**
	 *  3.插入子节点
	 * @param goodsType
	 * @return
	 */
	@Override
	public ResultDto<Object> insertGoodsTypeChildren(Goodstype goodsType) {
		// 1.查询是否存在子节点 （根据姓名查询）
        Goodstype repeatType = cateMapper.selGoodsTypeRepeat(goodsType);
		if (repeatType != null){
			return new ResultDto<>(2012, "商品已存在");
		}

		// 2. 插入子节点
		int index = 0;
		try{
			// 插入的是子节点，所以知道前缀，直接搜索后缀添加即可
            String prefix = goodsType.getGtPno().substring(0,4);
            // 搜索子节点的中的最大的节点
            String maxGtNo = cateMapper.selChildrenType(prefix);

			// 完善goodType
			// 商品类型状态
			goodsType.setGtState(1);
			// 添加的节点没有子节点
			goodsType.setGtIsparent(0);

			// 商品类型id
			CateUtil cateUtil = new CateUtil();

            System.out.println("完善前：" + goodsType + " :  最大的节点：" + maxGtNo);
			goodsType.setGtNo(cateUtil.createCateNum(goodsType.getGtPno(), maxGtNo));
            System.out.println("完善后：" + goodsType);

            // 开始插入
            index += cateMapper.insGoodsTypeParent(goodsType);
            System.out.println(index);
            // 插入完成后需要对 父节点 的 isParent 进行修改为1
            index += cateMapper.updGoodsTypeIsParent(1, goodsType.getGtPno());
		}catch (Exception e){
			e.printStackTrace();
			// 事务回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return new ResultDto<>(2011, "插入数据库异常");
		}

		if(index == 2){
			return new ResultDto<>(200, "添加商品类别成功！");
		}else{
			return new ResultDto<>(2010, "添加商品类别失败！");
		}
	}

    /**
     *  4.编辑 节点 信息
     * @param goodsType
     * @return
     */
    @Override
    public ResultDto<Object> updGoodsTypeDescript(Goodstype goodsType) {
        int index = 0;
        try{
            index += cateMapper.updGoodsTypeDescript(goodsType);
        }catch (Exception e){
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return new ResultDto<>(2021, "修改数据出现异常");
        }

        if(index == 1){
            return new ResultDto<>(200, "修改商品类别成功！");
        }else{
            return new ResultDto<>(2020, "修改商品类别失败！");
        }
    }

    /**
     * 5. 删除商品内容(多个)
     * @param gtNos
     * @return
     */
    @Override
    public ResultDto<Object> delAllGoodsType(String gtNos) {
        // 每次开始前，清空静态变量中的 set数据
        set.clear();

        if (gtNos == null || gtNos.isEmpty()){
            return new ResultDto<>(2030, "删除异常！！");
        }
        Integer rows = 0;

        try{
            // 删除前需要完成
            // 切分字符串。
            String[] gt_nos = gtNos.split(",");
            // 0. 判断删除节点是否有商品在使用，出现商品存在，提示不可删除.
            List<Goods> goods = cateMapper.selGoodsByGtNo(gt_nos);
            if (goods.size() != 0){
                return new ResultDto<>(2032, "该节点有商品在使用,不可删除", goods);
            }

            // 1. 查询删除节点是否为父节点，如果是父节点： 删除其下所有子节点
            // 1.1 声明需要删除的子节点
            String deleteGtNos = selGtNo(gtNos);

            deleteGtNos = deleteGtNos.substring(1,deleteGtNos.length() - 1);

            System.out.println("需要删除的所有节点：" + deleteGtNos);

            // 1.2 删除完成前，查询当前节点的父节点修改 is_parent 为 0
            for (String gtNo: gt_nos) {
                // 遍历 节点
                Goodstype goodstype = cateMapper.selTypeForGtNo(gtNo);
                System.out.println("需要进行修改的父节点：" + goodstype);
                // 判断父节点是不是 00000000 如果是 为顶层父节点，不需要进行修改
                if (goodstype.getGtPno() != "00000000" || !goodstype.getGtPno().equals("00000000")){
                    // 修改父节点的 子节点数为 0
                    rows += cateMapper.updGoodsTypeIsParent(0, goodstype.getGtPno());
                }
            }

            // 2.删除节点
            String[] delete = deleteGtNos.split(",");
            System.out.println("需要删除的节点的数组：" + Arrays.toString(delete));
            rows += cateMapper.delAllGoodsType(delete);

            System.out.println("rows:" + rows);
            System.out.println("gt_nos:" + gt_nos.length);
        }catch (Exception e){
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return new ResultDto<>(2030, "删除异常！！");
        }

        if (rows > 0){
            return new ResultDto<>(200, "删除成功！");
        }
        return new ResultDto<>(2031, "删除失败");
    }

    @Override
    public ResultDto<Object> updCateState(String gtNo, long status) {
        if(gtNo == null || gtNo.isEmpty()){
            return new ResultDto<>(2040, "参数为null异常！！");
        }

        int index = 0;
        try {
            index += cateMapper.updCateState(gtNo, status);
        }catch (Exception e){
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return new ResultDto<>(2041, "更新状态异常！！");
        }

        if (index == 1){
            return new ResultDto<>(200, "更新状态成功！");
        }

        return new ResultDto<>(2041, "更新状态失败！！");
    }


    private Set<String> set = new HashSet<>();
    // 获取当前节点下的所有子节点（包括当前节点，可以是多个节点，用 '，' 分隔）
    private String selGtNo(String gtNos){
        // 切割字符串，获取 当前 节点
        String[] gt_nos = gtNos.split(",");
        System.out.println("需要删除的节点:" + Arrays.toString(gt_nos));

    /*    // 用于记录需要删除的节点
        StringBuilder sb = new StringBuilder();*/
        // 遍历所有的 子节点
        for (int i = 0; i < gt_nos.length; i++){
            set.add(gt_nos[i]);

            System.out.println("当前操作节点：" + gt_nos[i]);
            // 获取当前 子 节点的所有信息
            Goodstype goodstype = cateMapper.selTypeForGtNo(gt_nos[i]);
            // 判断当前节点是否是 父节点， 如果不是父节点 则已经是最小子节点了，需要删除
            if (goodstype.getGtIsparent() == 0){
                System.out.println("已经是最小节点了");
                /*sb.append(goodstype.getGtNo() + ",");*/
                set.add(goodstype.getGtNo());
            }else{
                // 遍历 当前的子节点 是否还存在子节点。
                for (Goodstype child : cateMapper.selGoodsTypeByGtNo(gt_nos[i])) {
                    System.out.println("子节点:" + child);
                    // 子节点为 的 isparent 为 1 ,说明存在还存在子节点。
                    if (child.getGtIsparent() == 1){
                        // 还存在子节点就进行 递归操作
                        String str =  selGtNo(child.getGtNo());
                        System.out.println("子节点的 子节点 ：" +  str);
                    }else{
                        //  == 0 就说明没有字节点，为最小子节点
                        set.add(child.getGtNo());
                        /*sb.append(child.getGtNo() + ",");*/
                    }
                }

                System.out.println("所有的子节点：" + set.toString());
                /*System.out.println("所有子节点:" + sb.toString());*/
            }

            System.out.println("***遍历操作" + gt_nos[i] + " 结束***");
            System.out.println("-------------------------------");
        }
        System.out.println("所有节点遍历完成");
        System.out.println("-------------------------------");

        // 判断是需要递归还是 直接返回数据
        return set.toString();
    }


}
