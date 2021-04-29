package kosta.dto;

public class OrderIndex {
	private int odCode;
	private String gdName;
	private String odDate;
	private int qty;
	private int pay;
	
	
	public OrderIndex() {}
	public OrderIndex(int odCode, String gdName, String odDate, int qty, int pay) {
		super();
		this.odCode = odCode;
		this.gdName = gdName;
		this.odDate = odDate;
		this.qty = qty;
		this.pay = pay;
	}

	public int getOdCode() {
		return odCode;
	}
	
	public void setOdCode(int odCode) {
		this.odCode = odCode;
	}
	
	public String getGdName() {
		return gdName;
	}
	
	public void setGdName(String gdName) {
		this.gdName = gdName;
	}
	
	public String getOdDate() {
		return odDate;
	}
	
	public void setOdDate(String odDate) {
		this.odDate = odDate;
	}
	
	public int getQty() {
		return qty;
	}
	
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	public int getPay() {
		return pay;
	}
	
	public void setPay(int pay) {
		this.pay = pay;
	}

	
	public String toString() {
		return "odCode:" + odCode + ", gdName: " + gdName + ", odDate: " + odDate + ", qty: " + qty + ", pay: "
				+ pay;
	}

	
}
