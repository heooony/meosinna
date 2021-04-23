package kosta.dto;

public class Payment {
	private int pyCode;
	private int odCode;
	private String payDate;
	private int pay;
	private String method;
	private String state;
	
	public Payment() {}
	public Payment(int pyCode, int odCode, String payDate, int pay, String method, String state) {
		super();
		this.pyCode = pyCode;
		this.odCode = odCode;
		this.payDate = payDate;
		this.pay = pay;
		this.method = method;
		this.state = state;
	}

	public int getPyCode() {
		return pyCode;
	}

	public void setPyCode(int pyCode) {
		this.pyCode = pyCode;
	}

	public int getOdCode() {
		return odCode;
	}

	public void setOdCode(int odCode) {
		this.odCode = odCode;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}
