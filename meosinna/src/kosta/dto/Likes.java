package kosta.dto;

public class Likes {
	private int mbCode;
	private String gdCode;
	private String lkDate;
	private Goods goods;
	
	


	public Likes(int mbCode, String gdCode, String lkDate, Goods goods) {
		super();
		this.mbCode = mbCode;
		this.gdCode = gdCode;
		this.lkDate = lkDate;
		this.goods = goods;
	}


	public Goods getGoods() {
		return goods;
	}


	public void setGoods(Goods goods) {
		this.goods = goods;
	}


	public int getMbCode() {
		return mbCode;
	}


	public void setMbCode(int mbCode) {
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
