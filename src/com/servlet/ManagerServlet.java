package com.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.impl.PersonDaoImpl;
import com.entity.Person;
import com.entity.User;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class ManagerServlet
 */
@WebServlet("*.action")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonDaoImpl personDaoImpl = new PersonDaoImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String servletPath = request.getServletPath();
		String methodNameWithSlash = servletPath.substring(0,servletPath.length()-7);
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
	
	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Person> personsList = new ArrayList<Person>();
		personsList = personDaoImpl.getPersonsList();
		request.setAttribute("mainPage", "/pages/hrBuild.jsp");
		request.setAttribute("hrBuildList", personsList);
		request.setAttribute("pageSize", 8);
		request.setAttribute("page", 1);
		request.setAttribute("pageCode", 1);
		request.getRequestDispatcher("/pages/mainAdmin.jsp").forward(request, response);
	}
	protected void person(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Person person = personDaoImpl.getPerson(id);
		//System.out.println(person.toString());
		request.setAttribute("person", person);
		request.setAttribute("mainPage", "/pages/alter.jsp");
		request.getRequestDispatcher("/pages/mainAdmin.jsp").forward(request, response);
	}
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		//System.out.println(person.toString());
		personDaoImpl.deleteById(id);
		list(request, response);
	}
	protected void alter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String data = request.getParameter("data");
		JSONObject json = JSONObject.fromObject(data);
		personDaoImpl.updatePerson(json.getInt("workId"),
									json.getString("name"), 
									json.getString("introduction"),
									json.getInt("id"));
		response.getWriter().print("success");
		/*Person person = personDaoImpl.getPerson(id);
		//System.out.println(person.toString());
		request.setAttribute("person", person);
		request.setAttribute("mainPage", "/pages/alter.jsp");
		request.getRequestDispatcher("/pages/mainAdmin.jsp").forward(request, response);
	*/}
	protected void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		request.setAttribute("mainPage", "/pages/add.jsp");
		request.getRequestDispatcher("/pages/mainAdmin.jsp").forward(request, response);
	}
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String data = request.getParameter("data");
		JSONObject json = JSONObject.fromObject(data);
		Person person = new Person();
		person.setWorkId(json.getInt("workId"));
		person.setName(json.getString("name")); 
		person.setIntroduction(json.getString("introduction"));
		personDaoImpl.addPerson(person);
		response.getWriter().print("success");
	}
	protected void search(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//s_hrBuildName
		String searchData = request.getParameter("s_hrBuildName");
		List<Person> personsList = new ArrayList<Person>();
		personsList = personDaoImpl.getPersonsListByMessage(searchData);
		request.setAttribute("mainPage", "/pages/hrBuild.jsp");
		request.setAttribute("hrBuildList", personsList);
		request.getRequestDispatcher("/pages/mainAdmin.jsp").forward(request, response);
	}
	protected void blank(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User)request.getSession().getAttribute("currentUser");
		String path = null;
		if(user.getRole()==0){
			path = "/pages/mainAdmin.jsp";
		}else{
			path = "/pages/mainUser.jsp";
		}
		request.setAttribute("mainPage", "/pages/blank.jsp");
		request.getRequestDispatcher(path).forward(request, response);
	}
}
