package com.join.myapp;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.join.dto.UserVO;
import com.join.service.AdminService;

@Controller
public class AdminController {

	@Inject
	AdminService adminservice;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AdminController.class);

	// 관리자
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get admin");
	}

	// 회원 강제 탈퇴
	@RequestMapping("/admin_member_forced_eviction_view")
	public String admin_member_forced_evction_view() {
		return "admin_member_forced_eviction_view";
	}

	//관리자로 로그인 후에 강제 탈퇴시킬 회원의 아이디를 입력후 강제탈퇴 버튼을 누르면 연결되는 메소드
	@RequestMapping("/admin_member_forced_eviction")
	public ModelAndView admin_member_forced_eviction(String user_id) throws Exception {

		//유저의 아이디를 삭제 (강제탈퇴) 시키기위해서 dto에 담는다.
		UserVO vo = new UserVO();
		vo.setUser_id(user_id);

		//회원탈퇴 체크를 하기위한 메소드, 탈퇴 시키려는 회원의 아이디가 있는지 검사한후에 result 변수에 저장한다.
		adminservice.admin_member_forced_evictionCheck(vo);

		ModelAndView mav = new ModelAndView();

		if(vo.getUser_id() != null) {    //회원 강제탈퇴가 성공했을시 출력되는 뷰

			mav.setViewName("/admin");

			mav.addObject("message", "회원이 정상적으로 강제탈퇴 처리 되었습니다.");


		}else {

			mav.setViewName("/admin_member_forced_eviction_view");

			mav.addObject("message", "회원 목록에 없는 회원입니다. 다시 확인해주세요.");
		}


		return mav;
	}

	@RequestMapping("/userlist")
	public String userList(Model model) throws Exception {
		List<UserVO> list = adminservice.userList();
		model.addAttribute("list", list);
		return "/userlist";
	}

	@RequestMapping("/userspecificlist")
	public String userView(String user_id, Model model) throws Exception {
		model.addAttribute("vo", adminservice.viewUser(user_id));
		logger.info("클릭한 아이디: " + user_id);
		return "/userspecificlist";
	}

	@RequestMapping("/userupdate")
	public String userUpdate(@ModelAttribute UserVO vo, @RequestParam Map<String, Object> paramMap, HttpSession session) throws Exception {

		String user_pw = (String) paramMap.get("user_pw");

		String new_user_pw = passEncoder.encode(user_pw);

		vo.setUser_pw(new_user_pw);

		adminservice.updateUser(vo);

		return "/admin";
	}
	
	@RequestMapping("/userdelete")
	public String userDelete(@ModelAttribute UserVO vo) throws Exception {
		
		adminservice.withdrawl(vo);
		
		return "/admin";
		
	}

}
