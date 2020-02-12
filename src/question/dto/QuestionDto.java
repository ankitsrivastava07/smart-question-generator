package question.dto;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import question.constants.QuestionType;

public class QuestionDto {
	
	private long id;
	private String question;
	private QuestionType questionType;
	private int marks;
	private List<QuestionOption> options = new ArrayList<>();

	public long getId() {
		return id;
	}

	public void setId(long questionId) {
		this.id = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public QuestionType getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String quesionType) {
		this.questionType=QuestionType.valueOf(quesionType);
	}

	public int getMarks() {
		return marks;
	}
	
	public void setMarks(int marks) {
		this.marks=marks;
	}
	public List<QuestionOption> getOptions() {
		return options;
	}

	public void setOptions(List<QuestionOption> options) {
		this.options = options;
	}
	
	public boolean isQuestionPresent() {
		return Objects.nonNull(question);
	}
	public boolean isQuestionTypePresent() {
		return Objects.nonNull(questionType);
	}
	public boolean isQuestionTypeValid() {
		return Objects.nonNull(questionType) && List.of(QuestionType.values()).contains(questionType);
	}
	
}
