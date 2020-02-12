package question.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.dto.QuestionDto;
import question.dto.QuestionOption;
import question.service.QuestionService;

@WebServlet("/question/create")
public class CreateQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionService questionsService = null;

	public void init() {
		this.questionsService = new QuestionService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("/admin/create-question.jsp");
		rd.include(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String question = request.getParameter("question");
		String questionType = request.getParameter("questiontype").toUpperCase();
        int marks=Integer.parseInt(request.getParameter("marks"));
		QuestionDto questionDto = new QuestionDto();
		questionDto.setQuestion(question);
		questionDto.setQuestionType(questionType);
		questionDto.setMarks(marks);
		if (questionType.equalsIgnoreCase("mcq")) {
			List<QuestionOption> questionOptions = new ArrayList<>();
			String options[] = request.getParameterValues("option");
			String correct_option = request.getParameter("correct_option");
			if (options.length > 0) {
				for (String option : options) {
					QuestionOption questionOption = new QuestionOption();
					questionOption.setOption(option);
					questionOption.setCorrect((byte) 1);
					questionOptions.add(questionOption);
				}
				questionDto.setOptions(questionOptions);
			}
		}
		questionsService.create(questionDto);
		response.sendRedirect("/Question-Generation-System/question/list");
	}
}
