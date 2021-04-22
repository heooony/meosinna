package kosta.dto;

public class CartDTO {
	private String gdCode;
	private String name;
	private int size;
	private int price;
	private int qty;
	private int mbCode;
	
	public CartDTO() {}
	public CartDTO(String gdCode) {
		this.gdCode = gdCode;
	}
	public CartDTO(String gdCode, String name, int size, int price, int qty, int mbCode) {
		this(gdCode);
		this.name = name;
		this.size = size;
		this.price = price;
		this.qty = qty;
		this.mbCode = mbCode;
	}
	public String getGdCode() {
		return gdCode;
	}
	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getMbCode() {
		return mbCode;
	}
	public void setMbCode(int mbCode) {
		this.mbCode = mbCode;
	}
	
	
	
}
