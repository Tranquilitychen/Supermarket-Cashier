package com.sy.web.interceptor;


import com.sy.pojo.Employee;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor{


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o) throws Exception {
        //在调用controller方法之前执行
        //判断用户是否登录
        //是否有session
        HttpSession session = httpServletRequest.getSession();
        //获取session里面保存的用户登录数据
        Employee employee = (Employee) session.getAttribute("login");
        //判断是否为null
        if (employee == null)
        {
            //没有登录
            //怎么跳转到登录界面
            //先获取contextPath
            String contextPath = httpServletRequest.getContextPath();
            response.sendRedirect(contextPath+"/login/page");
            return  false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
