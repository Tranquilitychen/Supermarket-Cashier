package com.sy.service.impl;

import com.github.pagehelper.PageHelper;
import com.sy.dao.PromMapper;
import com.sy.dto.ResultDto;
import com.sy.pojo.Event;
import com.sy.pojo.EventRecord;
import com.sy.service.PromService;
import com.sy.utils.PromUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class PromServceImpl implements PromService {

    @Autowired
    public PromMapper promMapper;

    @Override
    public List<EventRecord> getAllProm(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        return promMapper.findAll();
    }


    @Override
    public ResultDto<EventRecord> addProm(EventRecord eventRecord) {

        //因为需要我们手动的去处理员工编号
        //上一个SY0001=>SY0002

        //1.先去查询编号最新的一个员工 limit1
        EventRecord lastProm = promMapper.getLastProm();
        eventRecord.setEvNo(PromUtils.getUnitId(lastProm==null?null:lastProm.getEvNo()));

        Integer save = promMapper.Save(eventRecord);
        if (save > 0) {
            return new ResultDto<>(200, "保存成功");
        }

        return new ResultDto<>(2001, "保存失败");
    }

    @Override
    public ResultDto<Event> addType(Event event) {
        Integer rows = promMapper.SaveType(event);
        if(rows >0)
        {
            return new ResultDto<>(200,"保存成功");
        }

        return new ResultDto<>(2001, "保存失败");
    }

    @Override
    public ResultDto<String> deleteProms(String evNo) {
        if(evNo == null || evNo.isEmpty())
        {
            return new ResultDto<>(5001, "删除数据异常");
        }
        String[] evNos = evNo.split(",");
        Integer rows = promMapper.delete(evNos);
        if(rows >0)
        {
            return new ResultDto<>(200,"删除成功");
        }
        return new ResultDto<>(5002, "删除失败");
    }

    @Override
    public ResultDto<String> deleteTypes(String etNo) {
        if (etNo == null || etNo.isEmpty()) {
            return new ResultDto<>(5001, "删除数据异常");
        }

        String[] etNos = etNo.split(",");
        Integer rows = promMapper.deleteType(etNos);
        if (rows > 0) {
            return new ResultDto<>(200, "删除成功");
        }
        return new ResultDto<>(5002, "删除失败");
    }

    /**
     * 获取所有活动总数
     * @return
     */
    @Override
    public ResultDto<Object> selTotalEt(){
        List<EventRecord> eventRecords = promMapper.findAll();
        return new ResultDto<Object>(204,"查询活动总数成功",eventRecords.size());
    }

    @Override
    public List<Event> getAllType(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        return promMapper.findAllType();
    }
    /**
     * 获取所有活动总数
     * @return
     */
    /*@Override
    public ResultDto<Object> selTotalEt(){
        List<EventRecord> eventRecords = promMapper.findAll();
        return new ResultDto<>(204,"查询活动总数成功",eventRecords.size());
        *//*return new ResultDto<>(204,"查询活动总数成功",eventRecords.size());*//*
    }*/
}
