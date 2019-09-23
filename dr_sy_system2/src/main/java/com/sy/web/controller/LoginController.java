package com.sy.web.controller;

import com.sy.dto.ResultDto;
import com.sy.pojo.Employee;
import com.sy.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    //注入的注解
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/login/page")
    public String loginPage(){
        return "login";
    }
    /**
     * 登录的方法
     * */
    @RequestMapping("/login/action")
    @ResponseBody
    public ResultDto<Employee> login(Employee employee, HttpServletRequest request){
        System.out.println(employee);
        return employeeService.login(employee,request);
    }

    /**
     * 退出登录的方法*/
    @RequestMapping ("/logout")
    public String logout(HttpServletRequest request){
        //清空session
        //1.先获取session对象
        HttpSession session = request.getSession();
        //2.将保存的session数据置为null
        session.setAttribute("login","null");
        return "login";

    }
}