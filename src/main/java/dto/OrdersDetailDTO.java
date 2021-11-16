package dto;

public class OrdersDetailDTO {
	private String idx;
	private String orders_idx;
	private String product_idx;
	private int quantity;
	private int price;

	public OrdersDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrdersDetailDTO(String idx, String orders_idx, String product_idx, int quantity, int price) {
		super();
		this.idx = idx;
		this.orders_idx = orders_idx;
		this.product_idx = product_idx;
		this.quantity = quantity;
		this.price = price;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getOrders_idx() {
		return orders_idx;
	}

	public void setOrders_idx(String orders_idx) {
		this.orders_idx = orders_idx;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
