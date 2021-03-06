package com.plant.lab.member.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plant.lab.member.model.dao.MemberDAO;
import com.plant.lab.member.model.vo.MemberVO;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDao;

	@Inject
	private JavaMailSender mailSender;

	@Transactional
	@Override
	public int insertMember(MemberVO vo) {
		int result = 0;
		System.out.println("서비스 들어왔어요");
		try {
			result = mDao.insertMember(vo);
			System.out.println("서비스 vo " + vo);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String maxMemberId() {
		return mDao.maxMemberId();
	}

	@Override
	public List<String> getMemberName(String userId) {
		return mDao.getMemberName(userId);
	}

	@Override
	public String getMemberName2(String userId) {
		return mDao.getMemberName2(userId);
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		return mDao.loginMember(vo);

	}

	@Override
	public int isValidId(String userId) {
		// TODO Auto-generated method stub
		return mDao.isValidId(userId);
	}
	@Override
	public int memberUpdate(MemberVO vo) {
		
		return mDao.memberUpdate(vo);
		
	}
	@Override
	public int memberDelete(MemberVO vo) {
		return mDao.memberDelete(vo);
	}
	@Override
	public String findId(MemberVO vo){
      return mDao.findId(vo);	
	}
	@Override
	public String findPassword(MemberVO vo){
      return mDao.findPassword(vo);	
	}
    @Override
    public int isExistIdPw(MemberVO vo) {
    	int result = mDao.isExistIdPw(vo);
    	return result;
    }
   @Override
   public List<MemberVO> getUserList(MemberVO vo){
		return mDao.getUserList(vo);
	}
	
	@Override
	public MemberVO getUserInfo(String userId) {
		return  mDao.getUserInfo(userId);
	
	}
	@Override
	public int userDelete(MemberVO vo) {
		return mDao.userDelete(vo);
	}
	
	@Override
	public List<MemberVO> admlistUser(MemberVO vo){
		return mDao.admlistUser(vo);
	}
	@Override
	public int getlistall(MemberVO vo) {
		return mDao.getlistall(vo);
	}
	@Override
	public List<MemberVO> getSearchUser(MemberVO vo) {
		// TODO Auto-generated method stub
		return mDao.getSearchUser(vo);
	}
	@Override
	public int getUserTotalCnt(MemberVO vo) {
		// TODO Auto-generated method stub
		return mDao.getUserTotalCnt(vo);
	}
}