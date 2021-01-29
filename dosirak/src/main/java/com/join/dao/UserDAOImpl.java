package com.join.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.join.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession sql;
	
	private static final String Namespace = "UserMapper";
	
	@Override
	public int checkEmail(UserVO vo)  throws Exception
	{
		return sql.selectOne(Namespace+".checkEmail", vo);
	}
	
	// 회원가입
		@Override
		public void signup(UserVO vo) throws Exception {
			// TODO Auto-generated method stub
			sql.insert(Namespace + ".signup", vo);
		}

		// 로그인
		@Override
		public UserVO signin(UserVO vo) throws Exception {
			// TODO Auto-generated method stub
			return sql.selectOne(Namespace + ".signin", vo);
		}

		// 회원 정보 수정
		@Override
		public void modify(UserVO vo) throws Exception {
			// TODO Auto-generated method stub
			sql.update(Namespace + ".modify", vo); 
		}
		
		// 회원탈퇴
		@Override
		public void withdrawl(UserVO vo) throws Exception{
			sql.delete(Namespace + ".withdrawl", vo); 
		}

		// 아이디 확인
		@Override
		public UserVO idCheck(String user_id) throws Exception {
			// TODO Auto-generated method stub
			return sql.selectOne(Namespace + ".idCheck", user_id);
		}

		// 아이디 찾기
		@Override
		public UserVO findid(String user_email) throws Exception {
			// TODO Auto-generated method stub
			return sql.selectOne(Namespace + ".findid", user_email);
		}

		// 비밀번호 찾기
		@Override
		public void findpw(UserVO vo) throws Exception {
			// TODO Auto-generated method stub
			sql.update(Namespace + ".findpw", vo); 
		}

		@Override
		public int idemailchk(UserVO vo) throws Exception {
			// TODO Auto-generated method stub
			return sql.selectOne(Namespace + ".idemailchk", vo);
		}
		
		@Override // 유저 칼로리 가져오기
		public int getCalory(UserVO userVO) throws Exception {
			return sql.selectOne(Namespace+".getCalory", userVO);

		}
	
}
