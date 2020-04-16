package co.sns.member.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.ConnectionManager;
import co.sns.common.UserBListDTO;
import co.sns.member.dao.UserDao; 

/**
 * Servlet implementation class UserInfoSelect
 */
@WebServlet("/UserInfoSelect.do")
public class UserInfoSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserInfoSelect() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		String id = request.getParameter("id");		
		
		Connection conn = ConnectionManager.getConnnection();
		UserBListDTO vo = new UserBListDTO();
		vo.setUser_id(id);
		ArrayList<UserBListDTO> list = UserDao.getInstance().select(conn, vo);	
		request.setAttribute("members", list);			
		ConnectionManager.close(conn);
				
		String path = "/views/home/userInfoSelect.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
