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
		String myId = request.getParameter("id");
		

		//Dao에서 게시글 정보를 가져옴
		Connection conn = ConnectionManager.getConnnection();
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list = LikeBoardDAO.getInstance().getLikeBoardList(conn, myId);
		ConnectionManager.close(conn);

		//request객체에 담아 forward로 보냄
//		if(list != null && list.size() != 0) {
//			for(HashMap<String, Object> map : list) {
//				BoardListDTO dto = (BoardListDTO) map.get("board");
//				System.out.println(dto.getBoard_no());
//				System.out.println(dto.getBoard_user_id());
//				System.out.println(dto.getBoard_content());
//
//				System.out.println(map.get("user_name"));
//				System.out.println(map.get("pro_img"));
//			}
//			
//		}
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/post/likeBoardList.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
