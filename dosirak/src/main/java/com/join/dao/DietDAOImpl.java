package com.join.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.join.dto.FoodCalory;
import com.join.dto.UserCalory;


@Repository("dietDao")
public class DietDAOImpl implements DietDAO {
	
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.join.mapper.caloryMapper";
    
    @Override
    public int setCalory(Map<String, Object> paramMap) {
        return sqlSession.insert(Namespace+".insertCalory", paramMap);
    }
    
    @Override
    public List<FoodCalory> getFoodCalory() throws Exception {
    	
    	List<FoodCalory> foodCalory = sqlSession.selectList(Namespace+".selectFoodName");
    	return foodCalory;
    }

    @Override
    public List<UserCalory> getUserCalory(String param) throws Exception {
    	return sqlSession.selectList(Namespace+".getUserCalory", param);
    }
    
    @Override
	public UserCalory selectDailyView(Map<String, Object> paramMap) throws Exception {
    	return sqlSession.selectOne(Namespace+".selectdailyView", paramMap);
    }
}
