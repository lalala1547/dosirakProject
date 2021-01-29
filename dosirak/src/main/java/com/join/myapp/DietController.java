package com.join.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.join.dto.FoodCalory;
import com.join.dto.UserCalory;
import com.join.dto.UserVO;
import com.join.service.BoardService;
import com.join.service.DietService;
import com.join.service.UserService;

@Controller
@RequestMapping("/diet/*")
public class DietController {
	
	 @Inject
	 UserService userService;
	 @Inject
	 DietService dietService;
	 
//	    @RequestMapping(value = "daily")
//	    public String daily(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request) throws Exception {
//	 
//	    	
//	    	HttpSession httpSession = request.getSession();
//	    	
//	    	UserVO userVO = (UserVO)httpSession.getAttribute("user");
//	    	
//	    	System.out.println(userVO.getUser_id());
//	    	
//			List<UserCalory> userCalory = dietService.getUserCalory(userVO.getUser_id());
//			List<FoodCalory> foodCalory = dietService.getFoodCalory();
//			
//			System.out.println(foodCalory.get(0).getFoodname());
//			
//	    	model.addAttribute("userCalory", userCalory);
//	    	model.addAttribute("foodCalory", dietService.getFoodCalory());
//	    	model.addAttribute("user",httpSession.getAttribute("user"));
//	    	return "dailyEdit";
//
//	    }
	    
	    
	    @RequestMapping(value = "/")
	    public String daily(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request) throws Exception {
	 
	    	
	    	HttpSession httpSession = request.getSession();	    	
	    	UserVO userVO = (UserVO)httpSession.getAttribute("user");
			List<UserCalory> userCalory = dietService.getUserCalory(userVO.getUser_id());
			
			
			
			
	    	model.addAttribute("userCalory", userCalory);
	    	model.addAttribute("user",httpSession.getAttribute("user"));
	    	return "dailyEdit";

	    }
	    
	    
	    
    @RequestMapping(value = "monthlyEdit")
    public String monthly(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request) throws Exception {
    	
    	return "monthlyEdit";
    
    }
    
    
	    
	    
	    
    
    
    //AJAX 호출 (일간 식단 입력)
    @RequestMapping(value="dailySave", method=RequestMethod.POST)
    @ResponseBody
    public Object boardSave(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, Model model) {

    	HttpSession httpSession = request.getSession();
    	model.addAttribute("user",httpSession.getAttribute("user"));
    	
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        //정보입력
        int result = dietService.setCalory(paramMap);
 
        if(result > 0) {
        	retVal.put("code", "OK");
            retVal.put("message", "등록에 성공 하였습니다.");
        }
        
        else {           
        	  retVal.put("code", "FAIL");
              retVal.put("message", "등록에 실패 하였습니다.");
        	}
 
        return retVal;

    }
    
    //AJAX 호출 (음식 리스트)
    @RequestMapping(value="foodList", method=RequestMethod.GET)
    @ResponseBody
    public String foodList(Locale locale, Model model) throws Exception {

		List<FoodCalory> foodCalory = dietService.getFoodCalory();
		Gson gson = new Gson();
		 
		return gson.toJson(foodCalory);
    }
    
    
    
	
}
