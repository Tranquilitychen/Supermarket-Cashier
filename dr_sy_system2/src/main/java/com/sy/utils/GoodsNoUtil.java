package com.sy.utils;

public class GoodsNoUtil {
    /**
     *  创建商品编号 在最大的商品标号上 + 1
     * @param g_no 最大的商品标号
     * @return
     */
    public static String createGoodsNo(String g_no){
        // 1. 取出 商品的类别编号 进行前缀剪切
        String prefix = g_no.substring(0,8);

        // 2. 剪切后缀
        String suffix = g_no.substring(8, 14);

        // 3. 转数字
        Integer no = Integer.parseInt(suffix);

        // 添加  + 1
        no++;

        //高位补0
        Integer len = (no + "").length();

        // 4. 后缀字符串 +no 直接数字变字符串
        String newsuffix = "" + no;

        for (int i = 0; i < 6-len; i++) {
            newsuffix = "0"+newsuffix;
        }
        return prefix + newsuffix;
    }

}
