package co.sns.sub.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.ConnectionManager;
import co.sns.common.SubListDTO;
import co.sns.common.UserBListDTO;
import co.sns.member.dao.UserDao;
import co.sns.sub.dao.SubDao;

@WebServlet("/subList.do")
public class ScListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ScListController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);  //세션가저오기 없다면 생성
		String id = (String) session.getAttribute("my_id");
		
		Connection conn = ConnectionManager.getConnnection();
		SubListDTO vo = new SubListDTO();						
		vo.setFrom_id(id);
		ArrayList<UserBListDTO> list = SubDao.getInstance().select(conn, vo);		
		ConnectionManager.close(conn);		
		
		request.setAttribute("members",list); //결과값을 싫어 주는 구문
		String path = "/views/sub/subList.tiles";  //보여줄 페이지
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


}
