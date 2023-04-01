package com.mino.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mino.domain.ImageVO;
import com.mino.service.ImageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ShopController {
	
	@Autowired
	private ImageService imageService;
	
	@RequestMapping("/")
	public String mainPage() {
		
		log.info("메인페이지 진입");
		
		return "/index";
		
	}
	
	@GetMapping("displayImg")
	public ResponseEntity<byte[]> imageGet(String fileName) {
		
		log.info("이미지 이름=" +fileName);
		File file = new File("C:\\Users\\PC\\Desktop\\upload\\"+fileName);
		
		ResponseEntity<byte[]> result = null; //뷰로 반환할 객체주소를 선언하고 초기화
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping(value="/getImageList", produces = MediaType.APPLICATION_JSON_VALUE) //반환되는 데이터가 json 형식으로 지정해주기위함
	public ResponseEntity<List<ImageVO>> getImageList(int itemId) {
		
		System.out.println("getImagelist 리스트 진입");
		
		return new ResponseEntity(imageService.getImageList(itemId), HttpStatus.OK);
		
	}

}
