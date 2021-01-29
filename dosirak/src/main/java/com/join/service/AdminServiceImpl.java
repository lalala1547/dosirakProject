package com.join.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.join.dao.AdminDAO;
import com.join.dto.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO admindao;
	
	@Override
	public void admin_member_forced_evictionCheck(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		admindao.admin_member_forced_evictionCheck(vo);
	}
	
	@Override
	public List<UserVO> userList() throws Exception{
		return admindao.userList();
	}
	
	@Override
	public UserVO viewUser(String user_id) throws Exception {
		return admindao.viewUser(user_id);
	}
	
	@Override
	public void updateUser(UserVO vo) throws Exception {
		admindao.updateUser(vo);
	}
	
	@Override
	public void withdrawl(UserVO vo) throws Exception {
		admindao.deleteUser(vo);
	}

}
