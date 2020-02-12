package question.service;

import java.util.List;

import question.dao.QuestionDao;
import question.dto.QuestionDto;

public class QuestionService {
	
	private QuestionDao questionDao;

	public QuestionService() {
		this.questionDao = new QuestionDao();
	}

	public void create(QuestionDto question) {
		questionDao.create(question);
	}
    
	public void update(QuestionDto question) {
		questionDao.update(question);
	}

	public void delete(long questionId) {
		questionDao.delete(questionId);
	}

	public List<QuestionDto> getAllQuestions() {
		return questionDao.getAllQuestions();
	}
	public QuestionDto findById(long questionId) {
		return questionDao.findById(questionId);
	}
	
	public List<QuestionDto> getAllRandomQuestions(String questionType,int numberOfQuestions){
		return questionDao.getAllRandomQuestions(questionType,numberOfQuestions);
	}
	
	public List<QuestionDto> filterByQuestionType(String questionType){
		return questionDao.filterByQuestionType(questionType);
	}
}
