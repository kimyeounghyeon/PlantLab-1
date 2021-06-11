package com.plant.lab.member.model.service;

import java.util.List;

import com.plant.lab.member.model.vo.MemberVO;




public interface MemberService {

	public int insertMember(MemberVO vo );
	
	public String maxMemberId();
	
	public List<String> getMemberName(String memberId);

	public String getMemberName2(String memberId);
}

