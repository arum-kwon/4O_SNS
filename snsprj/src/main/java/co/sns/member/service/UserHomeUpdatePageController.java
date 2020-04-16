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

@WebServlet("/userHomeUpdatePage.do")
public class UserHomeUpdatePageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserHomeUpdatePageController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		String id = (String) session.getAttribute("my_id");
			
		
		Connection conn = ConnectionManager.getConnnection();
		UserBListDTO vo = new UserBListDTO();
		vo.setUser_id(id);
		UserBListDTO UserListDTO = UserDao.getInstance().selectUserInfo(conn, vo);
		request.setAttribute("userinfo", UserListDTO);				
		ConnectionManager.close(conn);
				
		String path = "/views/home/userHomeUpdatepage.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response); 

	}


}
