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
import com.plant.lab.oneday.model.vo.OnedayRsVo;
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

	public int onedayreserve(int user_no, int oneday_no) { // 클래스 예약
		Map<String, Integer> param = new HashMap<String, Integer>(); /* MAP 사용한 강사님 코드 */
		param.put("user_no", user_no);
		param.put("oneday_no", oneday_no);
		return sqlSession.insert("Oneday.onedayreserve", param);

//		return sqlSession.insert("Oneday.onedayreserve",user_no , oneday_no);  
//return sqlSession.insert("Oneday.onedayreserve", oneRs);  vo로 할 경우

	}

	public int onedaycancel(OnedayVo oneVo) { //  회원 클래스 예약 취소
		return sqlSession.insert("Oneday.onedaycancel", oneVo);

	}

	public int onedayinsert(OnedayVo oneVo) { // 관리자 클래스 등록
		return sqlSession.insert("Oneday.onedayinsert", oneVo);

	}

	public int onedayupdate(OnedayVo oneVo) { // 관리자 클래스 수정
		return sqlSession.insert("Oneday.onedayupdate", oneVo);
	}

	public int onedaydelete(OnedayVo oneVo) { // 관리자 클래스 삭제
		return sqlSession.insert("Oneday.onedaydelete", oneVo);
	}

}
