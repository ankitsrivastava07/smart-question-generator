package user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ErrorDetail;
import user.exception.EmailAlreadyExists;
import user.service.UserService;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet{
	private UserService userservice;
	
	
	public RegistrationServlet(){
		 userservice= new UserService();
	}
	
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		PrintWriter out =res.getWriter();
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		try {
			boolean isCreated = userservice.create(email, password);
			req.setAttribute("isCreated", isCreated);
			RequestDispatcher rd = req.getRequestDispatcher("/user/register-success.jsp");
			rd.include(req, res);
		} catch (EmailAlreadyExists e) {
			ErrorDetail error =new ErrorDetail();
			error.setMessage(e.getMessage());
			req.setAttribute("error",error);
			RequestDispatcher rd = req.getRequestDispatcher("/user/register.jsp");
			rd.include(req, res);
		}
		
	}
	
	@Override
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/user/register.jsp");
		req.setAttribute("error",null);
		try {
			rd.include(req, res);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
}
