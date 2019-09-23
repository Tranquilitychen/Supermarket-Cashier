package com.sy.service.impl;

import com.github.pagehelper.PageHelper;
import com.sy.dao.EmployeeMapper;
import com.sy.dto.ResultDto;
import com.sy.pojo.Employee;
import com.sy.service.EmployeeService;
import com.sy.utils.CommonsUtil;
import com.sy.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class EmployeeServiceImpl implements EmployeeService {


    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAllEmpl(Integer page,Integer pageSize) {
        //做分页
        PageHelper.startPage(page,pageSize);

        return employeeMapper.findAll();
    }

    /**
     * 登录的方法
     * @param employee
     * @return
     */
    @Override
    public ResultDto<Employee> login(Employee employee, HttpServletRequest request) {
        if (employee == null){
            return new ResultDto<>(1001,"登录数据异常");
        }
        //验证用户名
        if (employee.getERfid() == null || employee.getERfid().isEmpty()){
            return new ResultDto<>(1002,"用户名数据错误");
        }
        //通过DAO去查询数据库
        Employee dbEmpl = employeeMapper.findByName(employee.getERfid());
        //验证是否有该员工
        if (dbEmpl == null){
            return new ResultDto<>(1003,"该员工不存在");
        }
        if (dbEmpl.getEState()==0){
            return new ResultDto<>(1005,"您已离职或被锁定，请联系管理员!");
        }
        //比对密码
        if (!dbEmpl.getEPassword().equals(MD5Util.MD55(employee.getEPassword()))){
            return new ResultDto<>(1004,"密码错误");
        }

        //保存登录成功的session数据
        //1.获取session对象
        HttpSession session = request.getSession();
        //2.将登录成功的session数据保存到session域对象中
        session.setAttribute("login",dbEmpl);

        return new ResultDto<>(200,"登录成功");

    }

    /**
     * 添加员工
     * @param employee
     * @return
     */
    @Override
    public ResultDto<Employee> addEmpl(Employee employee) {

        //因为需要我们手动的去处理员工编号
        //上一个SY0001=>SY0002

        //1.先去查询编号最新的一个员工 limit1
        Employee lastEmpl = employeeMapper.getLastEmpl(employee.getELevel());
        //2.得到员工编号=>在当前员工的编号基础之上加1
        String emplNum = CommonsUtil.createEmplNum(employee.getELevel(),lastEmpl==null?null:lastEmpl.getEId());
        //3.再将最新的员工编号添加到employee对象里面
        employee.setEId(emplNum);
        //4.直线调用mapper进行保存
        employee.setEPassword(MD5Util.MD55(employee.getEPassword()));



        Integer save = employeeMapper.save(employee);
        if (save > 0 ){
            return new ResultDto<>(200,"保存成功");
        }

        return new ResultDto<>(2001,"保存失败");
    }

    /**
     * 更新状态
     * @param eId
     * @param status 1:在职，0:离职
     * @return
     */
    @Override
    public ResultDto<String> updateState(String eId, Integer status) {

        if (eId == null || eId.isEmpty() || status == null){
            return new ResultDto<>(4001,"更新数据异常!");
        }
        Integer rows = employeeMapper.updatestate(eId, status);

        if (rows > 0){
            return new ResultDto<>(200,"更新状态成功!");
        }

        return new ResultDto<>(4002,"更新状态失败!");
    }

    /**
     * 删除多个员工
     * @param eIds 员工编号的字符串，中间用,隔开
     * @return
     */
    @Override
    public ResultDto<String> deleteEmpls(String eIds) {
        if (eIds == null || eIds.isEmpty()){
            return new ResultDto<>(5001,"删除数据异常!");

        }
            //eIds = "SY0001,SY0002"
            //eIds 转换成字符串数组
            String[] e_ids = eIds.split(",");
            //调用DAO
            Integer rows = employeeMapper.delete(e_ids);
            if (rows > 0){
                return new ResultDto<>(200,"删除成功!");
            }

        return new ResultDto<>(5002,"删除失败!");

    }

    /**
     * 获取员工总数
     * @return
     */

    @Override
    public ResultDto<Object> selTotalEmpl(){
        List<Employee> employees = employeeMapper.findAll();
        return new ResultDto<Object>(200,"查询成功",employees.size());
    }
    /*@Override
    public ResultDto<Object> selTotalEmpl() {
        List<Employee> employees = employeeMapper.findAll();
        return new ResultDto<>(200, "查询员工总数成功", employees.size());
    }*/
}

