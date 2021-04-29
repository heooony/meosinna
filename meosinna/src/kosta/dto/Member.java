package kosta.dto;

import java.util.List;

public class Member {
	private int mbCode;
	private String mbName;
	private String id;
	private String pwd;
	private String email;
	private String addr;
	private String jumin;
	private String tel;
	private String signUpDate;
	private List<OrderIndex> orderIndexes;
	
	
  public Member() {}	
  	
  	public Member(String id, String pwd) {
  		this.id = id;
  		this.pwd = pwd;
  	}
  	
	public Member(String mbName, String id, String pwd, String email, String addr, String jumin, String tel) {
		this.mbName = mbName;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.jumin = jumin;
		this.tel = tel;
	}
	
	public Member(int mbCode, String mbName, String id, String pwd, String email, String addr, String jumin, String tel,
			String signUpDate) {
		this(mbName, id, pwd, email, addr, jumin, tel);
		this.mbCode = mbCode;
		this.signUpDate = signUpDate;
	
	}
	
	public Member(int mbCode, String mbName, String id, String pwd, String email, String addr, String jumin, String tel,
			String signUpDate, List<OrderIndex> orderIndexes) {
		this(mbCode, mbName, id, pwd, email, addr, jumin, tel, signUpDate);
		this.orderIndexes = orderIndexes;
	}

	public int getMbCode() {
		return mbCode;
	}
	public void setMbCode(int mbCode) {
		this.mbCode = mbCode;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSignUpDate() {
		return signUpDate;
	}
	public void setSignUpDate(String signUpDate) {
		this.signUpDate = signUpDate;
	}

	public List<OrderIndex> getOrderIndexes() {
		return orderIndexes;
	}

	public void setOrderIndexes(List<OrderIndex> orderIndexes) {
		this.orderIndexes = orderIndexes;
	}

	
	
}