package co.sns.post.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sns.common.BoardListDTO;
import co.sns.post.dao.BoardInsertDAO;

@WebServlet("/insertBoard.do")
public class insertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertBoard() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8"); // 한글처리
		 response.setCharacterEncoding("UTF-8");
		 
		 //DB작업
		 BoardInsertDAO dao = new BoardInsertDAO();
		 BoardListDTO dto = new BoardListDTO();
		// String id = (String)session.getAttribute("id");
		 String content = request.getParameter("content");
		 System.out.println("왜.. 겟 파라미터ㅏㄱ 안될까.... ? "+content);
		 dto.setBoard_content(content);
	
		// String img = ;
		 
		 String path = null; 
			int n = dao.insertBoard(dto);
			if (n != 0){
				path="../webapp/views/post/writeForm.jsp";
			}else {
				path="../webapp/views/post/writeForm.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			response.sendRedirect(path);
			
			
	}

}
