package co.sns.search.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.BoardListDTO;

import co.sns.search.dao.SearchDAO;

@WebServlet("/SerchResult.do")
public class SerchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SerchResult() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 서비스될때 실행됨

		request.setCharacterEncoding("UTF-8"); // 한글처리
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8"); // 브라우저로 보내는 내용에 대한 한글철리
		
		//세션 작업
		HttpSession session = request.getSession(true); 

		//세션 값 가져오기      
		String userid =(String) session.getAttribute("my_id");


		// DB작업
		SearchDAO dao = new SearchDAO();
		BoardListDTO dto = new BoardListDTO();

		String searchedKey = request.getParameter("search");
	    ArrayList<Map<String, Object>> searchList;
		searchList = dao.getResultList(searchedKey, userid);
		int searchKeyword = dao.serch(searchedKey);
	
		dao.serch(searchedKey);
		
		// request객체에 실어주는 구문
		request.setAttribute("searchedPosts", searchList);
		String path = "/views/search/searchResultView.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

}
