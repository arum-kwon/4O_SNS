package co.sns.member.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import co.sns.common.UserBListDTO;
import co.sns.member.dao.UserDao;
import co.sns.member.vo.UserVo;

@WebServlet("/UserHomeUpdate.do")
public class UserHomeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserHomeUpdateController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int n = 0;
		UserDao dao = new UserDao();
		UserBListDTO vo = new UserBListDTO(); 
		HttpSession session = request.getSession(true);
		String id = (String) session.getAttribute("loginid");
		id="bbb";
		
		String img_name = request.getParameter("profile_img");
		String name = request.getParameter("user_name");
		String info = request.getParameter("user_info");
		String job = request.getParameter("user_job");
		String[] enterArray = request.getParameterValues("interest_enter");
		String[] lifeArray = request.getParameterValues("interest_life");
		String[] hobbyArray = request.getParameterValues("interest_hobby");
		String[] trendsArray = request.getParameterValues("interest_trends");
		
		String enter = "";
		if(enterArray != null) {
			for(int i=0; i<enterArray.length; i++) {
				enter += enterArray[i];
				if(i != enterArray.length-1) {
					enter += ",";
				}
			}
		}
		vo.setInterest_enter(enter);  
		
		String life = "";
		if(lifeArray != null) {
			for(int i=0; i<lifeArray.length; i++) {
				life += lifeArray[i];
				if(i != lifeArray.length-1) {
					life += ",";
				}
			}
		}
		vo.setInterest_life(life); 
		
		String hobby = "";
		if(hobbyArray != null) {
			for(int i=0; i<hobbyArray.length; i++) {
				hobby += hobbyArray[i];
				if(i != hobbyArray.length-1) {
					hobby += ",";
				}
			}
		}
		vo.setInterest_hobby(hobby); 
		
		String trends = "";
		if(trendsArray != null) {
			for(int i=0; i<trendsArray.length; i++) {
				trends += trendsArray[i];
				if(i != trendsArray.length-1) {
					trends += ",";
				}
			}
		}
		vo.setInterest_trends(trends); 
		
		vo.setUser_pro_img_name(img_name);
		vo.setUser_name(name);
		vo.setUser_id(id); 
		vo.setUser_info(info);
		vo.setUser_job(job);
		
		
		n = dao.update(vo);		
		
		ArrayList<UserBListDTO> list = new ArrayList<UserBListDTO>();
		list = dao.select(id);
		
		request.setAttribute("result", n);		
		request.setAttribute("members", list);
		String path = "home/userHomeUpdatepage.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response); 		
	}
}
