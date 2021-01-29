package com.join.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.join.dto.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sql;
	
	private static final String Namespace = "UserMapper";
	
	@Override
	public void admin_member_forced_evictionCheck(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		sql.delete(Namespace + ".withdrawl", vo); 
	}
	
	@Override
	public List<UserVO> userList() {
		// TODO Auto-generated method stub
		
		return sql.selectList(Namespace + ".userList"); 
	}
	
	@Override
	public UserVO viewUser(String user_id) {
		// TODO Auto-generated method stub
		
		return sql.selectOne(Namespace + ".userView", user_id); 
	}
	
	
	@Override
	public void updateUser(UserVO vo) {
		sql.update(Namespace + ".modify", vo); 
	}

	@Override
	public void deleteUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(Namespace + ".withdrawl", vo); 
	}

}
