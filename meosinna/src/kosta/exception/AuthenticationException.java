package kosta.exception;

/**
 * 로드인 즉 인증했을  결과가 실패하면 발생하는 예외
 * (DAO에서 리턴한 결과가 null이 나오면 AuthenticationException을 발생시킨다.)
 * */
public class AuthenticationException extends RuntimeException {
	public AuthenticationException() {}
	
	public AuthenticationException(String message) {
		super(message);
	}
}
