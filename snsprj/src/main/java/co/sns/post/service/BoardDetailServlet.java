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
import co.sns.common.CommentListDTO;
import co.sns.common.ConnectionManager;
import co.sns.post.dao.BoardDetailDAO;

@WebServlet("/BoardDetailServlet")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str_no = request.getParameter("board_no");
		int board_no = 0;
		if(str_no != null) {
			board_no = Integer.parseInt(str_no);
		}
		

		//Dao에서 게시글 정보를 가져옴
		Connection conn = ConnectionManager.getConnnection();
		HashMap<String, Object> boardMap = new HashMap<String, Object>();
		boardMap = BoardDetailDAO.getInstance().getBoardInfo(conn, board_no);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list = BoardDetailDAO.getInstance().getComment(conn, board_no);
		
		ConnectionManager.close(conn);
		
		//request객체에 담아 forward로 보냄
		
		//보드 정보 출력
//		BoardListDTO bdto = (BoardListDTO) boardMap.get("board");
//		if(bdto != null) {
//			System.out.println(bdto.getBoard_no());
//			System.out.println(bdto.getBoard_user_id());
//			System.out.println(bdto.getBoard_content());
//			System.out.println(boardMap.get("user_name"));
//			System.out.println(boardMap.get("user_pro_img_name"));
//		}
//		
//		if(list != null && list.size() != 0) {
//			for(HashMap<String, Object> map : list) {
//				CommentListDTO cdto = (CommentListDTO) map.get("comment");
//				System.out.println(cdto.getComment_no());
//				System.out.println(cdto.getBoard_no());
//				System.out.println(cdto.getWdate());
//				System.out.println(cdto.getComment_content());
//				System.out.println(cdto.getUser_id());
//
//				System.out.println(map.get("user_name"));
//				System.out.println(map.get("user_pro_img_name"));
//			}
//		}
		request.setAttribute("board", boardMap);
		request.setAttribute("commentList", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/post/boardDetail.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
