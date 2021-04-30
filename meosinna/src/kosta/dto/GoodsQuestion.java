package kosta.dto;

public class GoodsQuestion {
	private int gqCode;
	private String gqContent;
	private String rgDate;
	private String reply;
	private String mbName;
	private String gdCode;
	private Goods goods;


	public GoodsQuestion(int gqCode, String gqContent, String rgDate, String reply, String mbName, String gdCode,
			Goods goods) {
		super();
		this.gqCode = gqCode;
		this.gqContent = gqContent;
		this.rgDate = rgDate;
		this.reply = reply;
		this.mbName = mbName;
		this.gdCode = gdCode;
		this.goods = goods;
	}

	public int getGqCode() {
		return gqCode;
	}

	public void setGqCode(int gqCode) {
		this.gqCode = gqCode;
	}

	public String getGqContent() {
		return gqContent;
	}

	public void setGqContent(String gqContent) {
		this.gqContent = gqContent;
	}

	public String getRgDate() {
		return rgDate;
	}

	public void setRgDate(String rgDate) {
		this.rgDate = rgDate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getGdCode() {
		return gdCode;
	}

	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}


	
	
}
