package com.join.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.join.dao.DietDAO;
import com.join.dto.UserCalory;
import com.join.dto.FoodCalory;


@Service
public class DietServiceImpl implements DietService {
	
	@Resource(name="dietDao")
	private DietDAO dietDao;
	
	@Override
    public int setCalory(Map<String, Object> paramMap) {
        return dietDao.setCalory(paramMap);
    }
	
	@Override
	public List<FoodCalory> getFoodCalory() throws Exception {
		return dietDao.getFoodCalory();
	}
	
	@Override
	public List<UserCalory> getUserCalory(String param) throws Exception {
		return dietDao.getUserCalory(param);
	}
	
	@Override
	public UserCalory selectDailyView(Map<String, Object> paramMap) throws Exception {
		return dietDao.selectDailyView(paramMap);
	}

}
