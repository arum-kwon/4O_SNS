package co.sns.member.service;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sns.common.UserListDTO;
import co.sns.member.dao.LoginDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		LoginDAO dao = new LoginDAO();
		UserListDTO spj = new UserListDTO();
		try {
		System.out.println(request.getParameter("User_pro_img_name"));	
		System.out.println(request.getParameter("User_id"));
		spj.setUser_id(request.getParameter("User_id"));
		spj.setUser_name(request.getParameter("User_name"));
		spj.setUser_pw(request.getParameter("User_pw"));
		spj.setUser_header_img(request.getParameter("User_header_img"));
		spj.setUser_pro_img_name(request.getParameter("User_pro_img_name"));
		spj.setUser_job(request.getParameter("User_job"));
		spj.setUser_gender(request.getParameter("User_gender"));
		spj.setUser_birth(Date.valueOf(request.getParameter("User_birth")));
		spj.setUser_info(request.getParameter("User_info"));
		spj.setInterest_enter(request.getParameter("Interest_enter"));
		spj.setInterest_life(request.getParameter("Interest_life"));
		spj.setInterest_hobby(request.getParameter("Interest_hobby"));
		spj.setInterest_trends(request.getParameter("Interest_trends"));		
		
		}catch(NumberFormatException e){
			
		}catch(Exception e) {			
			
		}			
		String path = null;
		int n = dao.userListInsert(spj);
		
		if(n != 0) path="Login.do";
		
		//RequestDispatcher  dispatcher = request.getRequestDispatcher("tiles/main.jsp");
		
		response.sendRedirect("tiles/main.jsp");
		
	}

}
