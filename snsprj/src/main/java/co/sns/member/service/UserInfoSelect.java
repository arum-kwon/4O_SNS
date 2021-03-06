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
		String id = request.getParameter("user_id");		
		HttpSession session = request.getSession(true); 
		String my_id = (String) session.getAttribute("my_id");
		
		Connection conn = ConnectionManager.getConnnection();
		UserBListDTO vo = new UserBListDTO();
		
		vo.setUser_id(id);
		
		String sub = UserDao.getInstance().subInfo(conn, my_id, id); 
		request.setAttribute("sub", sub);	
		
		ArrayList<UserBListDTO> list = UserDao.getInstance().select(conn, vo, my_id);
		request.setAttribute("boardlist", list);	
		
		UserBListDTO dto = UserDao.getInstance().selectUserInfo2(conn, vo);
		request.setAttribute("member", dto);
		ConnectionManager.close(conn);
				
		String path = "/views/home/userInfoSelect.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
