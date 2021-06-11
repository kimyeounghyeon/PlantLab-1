package com.plant.lab.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.member.model.vo.MemberVO;







@Repository("mDao")
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public int insertMember( MemberVO vo ) {
		return sqlSession.insert("Member.insertMember", vo);
	}
	
	public String maxMemberId() {
		return sqlSession.selectOne("Member.maxMemberId");
	}
	
	public List<String> getMemberName(String memberId) {   // 멤버이름 전부 읽어옴 selectList() 사용
		List<String> aaaa = sqlSession.selectList("Member.getMemberName", memberId);
		return aaaa;
	}

	public String getMemberName2(String memberId) { // 멤버이름중 대표 이름 1개만 읽어옴 selectOne() 사용
		String aaaa = sqlSession.selectOne("Member.getMemberName", memberId);
		return aaaa;
	}

	


}
