package kosta.dto;

public class OrderDetail {
	private int odCode;
	private String gdCode;
	private String mbName;
	private String tel;
	private String addr;
	private String state;
	private int pay;
	private String gdName;
	private int size;
	private String odDate;
	private int qty;
	private String req;
	
	public OrderDetail(int odCode, String gdCode, String mbName, String tel, String addr, String state, int pay,
			String gdName, int size, String odDate, int qty, String req) {
		super();
		this.odCode = odCode;
		this.gdCode = gdCode;
		this.mbName = mbName;
		this.tel = tel;
		this.addr = addr;
		this.state = state;
		this.pay = pay;
		this.gdName = gdName;
		this.size = size;
		this.odDate = odDate;
		this.qty = qty;
		this.req = req;
	}

	public int getOdCode() {
		return odCode;
	}

	public void setOdCode(int odCode) {
		this.odCode = odCode;
	}

	public String getGdCode() {
		return gdCode;
	}

	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getGdName() {
		return gdName;
	}

	public void setGdName(String gdName) {
		this.gdName = gdName;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
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

	public String getReq() {
		return req;
	}

	public void setReq(String req) {
		this.req = req;
	}
	
	
}
