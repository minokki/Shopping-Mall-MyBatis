package com.mino.mapper;

import java.util.List;

import com.mino.domain.ImageVO;

public interface ImageMapper {
	
	//이미지 데이터 
	public List<ImageVO>getImageList(int itemId);
	
	

}
