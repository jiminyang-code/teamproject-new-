package chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatListServlet
 */
@WebServlet("/ChatListServlet")


public class ChatListServlet extends HttpServlet {
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
		String listType = request.getParameter("listType");
		
		if(fromID == null || fromID.equals("") || toID == null || toID.equals("") ||
				listType == null || listType.equals("")) 
			response.getWriter().write("0");
		 else if(listType.equals("ten")) response.getWriter().write(getTen(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8")));
		 else {
			 try {
				response.getWriter().write(getID(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"),listType)); //특정 아이디값으로 대화가져오기
			} catch (Exception e) {
				response.getWriter().write("");
			}
		 }
	}
	
	public String getTen(String fromID, String toID) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatDTO> chatList = chatDAO.getChatListByRecent(fromID, toID, 10);
		if(chatList.size()==0) return "";
		
		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \""+chatList.get(i).getFromID()+ "\"},");
			result.append("{\"value\": \""+chatList.get(i).getToID()+ "\"},");
			result.append("{\"value\": \""+chatList.get(i).getChatContent()+ "\"},");
			result.append("{\"value\": \""+chatList.get(i).getChatTime()+ "\"}]");
			
			if(i != chatList.size() -1) result.append(","); //마지막 원소가 아닐 경우
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getChatID()+ "\"}");
		return result.toString();
	}
	
	public String getID(String fromID, String toID, String chatID) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatDTO> chatList = chatDAO.getChatList(fromID, toID, chatID);
		if(chatList.size()==0) return ""; //비어있을때 공백 출력
		
		for(int i=0; i< chatList.size(); i++) { //실제 대화정보 출력
			result.append("[{\"value\": \""+chatList.get(i).getFromID()+ "\"},");
			result.append("{\"value\": \""+chatList.get(i).getToID()+ "\"},");
			result.append("{\"value\": \""+chatList.get(i).getChatContent()+ "\"},");
			result.append("{\"value\": \""+chatList.get(i).getChatTime()+ "\"}]");
			
			if(i != chatList.size() -1) result.append(", ");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getChatID()+ "\"}");
		return result.toString();
	}
	
	
}
