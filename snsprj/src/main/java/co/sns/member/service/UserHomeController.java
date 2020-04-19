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

@WebServlet("/userHome.do")
public class UserHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserHomeController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		HttpSession session = request.getSession(true);  //세션가저오기 없다면 생성
		String id = (String) session.getAttribute("my_id");
		
		Connection conn = ConnectionManager.getConnnection();
		UserBListDTO vo = new UserBListDTO();
		vo.setUser_id(id);
		UserBListDTO dto = UserDao.getInstance().selectUserInfo2(conn, vo);
		request.setAttribute("userinfo", dto);				

		ArrayList<UserBListDTO> bdto = UserDao.getInstance().select(conn, vo);
		request.setAttribute("bdtolist", bdto);
		ConnectionManager.close(conn);		
		/*
		 * String search1 = request.getParameter("search");
		 * 
		 * if (search1 == null) { search1 = ""; }
		 * 
		 * request.setAttribute("search1", search1);
		 */			
		
		
		String path = "/views/home/userHome.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
