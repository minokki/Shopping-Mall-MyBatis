package com.mino.service;

import java.util.List;

import com.mino.domain.CateVO;
import com.mino.domain.ItemVO;
import com.mino.domain.Paging;

public interface AdminService {
	//상품 등록
	public void itemEnroll(ItemVO item);
	
	//카테고리 목록
	public List<CateVO> cateList();
	
	//상품 리스트
	public List<ItemVO> shopList(Paging page);
	
	//상품 총 갯수
	public int shopTotal(Paging page);
	
	//상품 정보 보기
	public ItemVO shopView(int itemId);

}
