package kosta.controller;
/**
 * 각각의 Controller의 구현체가 실행된 후 이동해야할 뷰의 정보와 이동방식을 관리해줄 객체
 * */
public class ModelAndView {
	private String viewName; //이동할 뷰정보
	private boolean isRedirect; //이동방식(false이면 forward방식, true이면 redirect방식)
	
	public ModelAndView() {}

	public ModelAndView(String viewName, boolean isRedirect) {
		super();
		this.viewName = viewName;
		this.isRedirect = isRedirect;
	}

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
