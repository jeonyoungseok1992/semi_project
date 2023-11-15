package com.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.board.model.service.BoardServiceImpl;
import com.semi.board.model.vo.Board;
import com.semi.common.MyFileRenamePolicy;
import com.semi.common.model.vo.Attachment;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("옴");
		
		if(ServletFileUpload.isMultipartContent(request)) { //지금 전달해준게 멀티파트로 되어있니?
			
			//1_1) 용량 크기제한 설정
			int maxSize = 10 * 1024 * 1024;
			
			//1_2) 물리적 저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfile/"); //realPath로 webapp에서부터 시작
		
			//2. 전달된 파일명 수정작업 후 서버에 업로드	request에 담겨있는 파일이 선언 순간 저장됨
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//3. sql문 실행에 필요한 값 추출해서 vo에 저장
			
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String boardTitle = multiRequest.getParameter("title");
			int amount = Integer.parseInt(multiRequest.getParameter("amount"));
			String boardContent = multiRequest.getParameter("content");
			
			System.out.println(boardNo);
			System.out.println(boardTitle);
			System.out.println(amount);
			System.out.println(boardContent);
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setBoardTitle(boardTitle);
			b.setAmount(amount);
			b.setBoardContent(boardContent);
			
			ArrayList<Attachment> atlist = new ArrayList<Attachment>();
			for(int i = 1; i <5 ; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key) != null) {
					//첨부파일이 존재할 경우
					//Attachment 생성 + 원본명, 수정된파일명, 폴더경로, 파일레벨 저장해서 => list에 담기
					
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/thumbnail_upfile/");
					at.setRefBoardNo(boardNo);
					
					atlist.add(at);	
				}
			}
			
			int result = new BoardServiceImpl().updateBoard(b, atlist);
			
			if (result > 0) { //성공 => jsp/list.th로 url요청
				request.getSession().setAttribute("alertMsg", "성공적으로 등록하였습니다.");
				response.sendRedirect(request.getContextPath() +"/detailPage.bo?bno=" + boardNo);
			} else { //실패 => 에러
				request.setAttribute("errorMsg", "등록에 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
