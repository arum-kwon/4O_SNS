package co.sns.post.service;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.ConnectionManager;
import co.sns.post.dao.ClickLikeDAO;

@WebServlet("/ClickLikeServlet.do")
public class ClickLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request객체의 parameter값 가져옴, 접속자의 id만 필요하기 때문에 나중에 세션에서 받아오기
		HttpSession session = request.getSession(true); 
		String myId = (String) session.getAttribute("my_id");
		String bn = request.getParameter("board_no");
		String bLike = request.getParameter("bLike");
		
		int boardNo = 0;
		if(bn != null) {
			boardNo = Integer.parseInt(bn);
		}
		
		Connection conn = ConnectionManager.getConnnection();
		if(bLike.equals("1")) {
			ClickLikeDAO.getInstance().updateUnLike(conn, myId, boardNo);
		}else {
			ClickLikeDAO.getInstance().updateLike(conn, myId, boardNo);
		}
		ConnectionManager.close(conn);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
