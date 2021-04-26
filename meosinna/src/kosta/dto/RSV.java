package kosta.dto;

public class RSV {
	private int mbCode;
	private int rsv;
	private int addRsv;
	private int totalRsv;
	
	public RSV(int mbCode, int rsv, int addRsv, int totalRsv) {
		super();
		this.mbCode = mbCode;
		this.rsv = rsv;
		this.addRsv = addRsv;
		this.totalRsv = totalRsv;
	}

	public int getMbCode() {
		return mbCode;
	}

	public void setMbCode(int mbCode) {
		this.mbCode = mbCode;
	}

	public int getRsv() {
		return rsv;
	}

	public void setRsv(int rsv) {
		this.rsv = rsv;
	}

	public int getAddRsv() {
		return addRsv;
	}

	public void setAddRsv(int addRsv) {
		this.addRsv = addRsv;
	}

	public int getTotalRsv() {
		return totalRsv;
	}

	public void setTotalRsv(int totalRsv) {
		this.totalRsv = totalRsv;
	}
	
}
