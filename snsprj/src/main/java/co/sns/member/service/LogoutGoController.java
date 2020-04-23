package co.sns.member.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutGoController
 */
@WebServlet("/LogoutGo.do")
public class LogoutGoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutGoController() {
       
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	
    	HttpSession session= request.getSession();
    	session.removeAttribute("my_id");
    	 
    	String contextPath = request.getContextPath();
		String path = contextPath + "/views/common/Logout.jsp";
		
		response.sendRedirect(path);
    }


}
