package user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Constants;
import user.dto.UserDto;
import user.service.UserService;

@WebServlet("/signin")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;

	public LoginServlet() {
		userService = new UserService();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDto userDto = userService.findUserByNameAndPassword(email, password);
		
		if (userDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userDto.getUserId());
			session.setAttribute("name", userDto.getUserName());
			response.sendRedirect(Constants.APP_URL+"/welcome");
		} else {
			response.getWriter().println("<h2>Invalid Username or Password! </h2>");
			//response.sendRedirect(Constants.APP_URL);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
	        rd.include(request, response); 
		}
	}

}
