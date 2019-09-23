package com.sy.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class CommonsUtil {

    /**
     * 创建员工编号
     * @param level 员工等级
     * @param emplNum 最新的员工编号
     * @return
     */
    public static String createEmplNum(Integer level,String emplNum){
        //判断时候从0001开始，
        if (emplNum == null || emplNum.isEmpty()){
            return (level.equals(99) ? "GL" : "SY") + "0001";

        }
        //如果不emplNum为空，那么需要自增
        //拆分，把前缀和数字拆分
        if (emplNum.startsWith("GL") && emplNum.startsWith("SY")){
            //员工编号不正确
            return null;
        }
        //员工编号的前缀
        String prefix = emplNum.substring(0,2);
        //员工编号的后缀
        String suffix = emplNum.substring(2);
        //将后缀转换成数字
        Integer suffixNum = Integer.valueOf(suffix);
        //自增
        suffixNum++;
        //高位补0
        Integer len = (suffixNum+"").length();
        //需要返回的员工编号
        String newsuffix = ""+suffixNum;
        for (int i = 0; i < 4-len; i++) {
            newsuffix = "0"+newsuffix;
        }

        return prefix+newsuffix;
    }

    public static String getUniqueFileName(){
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replaceAll("-","");
        return uuid;
    }

    public static String getExt(String filename) {
        //完整的文件名
        if (filename == null || filename.isEmpty()) {
            return null;
        }
        int index = filename.lastIndexOf(".");
        if (index == -1) {
            //说明没有
            return null;
        }
        return filename.substring(index);
    }
    public static String getDateDir(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String format = sdf.format(new Date());
        return format;
    }
}
