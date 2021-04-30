package kosta.dto;

public class PrivateQuestion {
	private int odCode;
	private String mbName;
	private String tel;
	private String email;
	private String title;
	private String content;
	private String type;
	private String state;
	private String pqDate;
	
	
	public PrivateQuestion(int odCode, String mbName, String tel, String email, String title, String content,
			String type) {
		this.odCode = odCode;
		this.mbName = mbName;
		this.tel = tel;
		this.email = email;
		this.title = title;
		this.content = content;
		this.type = type;
	}

	public PrivateQuestion(int odCode, String mbName, String tel, String email, String title, String content,
			String type, String state) {
		this(odCode, mbName, tel, email, title, content, type);
		this.state = state;
	}
	
	

	public PrivateQuestion(int odCode, String mbName, String tel, String email, String title, String content,
			String type, String state, String pqDate) {
		this(odCode, mbName, tel, email, title, content, type, state);
		this.pqDate = pqDate;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
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


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "PrivateQuestion [odCode=" + odCode + ", mbName=" + mbName + ", tel=" + tel + ", email=" + email
				+ ", title=" + title + ", content=" + content + ", type=" + type + ", state=" + state + "]";
	}

	public String getPqDate() {
		return pqDate;
	}

	public void setPqDate(String pqDate) {
		this.pqDate = pqDate;
	}

	
	
	
	
	
}
