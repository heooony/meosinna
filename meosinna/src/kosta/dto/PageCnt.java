package kosta.dto;



public class PageCnt {
	
	private static int pageCnt; //총 페이지 수
	
	public static int pageSize = 9; //페이지 당 상품 출력 개수 9개
	
	public static int pageNo = 1;

	public PageCnt() {
		super();
	}
	
	public PageCnt(int pageCnt) {
		super();
		this.pageCnt = pageCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public static int getPageSize() {
		return pageSize;
	}

	public static void setPageSize(int pageSize) {
		PageCnt.pageSize = pageSize;
	}

	public static int getPageNo() {
		return pageNo;
	}

	public static void setPageNo(int pageNo) {
		PageCnt.pageNo = pageNo;
	}
	
	
	
	
}