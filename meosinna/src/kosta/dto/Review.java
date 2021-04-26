package kosta.dto;

public class Review {
	private int rvCode;
	private String gdName;
	private String mbName;
	private String title;
	private String content;
	private String img;
	private int grade;
	private String gdCode;
	private String stCode;
	
	public Review(int rvCode, String gdName, String mbName, String title, String content, String img, int grade,
			String gdCode, String stCode) {
		super();
		this.rvCode = rvCode;
		this.gdName = gdName;
		this.mbName = mbName;
		this.title = title;
		this.content = content;
		this.img = img;
		this.grade = grade;
		this.gdCode = gdCode;
		this.stCode = stCode;
	}

	public int getRvCode() {
		return rvCode;
	}

	public void setRvCode(int rvCode) {
		this.rvCode = rvCode;
	}

	public String getGdName() {
		return gdName;
	}

	public void setGdName(String gdName) {
		this.gdName = gdName;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGdCode() {
		return gdCode;
	}

	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}

	public String getStCode() {
		return stCode;
	}

	public void setStCode(String stCode) {
		this.stCode = stCode;
	}
	
	
}
