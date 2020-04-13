package co.sns.search.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sns.common.SerKeyListDTO;
import co.sns.search.dao.SearchDAO;
import net.sf.json.JSONArray;

@WebServlet("/hot.do")
public class HotResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HotResult() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 서비스될때 실행됨
		request.setCharacterEncoding("UTF-8"); // 한글처리
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		// 브라우저로 보내는 내용에 대한 한글처리
		PrintWriter out = response.getWriter();

		// DB작업
		SearchDAO dao = new SearchDAO();
		SerKeyListDTO dto = new SerKeyListDTO();
		ArrayList<SerKeyListDTO> hotkeyList = dao.hot();

		
		JSONArray jsonArray = JSONArray.fromObject(hotkeyList);

		out.print(jsonArray.toString());
		
		
		// 정보 입력
		//key.put("keyword", hotkeyList);

//out.print( JSONObject.fromObject(dto).toString());
		/*
		 * JSONArray listNodes = new JSONArray(); //Create a JSON array for the nodes
		 * listNodes.put("hi"); for(int i=0;i<keywordArray.size();i++){
		 * JSONObject.fromObject(keywordArray.get(i)); //JSONObject tmp =
		 * (JSONObject)keywordArray.get(i);//인덱스 번호로 접근해서 가져온다.
		 * 
		 * String keyword = (String)tmp.get("keyword");
		 * 
		 * 
		 * System.out.println("----- "+i+"번째 인덱스 값 -----");
		 * System.out.println("키워드 : "+keyword);
		 * 
		 * }
		 */
	}

}
