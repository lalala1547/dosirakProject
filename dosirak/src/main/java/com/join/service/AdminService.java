package com.join.service;

import java.util.List;

import com.join.dto.UserVO;

public interface AdminService {	
	
    void admin_member_forced_evictionCheck(UserVO vo) throws Exception;

	List<UserVO> userList() throws Exception;

	UserVO viewUser(String user_id) throws Exception;

	void updateUser(UserVO vo) throws Exception;

	void withdrawl(UserVO vo) throws Exception;
}
