package com.plant.lab.member.model.dao;

import java.util.ArrayList;
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

	public int isValidId(String userId) {
		return sqlSession.selectOne("member.isValidId", userId);
	}
	
	public int memberUpdate(MemberVO vo){
		return sqlSession.update("member.memberUpdate", vo);
		 }
	public int memberDelete(MemberVO vo) {
		return sqlSession.delete("member.memberDelete",vo);
	 }
	
	public String findId(MemberVO vo) {
		return sqlSession.selectOne("member.findId",vo);
  
	}
	public String findPassword(MemberVO vo) {
		return sqlSession.selectOne("member.findPassword",vo);
  
	}
	
	public int isExistIdPw(MemberVO vo) {
		return sqlSession.selectOne("member.isExistIdPw",vo);
	}

	public List<MemberVO> getUserList(MemberVO vo){
		return sqlSession.selectList("member.getUserList", vo);
	}
	
	
	public MemberVO getUserInfo(String userId) {
		return  sqlSession.selectOne("member.getUserInfo", userId);

	
	}
	public int userDelete(MemberVO vo) {
		return sqlSession.delete("member.userDelete",vo);
	}
	public List<MemberVO> admlistUser(MemberVO vo) {
		return sqlSession.selectList("member.userList",vo);
	}
	public int getlistall(MemberVO vo) {
		return sqlSession.selectOne("member.userListAll",vo);
	}

	public int getUserTotalCnt(MemberVO vo) {
		return sqlSession.selectOne("member.getUserTotalCnt",vo);
	}
	public List<MemberVO> getSearchUser(MemberVO vo) {
		return sqlSession.selectList("member.getSearchUser", vo);
	}
}
