package com.plant.lab.member.model.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.plant.lab.member.model.dao.MemberDAO;
import com.plant.lab.member.model.vo.MemberVO;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDao;

	@Override
	public int insertMember(MemberVO vo)  {
		int result = 0;
		try {
			result = mDao.insertMember(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String maxMemberId() {
		return mDao.maxMemberId();
	}

	@Override
	public List<String> getMemberName(String memberId) {
		return mDao.getMemberName(memberId);
	}

	@Override
	public String getMemberName2(String memberId) {
		return mDao.getMemberName2(memberId);
	}
	
	
	
}
