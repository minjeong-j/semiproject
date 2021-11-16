package dto;

public class OrdersDTO {
	private String idx;
	private String email;
	private String address_id;
	private String order_date;
	private String pay_confirm;
	private String delivery_confirm;
	private String arrive_confirm;

	public OrdersDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrdersDTO(String idx, String email, String address_id, String orders_date, String pay_confirm,
			String delivery_confirm, String arrive_confirm) {
		super();
		this.idx = idx;
		this.email = email;
		this.address_id = address_id;
		this.order_date = orders_date;
		this.pay_confirm = pay_confirm;
		this.delivery_confirm = delivery_confirm;
		this.arrive_confirm = arrive_confirm;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress_id() {
		return address_id;
	}

	public void setAddress_id(String address_id) {
		this.address_id = address_id;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getPay_confirm() {
		return pay_confirm;
	}

	public void setPay_confirm(String pay_confirm) {
		this.pay_confirm = pay_confirm;
	}

	public String getDelivery_confirm() {
		return delivery_confirm;
	}

	public void setDelivery_confirm(String delivery_confirm) {
		this.delivery_confirm = delivery_confirm;
	}

	public String getArrive_confirm() {
		return arrive_confirm;
	}

	public void setArrive_confirm(String arrive_confirm) {
		this.arrive_confirm = arrive_confirm;
	}
}
