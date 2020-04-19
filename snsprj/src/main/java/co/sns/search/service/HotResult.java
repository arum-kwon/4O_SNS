package co.sns.search.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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
	static JSONArray jsonArray;
	static JSONObject jsonObj;
	static long last_put = 0;
	static long last_reset = 0;
	
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException {
		
	}
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		// 서비스될때 실행됨
		request.setCharacterEncoding("UTF-8"); // 한글처리
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		// DB작업
		//SearchDAO.timer();
		//request.setAttribute("hotKeywordsList", hotKeywordsList);
		//json.lib 로 파싱
		long time = System.currentTimeMillis();
		long now = time / (1000 * 60); //1분마다
		if((now-last_put) > 1) {
			System.out.println("1분마다ㅠ" + last_put);
			jsonPut();
			last_put = now;
		}
		if((now-last_reset) > 5) { //5분 마다 
			System.out.println("5분마다ㅠ" + last_reset);
			dbReset();
			last_reset = now;
		}
		response.getWriter().append(jsonObj.toString());
		
		//request.getRequestDispatcher("views/search/hotSerchKeywordFormAndView.jsp").forward(request, response);
		
		
	}
	
	protected void jsonPut() {
		ArrayList<SerKeyListDTO> hotKeywordsList = SearchDAO.getInstance().hot();
		jsonArray = JSONArray.fromObject(hotKeywordsList);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put ("keywordList", jsonArray);
		jsonObj = JSONObject.fromObject(map);
		
	}
	protected void dbReset() {
		SearchDAO.getInstance().reset();
	}
	

}
