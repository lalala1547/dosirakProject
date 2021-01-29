package com.join.dao;

import java.util.List;

import com.join.dto.UserVO;

public interface AdminDAO {

	void admin_member_forced_evictionCheck(UserVO vo) throws Exception;

	List<UserVO> userList() throws Exception;

	UserVO viewUser(String user_id) throws Exception;

	void updateUser(UserVO vo) throws Exception;

	void deleteUser(UserVO vo) throws Exception; 
	
}
