package com.plant.lab.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.member.model.vo.MemberVO;

@Repository("mDao")
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	public int insertMember(MemberVO vo) {
		System.out.println("dao 들어옴");
		int aaaa = sqlSession.insert("member.insertMember", vo);
		System.out.println("dao에서" + aaaa);
		return aaaa;
	}

	public String maxMemberId() {
		return sqlSession.selectOne("member.maxMemberId");
	}

	public List<String> getMemberName(String userId) { // 멤버이름 전부 읽어옴 selectList() 사용
		List<String> aaaa = sqlSession.selectList("member.getMemberName", userId);
		return aaaa;
	}

	public String getMemberName2(String userId) { // 멤버이름중 대표 이름 1개만 읽어옴 selectOne() 사용
		String aaaa = sqlSession.selectOne("member.getMemberName", userId);
		return aaaa;
	}
	

	public MemberVO loginMember(MemberVO vo) {
		return sqlSession.selectOne("member.loginMember", vo);

	}

}
