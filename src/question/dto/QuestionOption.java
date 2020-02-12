package question.dto;

public class QuestionOption {
	private String option;
	private byte isCorrect=0;
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public byte isCorrect() {
		return isCorrect;
	}
	public void setCorrect(byte isCorrect) {
		this.isCorrect = isCorrect;
	}
}