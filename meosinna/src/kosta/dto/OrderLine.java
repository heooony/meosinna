package kosta.dto;

public class OrderLine {
	private int odCode;
	private String gdName;
	private String odDate;
	private int qty;
	private int isEvent;
	private String req;
	private int size;
	
	public OrderLine() {}
	public OrderLine(int odCode, String gdName, String odDate, int qty, int isEvent, String req, int size) {
		super();
		this.odCode = odCode;
		this.gdName = gdName;
		this.odDate = odDate;
		this.qty = qty;
		this.isEvent = isEvent;
		this.req = req;
		this.size = size;
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////	
	
	/**
	*  일대일 문의를 위한 추가 생성자
	**/
	
	public OrderLine(int odCode, String odDate, String gdName, int qty) {
		this.odCode = odCode;
		this.odDate = odDate;
		this.gdName = gdName;
		this.qty = qty;
	}
	/////////////////////////////////////////////////////////////////////////////////	

	
	
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
	public int getIsEvent() {
		return isEvent;
	}
	public void setIsEvent(int isEvent) {
		this.isEvent = isEvent;
	}
	public String getReq() {
		return req;
	}
	public void setReq(String req) {
		this.req = req;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	
/////////////////////////////////////////////////////////////////////////////////	
	
/**
*  일대일 문의를 위한 추가 toString
**/
	public String toString() {
		return "OrderLine [odCode=" + odCode + ", gdName=" + gdName + ", odDate=" + odDate + ", qty=" + qty
				+ "]";
	}

/////////////////////////////////////////////////////////////////////////////////////////
	
	
	
}
