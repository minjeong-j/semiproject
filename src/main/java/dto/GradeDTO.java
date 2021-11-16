package dto;

public class GradeDTO {
	private String grade;
	private String grade_name;
	private int grade_discount;

	public GradeDTO() {
		// TODO Auto-generated constructor stub
	}

	public GradeDTO(String grade, String grade_name, int grade_discount) {
		super();
		this.grade = grade;
		this.grade_name = grade_name;
		this.grade_discount = grade_discount;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}

	public int getGrade_discount() {
		return grade_discount;
	}

	public void setGrade_discount(int grade_discount) {
		this.grade_discount = grade_discount;
	}

}
