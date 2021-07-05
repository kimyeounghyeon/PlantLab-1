package com.plant.lab.fileController;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;


public class FileUploadController {
	public String saveFile(MultipartFile report, HttpServletRequest request) {
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
	
	
	private void removeFile(String event_content, String banner, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img";
	
		String filePath1 = savePath + "\\" + banner;
		String filePath2 = savePath + "\\" + event_content;
	try { // 파일 저장

		File delFile1 = new File(filePath1);
		delFile1.delete();
		System.out.println("파일1 삭제가 완료되었습니다.");
		File delFile2 = new File(filePath2);
		delFile2.delete();
		System.out.println("파일2 삭제가 완료되었습니다.");
	}catch(Exception e1) {
		System.out.println("파일 삭제 에러 : " + e1.getMessage());
	}
 }
}
