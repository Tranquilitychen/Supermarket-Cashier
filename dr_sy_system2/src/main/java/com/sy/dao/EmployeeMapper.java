package com.sy.dao;

import com.sy.pojo.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {

    /**
     * 查询所有员工
     * @return
     */
    List<Employee> findAll();

    /**
     * 通过名字查询
     * @param name
     * @return
     */

    Employee findByName(@Param("name") String name);

    /**
     * 保存数据的方法
     * @return
     */
    Integer save(@Param("employee") Employee employee);

    /**
     * 获取最新的员工
     * @param level
     * @return
     */

    Employee getLastEmpl(@Param("level")Integer level);

    /**
     * 更新员工的状态
     * @param eId
     * @return
     */
    Integer updatestate(@Param("eId") String eId,@Param("status") Integer status);

    /**
     * 多条删除
     * @param e_ids
     * @return
     */
    Integer delete(@Param("e_ids") String[] e_ids);
}
