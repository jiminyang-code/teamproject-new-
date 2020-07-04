package chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello world");
		response.setContentType("text/html");
		PrintWriter write = response.getWriter();
		write.print("<html>");
		write.print("<head>");
		write.print("</head>");
		write.print("<body>");
		write.print("<h1>helloworld</h1>");
		write.print("</body>");
		write.print("</html>");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String fromID = request.getParameter("fromID");
		String toID = request.getParameter("toID");
		String chatContent = request.getParameter("chatContent");
		
		if(fromID == null || fromID.equals("") || toID == null || toID.equals("") ||
				chatContent == null || chatContent.equals("")) {
			response.getWriter().write("0");
		} else { //사용자로부터 건너온 값을 디코딩
			fromID = URLDecoder.decode(fromID, "UTF-8"); 
			toID = URLDecoder.decode(toID, "UTF-8");
			chatContent = URLDecoder.decode(chatContent,"UTF-8");
			response.getWriter().write(new ChatDAO().submit(fromID, toID,chatContent) +"");
		}
		
	}

}
