package co.sns.member.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.BoardListDTO;
import co.sns.common.ConnectionManager;
import co.sns.common.UserBListDTO;
import co.sns.member.dao.UserDao; 

@WebServlet("/BoardView.do")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardViewController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("board_no");
		
		Connection conn = ConnectionManager.getConnnection();
		UserBListDTO vo = new UserBListDTO();
		vo.setBoard_no(Integer.parseInt(id));
		UserBListDTO list = UserDao.getInstance().board_select(conn, vo);
		
		ConnectionManager.close(conn);
		
		request.setAttribute("boards", list);
		
		String path = "/views/home/BoardView.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
