package com.sy.utils;

import com.sy.pojo.Goodstype;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class CateUtil {

    /**
     *  创建商品类别编号
     *  0001 0000 -> 0001 0001
     *  0001 0000 -> 0002 0000
     *
     *   1. 需要判断是父节点，还是子节点
     *   2. 父节点的话，判断gt_pno是否存在 如果是00000000则在末尾添加新的父节点
     *      子节点的话，判断gt_pno是多少，切割进行自增。
     *
     * @param gtPno  当前节点的父节点 id
     * @param compareGtNo 当前前缀下的最大节点 的 id
     * @return
     */
    public static String createCateNum(String gtPno, String compareGtNo){

        // gtPno 00060003
        // 最后一个 00080000
        // gtIsparent 0

        // 在 0006003 后面添加 子节点 0006004
        if (gtPno == "00000000"){
            // 说明是父节点，compareGtNo 为父节点中最大的节点
            gtPno = compareGtNo;
        }

        String prefix = gtPno.substring(0,4);
        String suffix = gtPno.substring(4, 8);

        Integer num1 = Integer.parseInt(prefix);
        Integer num2 = Integer.parseInt(suffix);

        // 不相等说明不是父节点，添加到是子节点，此时compareGtNo为子节点中GtNO最大节点
        if (gtPno == compareGtNo){
            num1 ++;
        }else{
            // 当需要在后位添加的时候调用
            String newSuffix = compareGtNo.substring(4,8);
            System.out.println("需要填充后位" + compareGtNo + "     " +  newSuffix);
            num2 = Integer.parseInt(newSuffix) + 1;
        }

        // 高位补零
        return suffixZore(num1) + suffixZore(num2);
    }

    private static String suffixZore(Integer num){
        Integer len = (num+"").length();
        // 需要的返回的员工编号 的新的后缀
        String strNum = "" + num;

        for (int i = 0; i < 4 - len; i++) {
            strNum = "0"+strNum;
        }
        return strNum;
    }




}
