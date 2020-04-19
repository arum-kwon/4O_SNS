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
import co.sns.member.dao.LoginDAO;

@WebServlet("/idCheck.do")
public class idCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		String user_id = request.getParameter("User_id");

		Connection conn = ConnectionManager.getConnnection();
		int n = LoginDAO.getInstance().userIdCheck(conn, user_id);	
		ConnectionManager.close(conn);
		
		request.setAttribute("check", n);
		request.setAttribute("id" ,user_id);
		String path = "views/common/idCheck.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	/**
	 * @return 
	 * @return 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					doGet(request, response);
	}

}
