package com.plant.lab.oneday.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.oneday.model.vo.OnedayVo;

@Repository("oDao")
public class OnedayDao {
	@Autowired
	private SqlSession sqlSession;

	public List<OnedayVo> onedayselectlist() {

		return sqlSession.selectList("Oneday.onedayselectlist");

	}

	public OnedayVo onedayselect(OnedayVo oneVo) {
		return sqlSession.selectOne("Oneday.onedayselect", oneVo);
	}
}
