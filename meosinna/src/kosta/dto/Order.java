package kosta.dto;

import java.util.List;

public class Order {
	private int odCode;
	private String mbName;
	private String tel;
	private String addr;
	private int pay;
	private String state;
	private String gdCode;
	private int mbCode;
	private List<OrderIndex> orderIndex;
	
	public Order() {}
	
	public Order(int odCode, String mbName, int pay, String state, String gdCode, int mbCode) {
		super();
		this.odCode = odCode;
		this.mbName = mbName;
		this.pay = pay;
		this.state = state;
		this.gdCode = gdCode;
		this.mbCode = mbCode;
		
	}
	public Order(int odCode, String mbName, String tel, String addr, int pay, String state, String gdCode, int mbCode) {
		this(odCode, mbName, pay, state, gdCode, mbCode);
		this.tel = tel;
		this.addr = addr;
	}
	
	public Order(int odCode, String mbName, String tel, String addr, int pay, String state, String gdCode, int mbCode,  List<OrderIndex> orderIndex) {
		this(odCode, mbName, pay, state, gdCode, mbCode);
		this.tel = tel;
		this.addr = addr;
	}

	
	public int getOdCode() {
		return odCode;
	}

	public void setOdCode(int odCode) {
		this.odCode = odCode;
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

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getGdCode() {
		return gdCode;
	}

	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}

	public int getMbCode() {
		return mbCode;
	}

	public void setMbCode(int mbCode) {
		this.mbCode = mbCode;
	}

	public List<OrderIndex> getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(List<OrderIndex> orderIndex) {
		this.orderIndex = orderIndex;
	}
	
	
}