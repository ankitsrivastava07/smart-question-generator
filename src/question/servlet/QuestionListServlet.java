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

@WebServlet("/question/list")
public class QuestionListServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private QuestionService questionService=null;
	
	public QuestionListServlet(){
		questionService = new QuestionService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	  
		response.setContentType("text/html");
		List<QuestionDto> questionList=questionService.getAllQuestions();
    
      request.setAttribute("questions",questionList);	
   	  RequestDispatcher rd = request.getRequestDispatcher("/admin/question-list.jsp");
   	  rd.include(request,response); 
	
	}
}
