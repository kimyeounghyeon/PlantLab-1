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

	public List<OnedayVo> onedayselectlist() {		//예약가능한 클래스 리스트

		return sqlSession.selectList("Oneday.onedayselectlist");

	}

	public OnedayVo onedayselect(OnedayVo oneVo) {	//클래스 상세페이지
		return sqlSession.selectOne("Oneday.onedayselect", oneVo);
	}

	public int onedayreserve(OnedayVo oneVo ) {		//클래스 예약하기
		return sqlSession.insert("Oneday.onedayreserve", oneVo);



	}
	public List<OnedayVo> onedayMy(OnedayVo oneVo) {           //예약한 클래스 보여주는 마이페이지
		return sqlSession.selectList("Oneday.onedayMyselect", oneVo);
		
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
