package co.sns.post.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.CommentListDTO;
import co.sns.common.ConnectionManager;
import co.sns.post.dao.CommentInsertDAO;

@WebServlet("/CommentInsertServlet.do")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true); 
		String myId = (String) session.getAttribute("my_id");
		String str_no = request.getParameter("board_no");
		String content = request.getParameter("content");
		int board_no = 0;
		if(str_no != null) {
			board_no = Integer.parseInt(str_no);
		}
		
		CommentListDTO dto = new CommentListDTO();
		dto.setBoard_no(board_no);
		dto.setComment_content(content);
		dto.setUser_id(myId);
		
		//Dao에서 처리
		Connection conn = ConnectionManager.getConnnection();
		int n = CommentInsertDAO.getInstance().insertComment(conn, dto);
		ConnectionManager.close(conn);
		
		// sendRedirect로 보냄
		String contextPath = request.getContextPath();
		String path = contextPath+"/BoardDetailServlet.do?board_no="+board_no;
		response.sendRedirect(path);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
