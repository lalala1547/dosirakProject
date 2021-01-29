package com.join.myapp;

import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.join.dto.UserVO;
import com.join.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);

	int dice;

	@Inject
	UserService service;

	// 패스워드 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;

	@Inject
	private JavaMailSender mailSender;
	
	// 소개
	@RequestMapping(value="aboutus")
	public String aboutus() throws Exception
	{
		return "aboutus";
	}


	// 회원가입 get
	@RequestMapping(value="signup", method=RequestMethod.GET)
	public void getSignup() throws Exception
	{
		logger.info("get signup");
	}

	// 회원가입 post
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String postSignup(UserVO vo, Model model, HttpServletRequest request) throws Exception
	{

		logger.info("post signup");

		String inputPass = vo.getUser_pw();
		String pass = passEncoder.encode(inputPass);
		vo.setUser_pw(pass);

		service.signup(vo);

		return "redirect:/";
	}

	// 로그인 get
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void getSignin() throws Exception
	{
		logger.info("get login");
	}
	
	

	// 로그인 post
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String postSignin(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception
	{
		logger.info("post login");

		UserVO login = service.signin(vo);
		HttpSession session = req.getSession();

		boolean passMatch = passEncoder.matches(vo.getUser_pw(), login.getUser_pw());

		if(login != null && passMatch)
		{
			System.out.println(vo.getUser_id());
			// 유저 칼로리 가져오기
			vo.setUser_calory(Integer.toString(service.getCalory(vo)));
			session.setAttribute("user", login);
			logger.info("로그인 성공");
		}
		
		else
		{
			session.setAttribute("user", null);
			rttr.addFlashAttribute("usg",false);
			logger.info("로그인 실패");
		}
		
		return "redirect:/";
	}
	

	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String signout(HttpSession session) throws Exception
	{
		logger.info("get logout");

		service.signout(session);

		return "mainView";
	}

	// 회원정보 수정 get
	@RequestMapping(value="modify", method = RequestMethod.GET)
	public void getModify() throws Exception
	{
		logger.info("get modify");
	}

	// 회원정보 수정 post
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String postModify(@RequestParam Map<String, Object> paramMap, HttpSession session, UserVO vo) throws Exception
	{
		logger.info("post modify");

		String user_pw = (String) paramMap.get("user_pw");
		
		String new_user_pw = passEncoder.encode(user_pw);
		
		vo.setUser_pw(new_user_pw);
		
		service.modify(vo);

		session.invalidate();

		return "redirect:/";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "withdrawl", method = RequestMethod.GET)
	public void getWithdrawl() throws Exception {
		logger.info("get withdrawl");
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "withdrawl", method = RequestMethod.POST)
	public String postWithdrawl(HttpSession session, UserVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post withdrawl");

		UserVO user = (UserVO)session.getAttribute("user");

		String oldPass = user.getUser_pw();
		String newPass = vo.getUser_pw();

		logger.info(user.getUser_pw());
		logger.info(newPass);

		boolean passMatch = passEncoder.matches(newPass, oldPass);

		logger.info(Boolean.toString(passMatch));

		if(passMatch == true)
		{
			service.withdrawl(vo);
			session.invalidate();
			return "redirect:/";
		}
		else
		{
			rttr.addFlashAttribute("usg", false);
			return "redirect:/user/withdrawl";
		}
	}	

	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		logger.info("post idCheck");

		String user_id = req.getParameter("user_id");
		UserVO idCheck =service.idCheck(user_id);

		int result = 0;

		if(idCheck != null) {
			result = 1;
		} 

		return result;
	}

	@ResponseBody
	@RequestMapping( value = "emailCheck" , method=RequestMethod.POST )
	public int mailSending(HttpServletRequest request, HttpServletResponse response_email) throws Exception {

		logger.info(mailSender.toString());

		Random r = new Random();
		dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)

		String user_email = request.getParameter("user_email");

		logger.info(user_email);

		String setfrom = "hiemily1229@gamil.com";
		String tomail = user_email; // 받는 사람 이메일
		String title = "Dosirak 회원가입 인증 이메일 입니다."; // 제목
		String content = 

				System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성

				System.getProperty("line.separator")+

				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

         +System.getProperty("line.separator")+

         System.getProperty("line.separator")+

         " 인증번호는 " +dice+ " 입니다. "

         +System.getProperty("line.separator")+

         System.getProperty("line.separator")+

         "받으신 인증번호를 홈페이지에 입력해 주세요."; // 내용


		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println("aaaaa"+e);
			return 0;
		}

		//		response_email.setContentType("text/html; charset=UTF-8");
		//		PrintWriter out_email = response_email.getWriter();
		//		out_email.println( "<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		//		out_email.flush();

		return 1;
	}

	@ResponseBody
	@RequestMapping( value = "emailAuthCheck" , method=RequestMethod.POST )
	public int emailconfirm(HttpServletRequest req) throws Exception {

		String user_email_auth = req.getParameter("user_email_auth").trim();
		int auth = Integer.parseInt(user_email_auth);

		int result = 0;

		if(dice == auth) {
			result = 1;
		} 

		return result;
	}

	// 아이디 찾기
	@RequestMapping(value = "findid", method = RequestMethod.GET)
	public void findid() throws Exception {
		logger.info("get findid");
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "findid", method = RequestMethod.POST)
	public String findid(HttpServletRequest req) throws Exception {

		String user_email = req.getParameter("user_email");
		UserVO findid =service.findid(user_email);
		//			logger.info(findid.getUser_id());

		if(findid != null) {
			return findid.getUser_id();
		} 

		return "Nothing";
	}

	// 비밀번호 찾기 get
	@RequestMapping(value="findpw", method = RequestMethod.GET)
	public void getfindpw() throws Exception
	{
		logger.info("get findpw");
	}

	// 비밀번호 찾기 post
	@ResponseBody
	@RequestMapping(value="findpw", method = RequestMethod.POST)
	public int postfindpw(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response_email) throws Exception
	{
		UserVO vo = new UserVO();
		logger.info("post idemailchk");

		//JSP 데이터받은것 빼기
		String user_id = (String) paramMap.get("user_id");
		String user_email = (String) paramMap.get("user_email");

		vo.setUser_id(user_id);
		vo.setUser_email(user_email);

		// Service 호출 -> DAO 호출 -> Mapper
		// 결과값이 있으면 역순
		// Mapper -> DAO -> Service -> Controller
		// DB에 입력한 id, email 있는지 비교
		// user_id와 user_email을 DB까지 내려보냅니다.
		// JSP -> Controller -> Service -> DAO -> Mapper

		//올바른 사용자 or 이상한놈

		int check = service.idemailchk(vo);

		//count 1이면 임시비밀번호 전송
		//count 0이면 

		if(check==1)
		{
			String newpw = "";
			for (int i = 0; i < 12; i++) {
				newpw += (char) ((Math.random() * 26) + 97);
			}
			
			String temp_pw = passEncoder.encode(newpw);

			vo.setUser_pw(temp_pw);
			
			service.findpw(vo);
			// vo.setUser_pw(temp_pw); mapper pw update ?

			// 이메일 보내주기

			String setfrom = "hello@gamil.com";
			String tomail = user_email; // 받는 사람 이메일
			String title = "Dosirak 임시 비밀번호 발급 이메일 입니다."; // 제목
			String content = 

					System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성

					System.getProperty("line.separator")+

					"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

	         +System.getProperty("line.separator")+

	         System.getProperty("line.separator")+

	         " 임시 비밀번호는 " +newpw+ " 입니다. "

	         +System.getProperty("line.separator")+

	         System.getProperty("line.separator")+

	         "새로 로그인 하여 비밀번호를 바꿔주세요."; // 내용
			

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println("aaaaa"+e);
				
			}	return 1;
		}
		else
		{
			return 0;
		}

	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		
    	HttpSession httpSession = request.getSession();
		
    	logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println(httpSession.getAttribute("user"));
	
		if(httpSession.getAttribute("user") != null)
		{
			return "mainView_login";
		}
		
		else
		{
			return "mainView";
		}
	}
	 
	@RequestMapping(value = "checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public int postEmailCheck(HttpServletRequest req) throws Exception {
		 logger.info("post checkEmail");
		 String user_email = req.getParameter("user_email");
		 
		 if(user_email.equals(""))
		 {
			 return 1;
		 }
		 
		 System.out.println(user_email);
		 UserVO temp = new UserVO();	
		 temp.setUser_email(user_email);
		 int result =  service.checkEmail(temp);
		 System.out.println(result);
		 return result;
		}
}
	
	
	/*
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerView()
	{
		return "home";
	}
	
	@RequestMapping(value = "/registerNow", method = RequestMethod.POST)
	public String register(UserVO uv) throws Exception
	{
		System.out.println(uv.getEmail());
		System.out.println(uv.getUser_id());
		System.out.println(uv.getPassword());
		
		//이메일 확인여부 후에 추가해주세요.
		
		if(us.checkEmail(uv) == 0)
		{
			us.insertUser(uv);
		}
		else
		{
			System.out.println("이메일이 있습니다.");
		}
		
		
		
		return "home"; 
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(UserVO uv, HttpServletRequest request, Model model) throws Exception
	{
		HttpSession httpSession = request.getSession();
		
		System.out.println(uv.getUser_id());
		System.out.println(uv.getPassword());
		System.out.println(uv.getEmail());
		
		if(us.loginCheck(uv) == 0) {
			System.out.println("올바른 이름과 암호가 아닙니다.");
			return "login";
		}
		
		else
			httpSession.setAttribute("LOGIN", uv);
		 	model.addAttribute("LOGIN", httpSession.getAttribute("LOGIN"));
			System.out.println("환영합니다.");
			
		return "mainView_login";
	}
	
	@RequestMapping(value = "/logout",  method = RequestMethod.GET)
	public String logout(UserVO uv, HttpServletRequest request, Model model) throws Exception
	{
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		System.out.println("로그아웃 되었습니다.");
		
		return "mainView";
	}
	*/
