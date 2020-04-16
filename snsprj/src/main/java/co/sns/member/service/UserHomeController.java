package co.sns.member.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sns.common.UserBListDTO;
import co.sns.member.dao.UserDao;

@WebServlet("/userHome.do")
public class UserHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserHomeController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		HttpSession session = request.getSession(true);  //세션가저오기 없다면 생성
		String id = (String) session.getAttribute("loginid");
		id ="bbb";//임시 테스트용
		
		UserDao dao = new UserDao();		
		UserBListDTO userBListDTO = dao.selectUserInfo(id);
		
		session.setAttribute("my_id", userBListDTO.getUser_id());
		session.setAttribute("my_header_img", userBListDTO.getUser_header_img());
		session.setAttribute("my_pro_img_name", userBListDTO.getUser_pro_img_name());
		session.setAttribute("my_jdate", userBListDTO.getUser_jdate());		
		session.setAttribute("my_birthage", userBListDTO.getUser_birthage()); 
		session.setAttribute("my_gender", userBListDTO.getUser_gender());
		session.setAttribute("my_job", userBListDTO.getUser_job());
		session.setAttribute("my_enter", userBListDTO.getInterest_enter());
		session.setAttribute("my_life", userBListDTO.getInterest_life());
		session.setAttribute("my_hobby", userBListDTO.getInterest_hobby());
		session.setAttribute("my_trends", userBListDTO.getInterest_trends());
		
				
		/*
		 * String search1 = request.getParameter("search");
		 * 
		 * if (search1 == null) { search1 = ""; }
		 * 
		 * request.setAttribute("search1", search1);
		 */
		request.setAttribute("userBListDTO", userBListDTO);
		ArrayList<UserBListDTO> list = new ArrayList<UserBListDTO>();
		list = dao.select(id);
		
		request.setAttribute("mboards", list);
		String path = "/views/home/userHome.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
