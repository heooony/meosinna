package kosta.down;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downLoads")
public class DownLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   doPost(request, response);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 넘어오는 파일의 이름을 받기
		String fName = request.getParameter("fileName");
		//2. 저장폴더의 실제 경로를 얻어오기
		String saveDir=request.getServletContext().getRealPath("/save");
		File file = new File(saveDir, fName);
		
				
		//3. 폴더에서 파일이름에 해당하는 파일을 읽어서 
		//클라이언트 브라우져에서 다운로드(출력=쓰기)
		FileInputStream  fi = new FileInputStream(file);
		ServletOutputStream so = response.getOutputStream();//클라이언트쪽으로 내려보낼(다운로드) 출력(저장) 준비
		
		byte b [] = new byte [1024];
	   
		int i=0;
		while((i = fi.read(b) ) != -1){
			so.write(b);
		}
		
		so.flush();
		fi.close();
		so.close();
		
	}

}






