package question.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.service.QuestionService;

@WebServlet("/question/delete")
public class DeleteQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionService questionsService;

	public void init() {
		this.questionsService = new QuestionService();
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("questionId " + request.getParameter("questionId"));

		long questionId = Long.parseLong(request.getParameter("questionId"));

		questionsService.delete(questionId);
		
		response.sendRedirect("/Question-Generation-System/question/list");

	}

}
