package com.join.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.join.dao.UserDAO;
import com.join.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	UserDAO dao;
	
	@Override
	public int checkEmail(UserVO vo)  throws Exception
	{
		return dao.checkEmail(vo);
	}
	
	@Override
	public void signup(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.signup(vo);
	}

	// 로그인
	@Override
	public UserVO signin(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.signin(vo);
	}

	// 로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	// 회원 정보 수정
	@Override
	public void modify(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	// 회원 탈퇴
	@Override
	public void withdrawl(UserVO vo) throws Exception {
		dao.withdrawl(vo);
	}

	// 아이디 확인
	@Override
	public UserVO idCheck(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(user_id);
	}

	// 아이디 찾기
	@Override
	public UserVO findid(String user_email) throws Exception {
		// TODO Auto-generated method stub
		return dao.findid(user_email);
	}

	// 비밀번호 찾기
	@Override
	public void findpw(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.findpw(vo);
	}

	//아이디 이메일 확인
	@Override
	public int idemailchk(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.idemailchk(vo);
	}
	
	@Override
	public int getCalory(UserVO userVO) throws Exception {
		return dao.getCalory(userVO);
	}
}
