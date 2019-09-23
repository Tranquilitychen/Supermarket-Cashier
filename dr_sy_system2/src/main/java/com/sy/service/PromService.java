package com.sy.service;

import com.sy.dto.ResultDto;
import com.sy.pojo.Event;
import com.sy.pojo.EventRecord;

import java.util.List;

public interface PromService {

    List<EventRecord> getAllProm(Integer page, Integer pageSize);

    List<Event> getAllType(Integer page, Integer pageSize);

    ResultDto<EventRecord> addProm(EventRecord eventRecord);

    ResultDto<Event> addType(Event event);

    ResultDto<String> deleteProms(String evNo);

    ResultDto<String> deleteTypes(String etNo);

    /**\
     * 获取所有活动总数
     * @return
     */
    ResultDto<Object> selTotalEt();
}

