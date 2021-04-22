package kosta.dto;

public class SizeDTO {
	private String szCode;
	private int size;
	
	public SizeDTO() {}
	public SizeDTO(String szCode) {
		this.szCode = szCode;
	}
	
	public SizeDTO(String szCode, int size) {
		this(szCode);
		this.size = size;
	}


	public String getSzCode() {
		return szCode;
	}


	public void setSzCode(String szCode) {
		this.szCode = szCode;
	}


	public int getSize() {
		return size;
	}


	public void setSize(int size) {
		this.size = size;
	}
	
	
	
	
}
