package com.mino.mapper;

import java.util.List;

import com.mino.domain.CateVO;
import com.mino.domain.Paging;
import com.mino.domain.ItemVO;

public interface AdminMapper {

	//상품 등록
	public void itemEnroll(ItemVO item);
	
	//카테고리 리스트
	public List<CateVO> cateList();
	
	//상품 리스트
	public List<ItemVO> shopList(Paging page);
	
	//상품 총 갯수
	public int shopTotal(Paging page);
	
	//상품 조회
	public ItemVO shopView(int itemId);
	
	//상품 수정
	public int shopModify(ItemVO item);
	
	//상품 삭제
	public int shopDelete(int itemId);
}
