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

@WebServlet("/question-set/list")
public class FilterByQuestionType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionService questionService=null;
    public FilterByQuestionType() {
    	questionService=new QuestionService();
    }
    
    public void doGet() {
    	
    }
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		String questionType=request.getParameter("type");
		List<QuestionDto> list=questionService.filterByQuestionType(questionType);
		request.setAttribute("questionsList", list);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/question-list.jsp");
	}

}
