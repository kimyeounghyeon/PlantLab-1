package com.plant.lab.oneday.model.vo;

//어떤 예약을 누가 예약을 했는지 보기 위한 클래스
import java.util.List;

import org.springframework.stereotype.Component;

import com.plant.lab.member.model.vo.MemberVO;

@Component
public class ClassReserveStateVo {
	private OnedayVo onedayClass;
	private List<MemberVO> memberList;
	
}
