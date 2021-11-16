package dto;

public class MemberDTO {
	private String email;
	private String password;
	private String name;
	private String address_id;
	private String phone;
	private String grade;
	private String member_since;
	private int total_pay;
	private String status;

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String email, String password, String name, String address_id, String phone, String grade,
			String member_since, int total_pay, String status) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.address_id = address_id;
		this.phone = phone;
		this.grade = grade;
		this.member_since = member_since;
		this.total_pay = total_pay;
		this.status = status;
	}

	public String getMember_since() {
		return member_since;
	}

	public void setMember_since(String member_since) {
		this.member_since = member_since;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress_id() {
		return address_id;
	}

	public void setAddress_id(String address_id) {
		this.address_id = address_id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getTotal_pay() {
		return total_pay;
	}

	public void setTotal_pay(int total_pay) {
		this.total_pay = total_pay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
