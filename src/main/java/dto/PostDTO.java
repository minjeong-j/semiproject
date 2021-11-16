package dto;

// content가 없을 시 NullString으로 변환 후 입력 필요
public class PostDTO {
	private String idx; 
	private String kinds_post;
	private String email;
	private String product_idx;
	private String title;
	private String content;
	private String img_source;
	private String posted_date;
	private int hit;

	public PostDTO() {
		// TODO Auto-generated constructor stub
	}

	public PostDTO(String idx, String kinds_post, String email, String product_idx, String title, String content,
			String img_source, String posted_date, int hit) {
		super();
		this.idx = idx;
		this.kinds_post = kinds_post;
		this.email = email;
		this.product_idx = product_idx;
		this.title = title;
		this.content = content;
		this.img_source = img_source;
		this.posted_date = posted_date;
		this.hit = hit;
	}

	public String getIdx() {
		return idx;
	}

	public void setPosted_date(String posted_date) {
		this.posted_date = posted_date;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getKinds_post() {
		return kinds_post;
	}

	public void setKinds_post(String kinds_post) {
		this.kinds_post = kinds_post;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg_source() {
		return img_source;
	}

	public String getPosted_date() {
		return posted_date;
	}

	public void setImg_source(String img_source) {
		this.img_source = img_source;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
