package dto;

public class CartDTO {
	private String cart_idx;
	private String email;
	private String product_idx;
	private int quantity;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(String cart_idx, String email, String product_idx, int quantity) {
		super();
		this.cart_idx = cart_idx;
		this.email = email;
		this.product_idx = product_idx;
		this.quantity = quantity;
	}

	public String getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(String cart_idx) {
		this.cart_idx = cart_idx;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
