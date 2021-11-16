package dto;

public class ProductDTO {
	private String idx;
	private String name;
	private String img_source;
	private int price;
	private String kinds;
	private int stock;
	private String release_date;
	private String new_best;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(String idx, String name, String img_source, int price, String kinds, int stock, String release_date,
			String new_best) {
		super();
		this.idx = idx;
		this.name = name;
		this.img_source = img_source;
		this.price = price;
		this.kinds = kinds;
		this.stock = stock;
		this.release_date = release_date;
		this.new_best = new_best;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg_source() {
		return img_source;
	}

	public void setImg_source(String img_source) {
		this.img_source = img_source;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public String getRelease_date() {
		return release_date;
	}

	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}

	public String getNew_best() {
		return new_best;
	}

	public void setNew_best(String new_best) {
		this.new_best = new_best;
	}
	
}
