package com.plant.lab.att.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.att.model.vo.Att_tb;

@Repository("aDao")
public class AttDao {

	  @Autowired
	   private SqlSession sqlSession;
	  
	  
	// 좋아요 리스트 조회
//		public List<Integer> attList(Att_tb a) {
//			return sqlSession.selectList("Att_tb.attList", a);
//		} 
		
	// 출석 클릭
		public int insertAtt(Att_tb a) {
			return sqlSession.insert("Att_tb.insertAtt", a);   
		}	
		
	// 출석 갯수
		public int attCnt(Att_tb a) {
			return sqlSession.selectOne("Att_tb.attCnt", a);
		}
	// 출석 여부 확인
		public int attChk(Att_tb a) {
			return sqlSession.selectOne("Att_tb.attChk", a);
		}
		
}
