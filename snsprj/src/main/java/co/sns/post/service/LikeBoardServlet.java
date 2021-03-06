package co.sns.post.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.BoardListDTO;
import co.sns.common.ConnectionManager;
import co.sns.post.dao.LikeBoardDAO;

/**
 * Servlet implementation class BoardLikeServlet
 */
@WebServlet("/LikeBoard.do")
public class LikeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request객체의 parameter값 가져옴, 접속자의 id만 필요하기 때문에 나중에 세션에서 받아오기
		HttpSession session = request.getSession(true); 
		String myId = (String) session.getAttribute("my_id");
		

		//Dao에서 게시글 정보를 가져옴
		Connection conn = ConnectionManager.getConnnection();
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list = LikeBoardDAO.getInstance().getLikeBoardList(conn, myId);
		ConnectionManager.close(conn);

		//request객체에 담아 forward로 보냄
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/post/likeBoardList.tiles");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
