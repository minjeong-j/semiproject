package dto;

public class ReplyDTO {
	private String idx;
	private String post_idx;
	private String email;
	private String content;
	private String replied_date;

	public ReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyDTO(String idx, String post_idx, String email, String content, String replied_date) {
		super();
		this.idx = idx;
		this.post_idx = post_idx;
		this.email = email;
		this.content = content;
		this.replied_date = replied_date;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(String post_idx) {
		this.post_idx = post_idx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReplied_date() {
		return replied_date;
	}

	public void setReplied_date(String replied_date) {
		this.replied_date = replied_date;
	}

}
