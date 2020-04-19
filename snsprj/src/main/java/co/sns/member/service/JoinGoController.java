package co.sns.member.service;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sns.common.ConnectionManager;
import co.sns.common.UserListDTO;
import co.sns.member.dao.LoginDAO;

/**
 * Servlet implementation class JoinGoController
 */
@WebServlet("/JoinGo.do")
public class JoinGoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinGoController() {
        super();
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Connection conn = ConnectionManager.getConnnection();
		
		UserListDTO dto = new UserListDTO();
		
		String pro_img = request.getParameter("User_pro_img_name");
		String id = request.getParameter("User_id");
		String name = request.getParameter("User_name");
		String pw = request.getParameter("User_pw");
		
		dto.setUser_id(id);
		dto.setUser_name(name);
		dto.setUser_pro_img_name(pro_img);
		dto.setUser_pw(pw);
		
		int n = 0;
		n =  LoginDAO.getInstance().JoinInsert(conn, dto);
		ConnectionManager.close(conn);
		

		String contextPath = request.getContextPath();
		String path = contextPath + "/views/common/joinSuccess.jsp";
		//RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		//dispatcher.forward(request, response);
		

		response.sendRedirect(path);
	}

}
