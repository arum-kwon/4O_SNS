package co.sns.search.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		PrintWriter out = response.getWriter();
		out.print("이것이 실행됩니다.");

		// DB작업
		SearchDAO dao = new SearchDAO();
		BoardListDTO dto = new BoardListDTO();

		String searchedKey = request.getParameter("search");
		ArrayList<BoardListDTO> searchList = dao.getResultList(searchedKey);
		int searchKeyword = dao.serch(searchedKey);
		System.out.println("--쿼리가 제대로 안되나?--" + searchList);
		System.out.println("-----");
		System.out.println("겟 파라미터로 받아온 값 : " + searchedKey);
		System.out.println("-----");
		
		dao.serch(searchedKey);

		System.out.println("dto가 제대로 넘어가나??");
		System.out.println(dto);

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
