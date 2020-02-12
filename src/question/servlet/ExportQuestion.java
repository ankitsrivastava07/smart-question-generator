package question.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.dto.QuestionDto;
import question.service.QuestionService;
@WebServlet("/question-set/create")
public class ExportQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionService questionService;
	
	public void init() {
		questionService = new QuestionService();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/admin/question-export.jsp");
		rd.include(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String questionType=request.getParameter("type");
		int numberOfQuestions=Integer.parseInt(request.getParameter("noOfQuestion"));
		List<QuestionDto> questionDtos = questionService.getAllRandomQuestions(questionType, numberOfQuestions);
		request.setAttribute("questions", questionDtos);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/question-export.jsp");
		rd.include(request, response);
		
	}
}
