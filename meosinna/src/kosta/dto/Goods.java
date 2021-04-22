package kosta.dto;

public class Goods {
	private String gdCode;
	private String gdName;
	private int qty;
	private int price;
	private String brand;
	private int gdLike;
	private String szCode;
	private String stCode;
	private String gdContent;
	private String img;
	
	public Goods(String gdCode, String gdName, int qty, int price, String brand, int gdLike, String szCode,
			String stCode, String gdContent, String img) {
		super();
		this.gdCode = gdCode;
		this.gdName = gdName;
		this.qty = qty;
		this.price = price;
		this.brand = brand;
		this.gdLike = gdLike;
		this.szCode = szCode;
		this.stCode = stCode;
		this.gdContent = gdContent;
		this.img = img;
	}

	public String getGdCode() {
		return gdCode;
	}

	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}

	public String getGdName() {
		return gdName;
	}

	public void setGdName(String gdName) {
		this.gdName = gdName;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getGdLike() {
		return gdLike;
	}

	public void setGdLike(int gdLike) {
		this.gdLike = gdLike;
	}

	public String getSzCode() {
		return szCode;
	}

	public void setSzCode(String szCode) {
		this.szCode = szCode;
	}

	public String getStCode() {
		return stCode;
	}

	public void setStCode(String stCode) {
		this.stCode = stCode;
	}

	public String getGdContent() {
		return gdContent;
	}

	public void setGdContent(String gdContent) {
		this.gdContent = gdContent;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}