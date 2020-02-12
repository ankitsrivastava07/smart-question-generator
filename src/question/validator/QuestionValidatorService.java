package question.validator;

import java.util.ArrayList;
import java.util.List;

import question.dto.QuestionDto;

public class QuestionValidatorService {

	public List<String> validate(QuestionDto questionDto) {
		List<String> errors = new ArrayList<>();
		if (!questionDto.isQuestionPresent()) {
			errors.add("Question is required field");
		} else if (!questionDto.isQuestionTypePresent()) {
			errors.add("Question Type is required field");
		} else if (!questionDto.isQuestionTypeValid()) {
			errors.add("Question Type is invalid");
		}
		return errors;
	}
}
