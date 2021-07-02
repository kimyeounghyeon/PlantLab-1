package com.plant.lab.diary.comtroller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.plant.lab.diary.model.Service.DiaryService;
import com.plant.lab.diary.model.vo.CommentVO;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.diary.model.vo.LikeVO;
import com.plant.lab.member.model.vo.MemberVO;
import com.plant.lab.report.model.service.ReportService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class PlantHomeController {

	private static final Logger logger = LoggerFactory.getLogger(PlantHomeController.class);

	@Autowired
	private DiaryService dService;
	@Autowired
	private ReportService reportService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	// 일기 메인페이지
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public ModelAndView listdiary(ModelAndView mv, HttpSession session, LikeVO lvo, DiaryVO vo) {
		System.out.println("[영현]diary 진입");

		mv.setViewName("Plant/Diary");
		System.out.println("[영현]diary view 페이지 이동");
		return mv;
	}

	// 일기 내용 불러오기
	@RequestMapping(value = "/diary.do", method = RequestMethod.POST)
	@ResponseBody
	public void getDiary(HttpSession session, HttpServletResponse response) {
		System.out.println("[영현]diary.do 진입");
		response.setCharacterEncoding("UTF-8");

		LikeVO sessionVO = new LikeVO();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		sessionVO.setUser_no(member.getUserNo());

		List<DiaryVO> listDiary = dService.listDiary();
		List<Integer> likeList = dService.likeList(sessionVO);

		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listDiary", listDiary);
		map.put("likeList", likeList);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(map);

		try {
			response.getWriter().write(jsonOutput);
//			System.out.println("데이터 잘 갔나 확인 좀 " + jsonOutput);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("[영현]diary view 페이지 이동");
	}

	// 일기 상세보기
	@RequestMapping(value = "/detaildiary", method = RequestMethod.GET)
	public ModelAndView detaildiary(ModelAndView mv, HttpSession session, @RequestParam(name = "diary_no") int diary_no,
			LikeVO lvo, DiaryVO vo) {
		System.out.println("[영현]Detail diary 진입");
		System.out.println("diary_no값 url로 잘 가져왔나용?" + diary_no);

		//누적신고 수 조회
		int reportNum = reportService.countReport(diary_no);
		if(reportNum >= 3) {
			mv.addObject("rockM","ok");
			mv.addObject("diaryNo",diary_no);
			mv.setViewName("Plant/Diary");
		}else {
			mv.addObject("diary_no", diary_no);
			mv.setViewName("Plant/DiaryDetail");			
			System.out.println("[영현]diary detail view 페이지 이동");
		}
		
		return mv;
	}

	
	// 일기 상세 페이지 가져오기
	@RequestMapping(value = "/detaildiary.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public void diaryDetail(ModelAndView mv, HttpSession session, @RequestParam(name = "diary_no") int diary_no,
			HttpServletResponse response, HttpServletRequest request) {
		response.setCharacterEncoding("UTF-8");

		System.out.println("[영현]detailDiary 진입");
		System.out.println("diary_no값 url로 잘 가져왔나용?" + diary_no);

		LikeVO sessionVO = new LikeVO();

		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		sessionVO.setUser_no(member.getUserNo());
		sessionVO.setDiary_no(diary_no);

		String user_id = member.getUserId();
		System.out.println("로그인 한 아이디 " + user_id);
		
		
		
		List<DiaryVO> detailList = dService.detailDiary(diary_no);
		List<Integer> likeList = dService.likeList(sessionVO);
		List<CommentVO> listComment = dService.selectComment(diary_no);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("likeList", likeList);
		map.put("detailList", detailList);
		map.put("listComment", listComment);
		map.put("user_id", user_id);


		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(map);

		try {
			response.getWriter().write(jsonOutput.toString());
			System.out.println("데이터 잘 갔나 확인 좀 " + jsonOutput);
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("[영현]diary detail jsp 페이지 이동");
	}

	// 일기 쓰기
	@RequestMapping(value = "/writediary", method = RequestMethod.GET)
	public String writediary() {
		return "Plant/Writediary";
	}

	// 일기 등록
	@RequestMapping(value = "diaryInsert.do", method = RequestMethod.POST)
	public String boardInsert(DiaryVO vo, HttpServletResponse response, @RequestParam(name = "diaryUpload", required = false) MultipartFile multiFile,
			HttpSession session, HttpServletRequest request, @RequestParam(name = "writetext") String diary_content,
			ModelAndView mv) {

		MemberVO member = (MemberVO) session.getAttribute("loginMember");


			vo.setDiary_content(diary_content);
			vo.setDiary_write(member.getUserNo());
			vo.setUser_id(member.getUserId());
			

		System.out.println("vo가 문제지..?" + vo);
		
			
		
			int result = -1;
			int resultSeq = 0;
			int diary_no = 0;

			try {
				if (multiFile != null && !multiFile.equals("")) {
					String url = saveFile(multiFile, request);
					vo.setDiary_img_src(url);					
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("이미지 저장에 실패했습니다~");
			}
			
			
			
			try {
			resultSeq = dService.getSequence();
			diary_no = resultSeq;
			vo.setDiary_no(diary_no);
			System.out.println(vo);
			
			System.out.println("시퀀스 번호~ " + resultSeq);
			
			result = dService.writeDiary(vo);
			System.out.println("글쓰기 성공 했나용?" + result);
			
			 int resultImg = dService.writeImg(vo);
			 System.out.println(resultImg + " : 이거맞지~");
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
}
		return "Plant/Diary";
	}

	// 일기 수정
	@RequestMapping(value = "/modifydiary")
	public String modifyDiary() {
		System.out.println("수정페이지 들어왔고요~");
		return "Plant/modifyDiary";
	}

	// 일기 삭제
	@RequestMapping(value = "/deletediary.do")
	public void deleteDiary(HttpServletResponse response, HttpSession session, DiaryVO vo, @RequestParam(name = "diary_no") int diary_no) {
		System.out.println("게시글 삭제 페이지 진입");
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		vo.setDiary_write(member.getUserNo());


		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = null;
		int result = -1;
		try {
			out = response.getWriter();
			out.println("<script>alert('글 삭제를 진행합니다. <br> 원치 않으시면 뒤로가기를 눌러주세요.');<script>");
			result = dService.deleteDiary(vo);
			System.out.println("글 삭제 됐으면 ~~ " + result);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}

	}

	// 좋아요 클릭
	@RequestMapping(value = "/insertlike.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertlike(HttpSession session, ModelAndView mv, Model model,
			@RequestParam(name = "diary_no") int diary_no) {

		System.out.println("insert_diary_no" + diary_no);
		System.out.println("들어왔다");
		int result = -1;

		System.out.println(model.containsAttribute("likeList"));
		try {

			LikeVO lvo = new LikeVO();

			MemberVO member = (MemberVO) session.getAttribute("loginMember");
			int user_no = member.getUserNo();

			System.out.println("숫자: " + user_no);
			System.out.println("숫자: " + diary_no);

			lvo.setUser_no(user_no);
			lvo.setDiary_no(diary_no);

			System.out.println(lvo.toString());

			// likeCnt 함께 처리함.
			result = dService.insertLike(lvo);// dService.likeCnt(lvo); 포함
			System.out.println("like.do에서 result = 좋아요는 " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}

	// 좋아요 해제
	@RequestMapping(value = "deletelike.do", method = RequestMethod.POST)
	@ResponseBody
	public String deletelike(HttpSession session, ModelAndView mv, Model model,
			@RequestParam(name = "diary_no") int diary_no) {
		System.out.println("딜리트 들어왔어용");
		int result = -1;

		System.out.println(mv.getModel());
		System.out.println(model.containsAttribute("likeList"));
		
		LikeVO lvo = new LikeVO();
		MemberVO member = (MemberVO) session.getAttribute("loginMember");

		try {

			int user_no = member.getUserNo(); // 로그인 전에 임시 테스트 코드입니다. // session.getAtt....
			System.out.println("숫자: " + user_no);
			System.out.println("숫자: " + diary_no);

			lvo.setUser_no(user_no);
			lvo.setDiary_no(diary_no);


			// likeCnt 함께 처리함.
			result = dService.deleteLike(lvo);// dService.likeCnt(lvo); 포함
			System.out.println("like.do에서 result = 좋아요 " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}

	// 좋아요 수 카운트
	@RequestMapping(value = "/likecnt.do", method = RequestMethod.POST)
	@ResponseBody
	public String likecnt(HttpServletRequest request, @RequestParam(name = "user_no") int user_no,
			@RequestParam(name = "diary_no") int diary_no) {
		System.out.println("카운트 들어왔다");
		int likecnt = 0;
		LikeVO lvo = new LikeVO();
		try {
			lvo.setUser_no(user_no);
			lvo.setDiary_no(diary_no);
			likecnt = dService.likeCnt(lvo);
		} catch (Exception e) {

		}
		return String.valueOf(likecnt);
	}

	// 댓글 달기
	@RequestMapping(value = "/insertComment.do", method = RequestMethod.POST)
	@ResponseBody
	public String Insertcomment(HttpServletRequest request, CommentVO cvo, HttpSession session,
			HttpServletResponse response, @RequestParam(name = "diary_no") int diary_no,
			@RequestParam(name = "comm_comment") String comm_comment) {
		System.out.println("다이어리 번호는? " + diary_no);
		int result = -1;
		System.out.println("댓글 페이지 진입 성공~");

		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		String user_id = member.getUserId();
		int writer = member.getUserNo();

		cvo.setDiary_no(diary_no);
		cvo.setWriter(writer);
		cvo.setUser_id(user_id);
		cvo.setComm_comment(comm_comment);

		System.out.println("cvo에 뭐 들어있음?" + cvo);
		int insertComment = dService.insertComment(cvo);
		System.out.println("댓글 잘 됐어? " + insertComment);
		List<CommentVO> listComment = dService.selectComment(diary_no);

		// Parse Pretty
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(listComment);

		return jsonOutput;

	}
	
	// 댓글 수정
	@RequestMapping(value = "/modifyComment.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateComment(HttpServletRequest request, CommentVO cvo, HttpSession session, @RequestParam(name="comm_no") int comm_no, @RequestParam(name="comm_comment") String comm_comment,
								@RequestParam(name="diary_no") int diary_no) {
		System.out.println("댓글 수정 페이지 들어왔다~");
		
		
		System.out.println("댓글번호" + comm_no);
		System.out.println("댓글내용" + comm_comment);
		System.out.println("게시글번호" + diary_no);
		
		
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		String user_id = member.getUserId();
		

		cvo.setComm_no(comm_no);
		cvo.setComm_comment(comm_comment);
		
		int result = -1;
		result = dService.updateComment(cvo);
		
		System.out.println("수정 결과는??" + result);

		List<CommentVO> listComment = dService.selectComment(diary_no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("listComment", listComment);
		
		
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(map);

		return jsonOutput;
	}
	
	
	
	// 댓글 삭제
	@RequestMapping(value="deleteComment.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteComment(HttpServletRequest request, CommentVO cvo, @RequestParam(name="diary_no") int diary_no, @RequestParam(name="comm_no") int comm_no) {
		System.out.println("댓글 삭제 페이지 진입~");
		System.out.println("게시글 번호 가져와용~ " + diary_no);
		System.out.println("댓글 번호 가져와용~ " + comm_no);
		
		int result = -1;
		
		cvo.setComm_no(comm_no);
		cvo.setDiary_no(diary_no);
		
		result = dService.deleteComment(cvo);
		System.out.println("댓글 삭제 결과는~?" + result);
		
		return null;
	}

	// 파일 저장
	private String saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\diaryImg";
		File folder = new File(savePath);
		String url = "";
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}

		String filePath = null;

		try {
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);

			filePath = folder + "\\" + report.getOriginalFilename();

			report.transferTo(new File(filePath)); // 파일을 저장한다
			
			
			
			// cloudinary.uploader().upload(Object file, Map options);
			Map config = new HashMap();
			config.put("cloud_name", "djdjsp7t1");
			config.put("api_key", "862183527995216");
			config.put("api_secret", "TBR2K0Q2UcJ3BbbFG0JdWxVjXXI");
			Cloudinary cloudinary = new Cloudinary(config);
			
			Map res = cloudinary.uploader().upload(new File(filePath), ObjectUtils.emptyMap()); 
			url = res.get("url") == null ? "" : res.get("url").toString(); 
			System.out.println("::::"+url);

			
			
			
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");

		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return url;
	}

	// 파일 삭제
	private void removeFile(String board_file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\diaryImg";

		String filePath = savePath + "\\" + board_file;

		try {
			System.out.println(board_file + "을 삭제합니다.");
			System.out.println("기존 저장 경로 : " + savePath);

			File delFile = new File(filePath);
			delFile.delete();
			System.out.println("파일 삭제가 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
		}
	}

}
