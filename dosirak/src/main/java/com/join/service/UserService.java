package com.join.service;

import javax.servlet.http.HttpSession;

import com.join.dto.UserVO;

public interface UserService {

	// 이메일 중복확인
	public int checkEmail(UserVO vo)  throws Exception;

	// 회원가입
	public void signup(UserVO vo) throws Exception;

	// 로그인
	public UserVO signin(UserVO vo) throws Exception;

	// 로그아웃
	public void signout(HttpSession session) throws Exception;

	// 회원정보 수정
	public void modify(UserVO vo) throws Exception;

	// 회원 탈퇴
	public void withdrawl(UserVO vo) throws Exception;

	// 아이디 확인
	public UserVO idCheck(String user_id) throws Exception;

	// 아이디 찾기
	public UserVO findid(String user_email) throws Exception;

	// 비밀번호 찾기
	public void findpw(UserVO vo) throws Exception;

	//아이디 이메일 확인
	public int idemailchk(UserVO vo) throws Exception;
	
	//유저 칼로리
	public int getCalory(UserVO userVO) throws Exception;
	
}
