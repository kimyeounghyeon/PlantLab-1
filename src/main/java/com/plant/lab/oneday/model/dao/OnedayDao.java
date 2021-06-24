package com.plant.lab.oneday.model.dao;

import java.util.ArrayList; 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.member.model.vo.MemberVO;
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

	public int onedayreserve(OnedayVo oneVo ) {
		return sqlSession.insert("Oneday.onedayreserve", oneVo);



	}

	public int onedaycancel(OnedayVo oneVo) { //  ȸ�� Ŭ���� ���� ���
		return sqlSession.insert("Oneday.onedaycancel", oneVo);

	}

	public int onedayinsert(OnedayVo oneVo) { // ������ Ŭ���� ���
		return sqlSession.insert("Oneday.onedayinsert", oneVo);

	}

	public int onedayupdate(OnedayVo oneVo) { // ������ Ŭ���� ����
		return sqlSession.insert("Oneday.onedayupdate", oneVo);
	}

	public int onedaydelete(OnedayVo oneVo) { // ������ Ŭ���� ����
		return sqlSession.insert("Oneday.onedaydelete", oneVo);
	}

}
