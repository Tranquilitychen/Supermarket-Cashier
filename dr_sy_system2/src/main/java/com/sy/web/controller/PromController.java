package com.sy.web.controller;

import com.github.pagehelper.PageInfo;

import com.sy.dto.ResultDto;
import com.sy.pojo.Event;
import com.sy.pojo.EventRecord;
import com.sy.service.PromService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PromController {

    @Autowired
    public PromService promService;

    @RequestMapping("/prom/list")
    public String list(Model model,
                       @RequestParam(name = "page", defaultValue = "1") Integer page,
                       @RequestParam(name = "pageSize", defaultValue = "4") Integer pageSize) {

        List<EventRecord> proms = promService.getAllProm(page, pageSize);

        PageInfo<EventRecord> pageInfo = new PageInfo<>(proms);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("prom", proms);
        return "prom/prom-list";
    }

    @RequestMapping("/type/list")
    public String listType(Model model,
                           @RequestParam(name = "page", defaultValue = "1") Integer page,
                           @RequestParam(name = "pageSize", defaultValue = "4") Integer pageSize) {
        // 调用service 去获取数据
        List<Event> types = promService.getAllType(page, pageSize);
        // 封装成pageInfo
        PageInfo<Event> pageInfo1 = new PageInfo<>(types);
        // 将数据转发到 employee-list.jsp
        model.addAttribute("pageInfo1", pageInfo1);
        model.addAttribute("type", types);
        return "type/type-list";
    }

    @RequestMapping("/prom/add")
    public String promAdd()
    {
        return "prom/prom-add";
    }

    @PostMapping("/prom/add/action")
    @ResponseBody
    public ResultDto<EventRecord> addAction(EventRecord eventRecord)
    {
        return promService.addProm(eventRecord);
    }

    @RequestMapping("/prom/delete")
    @ResponseBody
    public ResultDto<String> deleteProms(String evDo)
    {
        return promService.deleteProms(evDo);
    }

    @RequestMapping("/type/delete")
    @ResponseBody
    public ResultDto<String> deleteType(String etNo)
    {
        return promService.deleteTypes(etNo);
    }

    @RequestMapping("/prom/edit")
    public String promEdit()
    {
        return "prom/prom-edit";
    }

    @RequestMapping("/prom/detail")
    public String promDetail()
    {
        return "prom/prom-detail";
    }

    @RequestMapping("/type/add")
    public String TypeAdd()
    {
        return "type/type-add";
    }

    @RequestMapping("/type/add/action")
    @ResponseBody
    public ResultDto<Event> typeAddAction(Event event)
    {
        return promService.addType(event);
    }

}
