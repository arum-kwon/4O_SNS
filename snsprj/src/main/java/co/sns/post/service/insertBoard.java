package co.sns.post.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import co.sns.common.BoardListDTO;
import co.sns.post.dao.BoardInsertDAO;

@WebServlet("/insertBoard.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 30, // 파일 한개당 업로드 크기 제한
		maxRequestSize = 1024 * 1024 * 50) // 전체 업로드 크기 제한
public class insertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "common\\img\\upload";

	public insertBoard() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글처리
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String contents = request.getParameter("content");
		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + SAVE_DIR;
		String uploadFile = "";

		// 서버에 savePath에 해당하는 디렉토리가 있는지 확인해서 없으면 만들어라
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			if (!fileName.equals("")) {
				uploadFile = savePath + File.separator + fileName;
				// 이 uploadFile을 dto에 담아서 insert 하면 도니다.

				// 원본 파일명
				File f = new FileRenamePolicy().rename(new File(uploadFile));
				
				part.write(f.getParent() + "\\" + f.getName());
				
				uploadFile = f.getName();
				// 리네임된 파일명

				
			}

		}
				//세션
				HttpSession session = request.getSession(true); 

				//세션 값 가져오기      
				String userid =(String) session.getAttribute("my_id");
				
			// DB작업
			BoardInsertDAO dao = new BoardInsertDAO();
			BoardListDTO dto = new BoardListDTO();
			
			dto.setBoard_content(contents);
			dto.setBoard_img(uploadFile);
			dto.setBoard_user_id(userid);

			String path = null;

			int n = dao.insertBoard(dto);
			System.out.println(n);
			String contextPath = request.getContextPath();
			if (n == 0) {
				path = contextPath + "/views/post/writeFail.tiles";
			} else {
				path = contextPath + "/views/post/writeSuccess.tiles";
			}
			response.sendRedirect(path);

//			response.getWriter().append("<head>\r\n" + 
//					"    <title>META Tag  Refresh</title>\r\n" + 
//					"    <meta http-equiv=\"content-type\" content=\"text/html; charset=euc-kr\">\r\n" + 
//					"    <meta http-equiv=\"refresh\" content=\"1; url=http://localhost" + contextPath + "/views/post/writeForm.tiles\">\r\n" + 
//					"</head>" + uploadFile + "<br>content:" + contents);
			
		
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";

	}
}
