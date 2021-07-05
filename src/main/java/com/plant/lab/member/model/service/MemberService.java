package com.plant.lab.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.plant.lab.member.model.vo.MemberVO;




public interface MemberService {

	public int insertMember(MemberVO vo );
	
	public String maxMemberId();
	
	public List<String> getMemberName(String userId);

	public String getMemberName2(String userId);
	
    public MemberVO loginMember(MemberVO vo);
    
    public int isValidId(String userId);

	public int memberUpdate(MemberVO vo);

    public int memberDelete(MemberVO vo);
        
    public String findId(MemberVO vo);

    public String findPassword(MemberVO vo);

 
   

}
