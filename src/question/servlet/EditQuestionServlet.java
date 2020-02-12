package question.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import question.dto.QuestionDto;
import question.dto.QuestionOption;
import question.service.QuestionService;

@WebServlet("/question/edit")
public class EditQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionService questionsService;

	public void init() {
		questionsService = new QuestionService();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long questionId = Long.parseLong(request.getParameter("questionId"));
		QuestionDto questionDto = questionsService.findById(questionId);
		request.setAttribute("question", questionDto);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/edit-question.jsp");
		rd.include(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long questionId = Long.parseLong((request.getParameter("questionId")));

		List<QuestionOption> option_list = new ArrayList();
		String newQuestion = request.getParameter("newQuestion");
		String questionType = request.getParameter("questiontype").toUpperCase();
		int marks=Integer.parseInt(request.getParameter("marks"));
		String options[] = request.getParameterValues("option");
		String correct_answer = request.getParameter("correct_answer");

		QuestionDto questionDto = new QuestionDto();
		questionDto.setId(questionId);
		questionDto.setQuestion(newQuestion);
		questionDto.setQuestionType(questionType);
		questionDto.setMarks(marks);
		if (questionType.equalsIgnoreCase("mcq") && Objects.nonNull(options)) {
			for (String option : options) {
				QuestionOption questionOption = new QuestionOption();
				questionOption.setOption(option);
				questionOption.setCorrect((byte) 1);
				option_list.add(questionOption);
			}
		}
		questionDto.setOptions(option_list);
		questionsService.update(questionDto);
		response.sendRedirect("/Question-Generation-System/question/list");

	}

}
