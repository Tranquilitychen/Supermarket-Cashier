package com.sy.utils;

import java.lang.ref.SoftReference;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PromUtils {

    public static String getPromNum(String evNo){
        if (evNo == null || evNo.isEmpty()){
            return "01";
        }
        String suffix = evNo.substring(10);

        Integer evnum = Integer.valueOf(suffix);

        evnum++;

        Integer len = (evnum+"").length();

        String last = String.valueOf(evnum);

        for (int i = 0; i < 2 - len;i++){
            last = "0" + last;

        }
        return last;
    }

    public static String getUnitId(String evNo){
        return "ZP" + getDataeDir() + getPromNum(evNo);
    }
    public static String getDataeDir(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String format = sdf.format(new Date());
        return format;
    }
}
