package com.jachmi.controller;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jachmi.domain.FAQAttachVO;
import com.jachmi.domain.NoticeAttachVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class NoticeUploadController {
	
	@GetMapping("/notice_uploadForm")
	public String uploadForm() {
		log.info("upload form");
		return "/notice_uploadForm";
	}
	
	@PostMapping("/notice_uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
//		MultipartFile의 메소드
//		String getName()				- 파라미터의 이름 <input> 태그의 이름
//		String getOriginalFileName() 	- 업로드 파일의 이름
//		boolean isEmpty()				- 파일이 존재하지 않는 경우 true
//		long getSize()					- 업로드 파일의 크기
//		byte[] getBytes()				- byte[] 로 파일 데이터 변환
//		InputStream getInputStream()	- 파일 데이터와 연결된 InputStream 반환
//		transforTo(File file) 			- 파일 저장
		
		String uploadFolder = "C:\\noticeUpload"; // 파일 저장 경로 변수
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("====================================");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename()); // 경로, 파일 이름 넣기
			
			try {
				multipartFile.transferTo(saveFile);	// 파일 저장
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	@GetMapping("/notice_uploadAjax")
	public String uploadAjax() {
		log.info("notice_uploadAjax");
		
		return "/notice_uploadAjax";
	}
	
	@PostMapping(value = "/notice_uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<FAQAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("updata ajax post.............");
		
		List<FAQAttachVO> attachVO = new ArrayList<FAQAttachVO>();
		
		String uploadFolder = "C:\\noticeUpload"; // 업로드 경로 변수
		
		// make folder 
		String uploadFolderPath = getFolder(); // 업로드할 폴더의 경로다.
		File uploadPath = new File(uploadFolder, uploadFolderPath);	// 
		log.info("uploadPath : " + uploadPath);
		
		if(uploadPath.exists() == false) {	// 경로에 파일이나 폴더가 있는지 확인한다
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("====================================");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());	
			log.info("upload File Size : " + multipartFile.getSize());
			
			FAQAttachVO attachDto = new FAQAttachVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();	// .getOriginalFilename() 업로드 된 파일의 이름을 불러오는 함수	

			// 원본 파일 이름	
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1); // 신식 브라우저에서는 substring이 큰 의미가 없다.
			log.info("only file name : " + uploadFileName);
			
			attachDto.setFileName(uploadFileName);	// dto에 파일명(원본) 저장
			
			UUID uuid = UUID.randomUUID();	// UUID : 중복 방지하는 식별자 생성
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;	// uuid까지 붙은 파일 이름
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);	// .transferTo() 파일 업로드 메소드
				
				attachDto.setUuid(uuid.toString());	// dto에 uuid 저장
				attachDto.setUploadPath(uploadFolderPath);	// dto에 업로드 경로 저장
				
				attachVO.add(attachDto);	// list에 dto 추가
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		} // end for		
		
		return new ResponseEntity<List<FAQAttachVO>>(attachVO, HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	// 날짜형식 변환
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
		// replace(기존 문자열, 변환 문자열) 기존 문자열을 변환 문자열로 바꿔준다.
		// File.separator는 파일 구분자를 뜻한다. 동적으로 활용하기 위해 "\\"가 아니라 File.separator로 사용했다. 
	}
	
	@GetMapping(value = "/notice_download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName){		// Resource 프레임 워크로 임포트
		log.info("download file : " + fileName);
		Resource resource = new FileSystemResource("C:\\noticeUpload\\" + fileName);
		log.info("resource : " + resource);
		
		String resourceName = resource.getFilename();
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();	// 이것도 프레임워크로 임포트
		
		try {
			headers.add("Content-Disposition", "attachment; filename=" + 
						new String(resourceOriginalName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping("notice_deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile : " + fileName);
		
		File file = null;
		
		try {
			file = new File("c:\\noticeUpload\\" + URLDecoder.decode(fileName, "utf-8")); // 프론트에서 인코딩을 해서 던져줬기 때문에 받는 쪽에서 디코딩을 해준다
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
