package co.sns.member.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import co.sns.common.ConnectionManager;
import co.sns.common.UserBListDTO;
import co.sns.member.dao.UserDao; 

@WebServlet("/UserHomeUpdate.do")
public class UserHomeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserHomeUpdateController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserBListDTO vo = new UserBListDTO();
		
		
		HttpSession session = request.getSession(true);
		String id = (String) session.getAttribute("my_id");
		
		String img_name = request.getParameter("profile_img");
		String name = request.getParameter("user_name");
		String info = request.getParameter("user_info");
		String job = request.getParameter("user_job");
		String gender = request.getParameter("user_gender");
		String enter = request.getParameter("interest_enter");
		String life = request.getParameter("interest_life");
		String hobby = request.getParameter("interest_hobby");
		String trends = request.getParameter("interest_trends");
		
		
		vo.setUser_pro_img_name(img_name);
		vo.setUser_name(name);
		vo.setUser_info(info);
		vo.setUser_job(job);
		vo.setUser_gender(gender);
		vo.setInterest_enter(enter);
		vo.setInterest_life(life);
		vo.setInterest_hobby(hobby);
		vo.setInterest_trends(trends);
		
		Connection conn = ConnectionManager.getConnnection();		
		vo.setUser_id(id); 
		
		int n = 0;
		n = UserDao.getInstance().update(conn, vo);
				
		
		/* n = dao.update(vo); */		
		
		String path = "/snsprj/userHome.do";
		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		 * dispatcher.forward(request, response);
		 */
		response.sendRedirect(path);
	}
}
