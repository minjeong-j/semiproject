package dto;

public class AddressDTO {
	private String id;
	private String post_code;
	private String road_address;
	private String detail_address;
	private String email;
	
	public AddressDTO() {
		// TODO Auto-generated constructor stub
	}	
	 
	public AddressDTO(String id, String post_code, String road_address, String detail_address, String email) {
		super();
		this.id = id;
		this.post_code = post_code;
		this.road_address = road_address;
		this.detail_address = detail_address;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getRoad_address() {
		return road_address;
	}

	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
