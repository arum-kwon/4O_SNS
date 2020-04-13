package co.sns.sub.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sns.common.ConnectionManager;
import co.sns.common.UserListDTO;
import co.sns.sub.dao.SubToMeDao;


/**
 * Servlet implementation class GetSubToMeList
 */
@WebServlet("/SubToMe.do")
public class GetSubToMeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request객체의 parameter값 가져옴, 접속자의 id만 필요하기 때문에 나중에 세션에서 받아오기
		String myId = request.getParameter("id");
		
		//Dao에서 나를 구독하는 사람의 프로필 정보를 가져옴
		Connection conn = ConnectionManager.getConnnection();
		ArrayList<UserListDTO> list = SubToMeDao.getInstance().getToMeList(conn, myId);
		ConnectionManager.close(conn);
		
		//request객체에 담아 forward로 보냄
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/sub/subToMeList.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
