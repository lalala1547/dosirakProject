package com.join.myapp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.join.dto.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
        HttpSession httpSession = request.getSession();
        UserVO user = (UserVO)httpSession.getAttribute("user");
        
        if(user == null || user.getUser_grade() != 1) {
			response.sendRedirect("/signin");
			return false;
		}

        return true;
    }
}