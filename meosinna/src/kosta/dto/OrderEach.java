package kosta.dto;

public class OrderEach {
	private int oeCode;
	private int odCode;
	private int size;
	private int price;
	
	public OrderEach() {}
	public OrderEach(int oeCode, int odCode, int size, int price) {
		super();
		this.oeCode = oeCode;
		this.odCode = odCode;
		this.size = size;
		this.price = price;
	}
	public int getOeCode() {
		return oeCode;
	}
	public void setOeCode(int oeCode) {
		this.oeCode = oeCode;
	}
	public int getOdCode() {
		return odCode;
	}
	public void setOdCode(int odCode) {
		this.odCode = odCode;
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
	
}
