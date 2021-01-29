package com.join.service;

import java.util.List;
import java.util.Map;


import com.join.dto.FoodCalory;
import com.join.dto.UserCalory;


public interface DietService {
	
//	List<FoodCalory> getFoodCalory(Map<String, Object> paramMap) throws Exception;
	int setCalory(Map<String, Object> paramMap);
	List<FoodCalory> getFoodCalory() throws Exception;
	List<UserCalory> getUserCalory(String param) throws Exception;
	UserCalory selectDailyView(Map<String, Object> paramMap) throws Exception;
}
