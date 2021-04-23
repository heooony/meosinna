package kosta.dto;

public class Likes {
	private String mbCode;
	private String gdCode;
	private String lkDate;
	
	public Likes(String mbCode, String gdCode, String lkDate) {
		super();
		this.mbCode = mbCode;
		this.gdCode = gdCode;
		this.lkDate = lkDate;
	}

	public String getMbCode() {
		return mbCode;
	}

	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}

	public String getGdCode() {
		return gdCode;
	}

	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}

	public String getLkDate() {
		return lkDate;
	}

	public void setLkDate(String lkDate) {
		this.lkDate = lkDate;
	}
	
	
}
