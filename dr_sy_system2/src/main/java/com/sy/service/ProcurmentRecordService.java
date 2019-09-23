package com.sy.service;

import com.sy.pojo.ProcurmentRecord;

import java.util.List;

public interface ProcurmentRecordService {

    List<ProcurmentRecord>getAllPm(Integer page, Integer pageSize);
}
