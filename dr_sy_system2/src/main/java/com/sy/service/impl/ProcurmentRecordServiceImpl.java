package com.sy.service.impl;

import com.github.pagehelper.PageHelper;
import com.sy.dao.ProcurmentRecordMapper;
import com.sy.pojo.ProcurmentRecord;
import com.sy.service.ProcurmentRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProcurmentRecordServiceImpl implements ProcurmentRecordService {

    @Autowired
    private ProcurmentRecordMapper procurmentRecordMapper;

    @Override
    public List<ProcurmentRecord>getAllPm(Integer page,Integer pageSize){
        //做分页
        PageHelper.startPage(page,pageSize);
        return procurmentRecordMapper.findAll();
    }


}
