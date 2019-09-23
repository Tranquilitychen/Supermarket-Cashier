package com.sy.web.controller;


import com.github.pagehelper.PageInfo;
import com.sy.dto.ResultDto;
import com.sy.pojo.Employee;
import com.sy.service.EmployeeService;
import com.sy.utils.CommonsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class EmployeeController {


    @Autowired
    private EmployeeService employeeService;


    @RequestMapping("/empl/list")
    public String list(Model model,
                       @RequestParam(name = "page",defaultValue = "1") Integer page,
                       @RequestParam(name = "pageSize",defaultValue = "4") Integer pageSize){
        //调用service去获取数据
        List<Employee> employees = employeeService.getAllEmpl(page,pageSize);

        //封装成pageInfo
        PageInfo<Employee> pageInfo = new PageInfo<>(employees);
        //将数据转发到employee-list.jsp页面
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("employees",employees);
        //返回视图
        return "empl/employee-list";
    }

    /**
     * 员工的添加页面
     * */
    @RequestMapping("/empl/add")
    public String add(){
        return "empl/employee-add";
    }


    /**
     * 添加员工的方法
     * */
    @PostMapping("/empl/add/action")
    @ResponseBody   //表示返回
    public ResultDto<Employee> addAction(Employee employee){

        return employeeService.addEmpl(employee);
    }


    @RequestMapping("empl/upload/header")
    @ResponseBody
    public ResultDto<String> upload(MultipartFile header){
        if (header == null || header.isEmpty()){
            return new ResultDto<>(2002,"文件异常");
        }
        //先获取文件的名字
        String filename = header.getOriginalFilename();
        String uniqueFileName = CommonsUtil.getUniqueFileName();
        String ext = CommonsUtil.getExt(filename);
        if (ext==null){
            return new ResultDto<>(2004,"文件后缀有问题！");
        }
        //获取文件保存的位置
        String path ="D:\\Java\\IdeaProjects\\dr_sy_system2\\upload";
        String dateDir = CommonsUtil.getDateDir();
        String newFileName = uniqueFileName+ext;
        String savePath = dateDir+"/"+newFileName;
        //抽象出上传文件的File对象
        File savePathFile = new File(path, dateDir);

        if (!savePathFile.exists()) {
            //创建文件夹

            savePathFile.mkdirs();
        }

        File file = new File(savePathFile,newFileName);
        //上传文件

        try {
            header.transferTo(file);
            return new ResultDto<>(200,"上传成功",savePath);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResultDto<>(2003,e.getMessage());
        }
    }

    /**
     * 更新状态
     * @param eId
     * @param status
     * @return
     */
    @RequestMapping("/empl/update/state")
    @ResponseBody
    public ResultDto<String> updateState(String eId,Integer status){

        return employeeService.updateState(eId,status);
    }

    /**
     * 多条删除员工
     * @param eIds
     * @return
     */
    @RequestMapping("/empl/delete")
    @ResponseBody
    public ResultDto<String> deleteEmpls(String eIds){
        return employeeService.deleteEmpls(eIds);
    }

    @ResponseBody
    @RequestMapping("/empl/show")
    public List<Employee> getEmployee(){
        List<Employee> list = employeeService.getAllEmpl(1,3);
        System.out.println("list:" + list);
        return list;
    }
}
