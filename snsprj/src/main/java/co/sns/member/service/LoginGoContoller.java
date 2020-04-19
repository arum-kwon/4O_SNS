package co.sns.member.service;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.ConnectionManager;
import co.sns.common.UserListDTO;
import co.sns.member.dao.LoginDAO;

@WebServlet("/LoginGo.do")
public class LoginGoContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Connection conn = ConnectionManager.getConnnection();
		
		UserListDTO dto = new UserListDTO();
		String user_id = request.getParameter("uname");
		String user_pw = request.getParameter("psw");
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);
		dto = LoginDAO.getInstance().selectMember(conn, dto);
		ConnectionManager.close(conn);
		
		
		String contextPath = request.getContextPath();
		String path ="";
		if(dto != null) {
			HttpSession Session = request.getSession();
			Session.setAttribute("my_id", dto.getUser_id());
			Session.setAttribute("my_name", dto.getUser_name());
			Session.setAttribute("my_pro_img_name", dto.getUser_pro_img_name());			
			Session.setAttribute("my_header_img", dto.getUser_header_img());
			Session.setAttribute("my_jdate", dto.getUser_jdate());
			Session.setAttribute("my_info", dto.getUser_info());
			Session.setAttribute("my_birth", dto.getUser_birth());
			Session.setAttribute("my_gender", dto.getUser_gender());
			Session.setAttribute("my_job", dto.getUser_job());
			Session.setAttribute("my_enter", dto.getInterest_enter());
			Session.setAttribute("my_life", dto.getInterest_life());
			Session.setAttribute("my_hobby", dto.getInterest_hobby());
			Session.setAttribute("my_trends", dto.getInterest_trends());

			path = contextPath+ "/timeline.do";
		}else {
			path = contextPath+ "/views/common/LoginFail.jsp";
		}
		response.sendRedirect(path);
		
	}

}  
