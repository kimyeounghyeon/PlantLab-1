package com.plant.lab.fileController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.plant.lab.diary.model.Service.DiaryService;
import com.plant.lab.diary.model.vo.DiaryVO;
import com.plant.lab.member.model.vo.MemberVO;

@Controller
public class CommonController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private DiaryService dService;
	
	// 이미지 업로드
	   @ResponseBody
	   @RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	   public String fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, DiaryVO vo, HttpSession session) throws Exception {
	      JsonObject json = new JsonObject();
	      String jsonOutput = "";
	      PrintWriter printWriter = null;
	      OutputStream out = null;
	      System.out.println("들어왔는지확인이미지~");
	      MultipartFile file = multiFile.getFile("upload");
	      if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	         if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
	            if(file.getContentType().toLowerCase().startsWith("image/")) {
	               try {
	                     String fileName = file.getName();
	                     byte[] bytes = file.getBytes();
	                     String uploadPath = request.getServletContext().getRealPath("/resources/diaryImg");
	                     File uploadFile = new File(uploadPath);
	                     if(!uploadFile.exists()) {
	                        uploadFile.mkdirs();
	                     }
	                     fileName = UUID.randomUUID().toString();
	                     uploadPath = uploadPath + "/" + fileName;
	                     out = new FileOutputStream(new File(uploadPath));
	                     out.write(bytes);
	                     out.flush();
	                     
	                     
	                     printWriter = response.getWriter();
	                     System.out.println("response : " + response);
	                     response.setContentType("text/html");
	                     String fileUrl = request.getContextPath() + "/resources/diaryImg/" + fileName;
	                     String callback = request.getParameter("CKEditorFuncNum");
	                     
	                     json.addProperty("uploaded", 1);
	                     json.addProperty("fileName", fileName);
	                     json.addProperty("url", fileUrl);
	                     printWriter.println(json);
	                     
	                     Gson gson = new GsonBuilder().setPrettyPrinting().create();
	             		 jsonOutput = gson.toJson(json);
	             		 
	             		 System.out.println(jsonOutput);
	             	
	             		 MemberVO member = (MemberVO)session.getAttribute("loginMember");
	             		 vo.setDiary_write(member.getUserNo());
	             		 vo.setUser_id(member.getUserId());
	             		 vo.setUser_name(member.getUserName());
	             		 
	             		 
	             		 // 임시글 등록
	             		 int result = dService.writeDiary(vo);
	             		 System.out.println(result + "인서트 됐니?");
	             		 
	             		 // 이미지 등록
	             		 vo.setDiary_img_src(fileUrl);
	             		 vo.setDiary_no(vo.getDiary_no());
	             		 int resultImg = dService.writeImg(vo);
	             		 System.out.println(resultImg + " : 이거맞지~");
	             		 
	             		 
	             		 
	                     
	               }catch(IOException e) {
	                  e.printStackTrace();
	               }finally {
	                  if(out != null) {
	                     out.close();
	                  }
	                  if(printWriter != null) {
	                     printWriter.close();
	                  }
	                              }
	                        }
	                  }
	            }
	      			return null;
	   }
}