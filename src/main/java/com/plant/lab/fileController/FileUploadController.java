package com.plant.lab.fileController;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadController {
	private void saveFile(MultipartFile report1, MultipartFile report2, HttpServletRequest request) {
		String root1 = request.getSession().getServletContext().getRealPath("resources");
		String root2 = request.getSession().getServletContext().getRealPath("resources");
		String savePath1 = root1 + "\\img";
		String savePath2 = root2 + "\\img";
		File folder1 = new File(savePath1);
		File folder2 = new File(savePath2);
		if (!folder1.exists()) {
			folder1.mkdir(); // 폴더가 없다면 생성한다.
		}
		if (!folder2.exists()) {
			folder2.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath1 = null;
		String filePath2 = null;
		try { // 파일 저장
			filePath1 = folder1 + "\\" + report1.getOriginalFilename();
			report1.transferTo(new File(filePath1)); // 파일을 저장한다

			filePath2 = folder2 + "\\" + report2.getOriginalFilename();
			report2.transferTo(new File(filePath2)); // 파일을 저장한다
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
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
