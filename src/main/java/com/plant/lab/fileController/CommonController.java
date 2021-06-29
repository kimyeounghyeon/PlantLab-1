package com.plant.lab.fileController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
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
	   public String fileUpload(HttpServletRequest request, 
			   @RequestParam MultipartFile upload,HttpServletResponse response, MultipartHttpServletRequest  multiFile, DiaryVO vo, HttpSession session) throws Exception {
		   String savePath = request.getContextPath()+"/resources/diaryImg/";
			String realPath = "/diaryImg/";
			response.setCharacterEncoding("UTF-8");

			try {
				//폴더가 없을 경우 생성
				String root = request.getServletContext().getRealPath("/");
				File path = new File(root+realPath);
				//File path = new File(savePath);
				
				if(!path.exists()) {
					path.mkdirs();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			realPath = request.getServletContext().getRealPath("/resources/diaryImg/");
			
			
			
			
			//파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			
			//저장
			
			upload.transferTo(new File(realPath+fileName)); // 파일을 저장한다
			
			if(upload == null) {
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
			
			String path = savePath+fileName;
			PrintWriter out = response.getWriter();
//			out.println("{"); 
//			out.println("\"uploaded\": 1,"); 
//			out.println("\"fileName\": \""+fileName+"\","); 
//			out.println("\"url\":\""+savePath+"\""); 
//			out.println("}");
//			out.flush();
//			out.close();
			
			JsonObject json = new JsonObject();
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", path);

			out.println(json);
			
			System.out.println("파일이름: " + fileName);
			System.out.println("파일경로: " + path);
			System.out.println("파일경로2: " + savePath);
		   
		   
//	             		 
//	             		 
//	                     
//	               }catch(IOException e) {
//	                  e.printStackTrace();
//	               }finally {
//	                  if(out != null) {
//	                     out.close();
//	                  }
//	                  if(printWriter != null) {
//	                     printWriter.close();
//	                  }
//	                              }
//	                        }
//	                  }
//	            }
	      			return null;
	   }
}