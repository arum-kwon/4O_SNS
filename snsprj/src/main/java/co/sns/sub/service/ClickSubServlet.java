package co.sns.sub.service;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.ConnectionManager;
import co.sns.sub.dao.ClickSubDao;

@WebServlet("/ClickSubServlet.do")
public class ClickSubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		  //request객체의 parameter값 가져옴, 접속자의 id만 필요하기 때문에 나중에 세션에서 받아오기
		  HttpSession session = request.getSession(true); 
		  String myId = (String) session.getAttribute("my_id"); // 내위치
		  String yourId = request.getParameter("from_id"); // 상대위치      
		  String subCheck = request.getParameter("subCheck"); // 상대위치    
		  
		  
		  Connection conn = ConnectionManager.getConnnection();
		  if(subCheck.equals("1")) { 
		  //구독중인 상태일때 
			  ClickSubDao.getInstance().subDelete(conn, yourId, myId);
		  }else { 
			  //구독 안 하다가 구독함
			  ClickSubDao.getInstance().subInsert(conn, myId, yourId);
		  }
	      ConnectionManager.close(conn);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}