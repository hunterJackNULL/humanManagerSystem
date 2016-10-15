package com.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.UserDaoImpl;
import com.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
public class AffairServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoImpl userDaoImpl = new UserDaoImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		String methodNameWithSlash = servletPath.substring(0,servletPath.length()-3);
		String methodName = methodNameWithSlash.substring(1);
		System.out.println(methodName);
		try {
			Method method = getClass().getDeclaredMethod(methodName,HttpServletRequest.class,
					HttpServletResponse.class);
			try {
				method.invoke(this, request,response);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	//µÇÂ¼²Ù×÷
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		int role = -1;
		if(userType.equals("user")){
			role = 1;
		}else if(userType.equals("admin")){
			role = 0;
		}
		int result = userDaoImpl.checkUser(name, password, role);
		String path = "/pages/error.jsp";
		switch (result) {
		case 0:
			path = "/pages/login.jsp";
			request.setAttribute("error", "ÃÜÂë´íÎó!!!!!!!!!");
			request.getRequestDispatcher(path).forward(request,response);
			break;
		case 1:
			if(role == 0){
			path = "/pages/mainAdmin.jsp";
			}else{
				path = "/pages/mainUser.jsp";
			}
			User currentUser = new User(name,password,role);
			request.getSession().setAttribute("currentUser", currentUser);
			response.sendRedirect(request.getContextPath()+path);
			break;
		case -1:
			path = "/pages/login.jsp";
			request.setAttribute("error", "ÓÃ»§²»´æÔÚ!!!!!!!!!");
			request.getRequestDispatcher(path).forward(request,response);
			break;
		default:
			break;
		}
	
	}
	//×¢²á²Ù×÷
	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		int role = userType.equals("user")?1:0;
		User user = new User(name,password,role);
		userDaoImpl.addUser(user);
		request.getRequestDispatcher("/pages/success.html").forward(request, response);
	}
	//logout
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
	}
	protected void checkName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("userName");
		System.out.println(name);
		if(userDaoImpl.userNameExists(name)){
			response.getWriter().print("not ok");
		}else{
			response.getWriter().print("ok");
		}
	}
	protected void password(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User)request.getSession().getAttribute("currentUser");
		String path = null;
		if(user.getRole()==0){
			path = "/pages/mainAdmin.jsp";
		}else{
			path = "/pages/mainUser.jsp";
		}
		request.setAttribute("mainPage", "/pages/password.jsp");
		request.getRequestDispatcher(path).forward(request, response);
	}
	protected void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String newPwd = request.getParameter("newPwd");
		userDaoImpl.changePassword(userName, newPwd);
		response.getWriter().print("success");
	}
	protected void checkCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkCode = request.getParameter("checkCode");
		String realCheckCode = (String)request.getSession().getAttribute("checkCode");
		if(!checkCode.equals(realCheckCode)){
			response.getWriter().print("not ok");
		}else{
			response.getWriter().print("ok");
		}
	}
	}

