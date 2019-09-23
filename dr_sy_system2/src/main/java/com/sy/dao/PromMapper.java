package com.sy.dao;

import com.sy.pojo.Event;
import com.sy.pojo.EventRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PromMapper {

    List<EventRecord> findAll();

    EventRecord getLastProm();

    List<Event> findAllType();

    /**
     * 保存数据的方法
     * @return
     */
    Integer Save(@Param("eventRecord") EventRecord eventRecord);

    Integer delete(@Param("evNos") String[] evNos);

    Integer deleteType(@Param("etNos") String[] etNos);

    Integer SaveType(@Param("event") Event event);


}




