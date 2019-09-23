package com.sy.service;

import com.sy.dto.ResultDto;
import com.sy.pojo.Employee;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface EmployeeService {

    /**
     *
     * @param page :当前的页码
     * @param pageSize : 当前的页容量
     * @return
     */
    List<Employee> getAllEmpl(Integer page,Integer pageSize);

    /**
     * 员工登录的方法
     * @param employee
     * @return
     */
    ResultDto<Employee> login(Employee employee, HttpServletRequest request);

    /**
     * 添加员工的方法
     * @param employee
     * @return
     */
    ResultDto<Employee> addEmpl(Employee employee);

    /**
     * 更新状态
     * @param eId
     * @param status 1:在职，0:离职
     * @return
     */
    ResultDto<String> updateState(String eId,Integer status);

    /**
     * 删除多个员工
     * @param e_ids
     * @return
     */
    ResultDto<String> deleteEmpls(String e_ids);

    /**
     * 获取所有员工总数
     * @return
     */
    ResultDto<Object> selTotalEmpl();
}
