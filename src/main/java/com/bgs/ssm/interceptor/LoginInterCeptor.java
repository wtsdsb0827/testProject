package com.bgs.ssm.interceptor;

import com.bgs.ssm.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//使用拦截器对登录信息进行安全验证
public class LoginInterCeptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//1.获取请求路径并进行登录
		String uri = request.getRequestURI();
		if(uri.indexOf("/login")>0) {
			return true;
		}
		
		//2.将user存放到session中
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			return true;
		}
		
		
		//3.如果登录不成功，就返回重新登录
		request.setAttribute("msg", "你没有当前权限，请重新登录");
		request.getRequestDispatcher("jsps/login/login.jsp").forward(request, response);
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
