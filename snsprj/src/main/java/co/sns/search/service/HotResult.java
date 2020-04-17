package co.sns.search.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sns.search.dao.SearchDAO;
import co.sns.common.SerKeyListDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
	
		// DB작업
		final SearchDAO dao = new SearchDAO();
		SerKeyListDTO dto = new SerKeyListDTO();
		ArrayList<SerKeyListDTO> hotKeywordsList = dao.getInstance().hot();
		request.setAttribute("hotKeywordsList", hotKeywordsList);
		
		JSONArray jsonArray = JSONArray.fromObject(hotKeywordsList);
		

		Map<String, Object> map = new HashMap<String,Object>();
		map.put ("keywordList", jsonArray);
		JSONObject jsonObj = JSONObject.fromObject(map);
		
		response.getWriter().append(jsonObj.toString());
		
//		request.getRequestDispatcher("views/search/hotSerchKeywordFormAndView.jsp").forward(request, response);
		
		
	}

}
