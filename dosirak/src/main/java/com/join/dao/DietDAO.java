package com.join.dao;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import com.join.dto.UserCalory;
import com.join.dto.FoodCalory;


public interface DietDAO {

    int setCalory(Map<String, Object> paramMap);
    List<FoodCalory> getFoodCalory() throws Exception;
    List<UserCalory> getUserCalory(String param) throws Exception;
    UserCalory selectDailyView(Map<String, Object> paramMap) throws Exception;
    
	
}
