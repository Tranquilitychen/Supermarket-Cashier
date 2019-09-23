package com.sy.web.controller;


import com.github.pagehelper.PageInfo;
import com.sy.pojo.Orders;
import com.sy.pojo.ProcurmentRecord;
import com.sy.service.ProcurmentRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ProcurmentRecordController {

    @Autowired
    private ProcurmentRecordService procurmentRecordService;

    @RequestMapping("/pm/list")
    public String list(Model model,
                       @RequestParam(name = "page", defaultValue = "1") Integer page,
                       @RequestParam(name = "pageSize", defaultValue = "6") Integer pageSize){
        List<ProcurmentRecord> procurmentRecords = procurmentRecordService.getAllPm(page,pageSize);
        PageInfo<ProcurmentRecord> pageInfo = new PageInfo<>(procurmentRecords);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("procurmentRecords", procurmentRecords);

        return "pm/procurmentrecord-list";
    }
}
