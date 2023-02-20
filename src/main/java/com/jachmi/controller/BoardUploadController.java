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

import com.jachmi.domain.BoardAttachVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardUploadController {
	
	@GetMapping("/p_uploadForm")
	public String uploadForm() {
		log.info("uploadForm!!!!!!!!!!!!!!!!!!!");
		return "/uploadForm";
	}
	@PostMapping("/p_uploadFormAction")
	public void uploadFromPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "C:\\projectUpload";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("===========================");
			log.info("upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	@GetMapping("/p_uploadAjax")
	public String uploadAjax() {
		log.info("uploadAjax!!!!!!!!!!!!!!!!!");
		return "/uploadAjax";
	}
	
	@PostMapping(value = "/p_uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile){
		log.info("update ajax post!!!!!!!!!!!");
		log.info(uploadFile.length);
		
		List<BoardAttachVO> list = new ArrayList<BoardAttachVO>();
		
		String uploadFolder = "C:\\projectUpload";
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);		// getFolder()를 빠로 변수로 만들어서 집어넣음
		log.info("upload path : " + uploadPath);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			BoardAttachVO attachVO = new BoardAttachVO();
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name!!!!!!!!!!!!! : " + uploadFileName);
			
			attachVO.setB_fileName(uploadFileName);
			
			UUID b_uuid = UUID.randomUUID();
			
			uploadFileName = b_uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachVO.setB_uuid(b_uuid.toString());
				attachVO.setB_uploadPath(uploadFolderPath);
				
				list.add(attachVO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<List<BoardAttachVO>>(list, HttpStatus.OK);
	}
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	@GetMapping(value = "/p_download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String b_fileName){
		log.info("downloadFile!!!!!!!!!!! : " + b_fileName);
		Resource resource = new FileSystemResource("C:\\projectUpload\\" + b_fileName);
		log.info("resource!!!!!!!!!!!" + resource);
		
		String resourceName = resource.getFilename();
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+ 1);
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attachment; fileName=" + new String(resourceOriginalName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping("p_deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile!!!!!!!!!!!!! : " + fileName);
		File file = null;
		
		try {
			file = new File("C:\\projectUpload\\" + URLDecoder.decode(fileName, "utf-8"));
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
