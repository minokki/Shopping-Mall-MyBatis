package com.mino.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mino.domain.CateVO;
import com.mino.domain.ItemVO;
import com.mino.domain.Paging;
import com.mino.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public void itemEnroll(ItemVO item) {
		
		log.info("service=itemEnroll");
		adminMapper.itemEnroll(item);
	}

	@Override
	public List<CateVO> cateList() {
		
		return adminMapper.cateList();
	}

	@Override
	public List<ItemVO> shopList(Paging page) {
		
		log.info("shopList=(service)");
		return adminMapper.shopList(page);
	}

	@Override
	public int shopTotal(Paging page) {
		
		log.info("shopList==(service)");
		return adminMapper.shopTotal(page);
	}

	@Override
	public ItemVO shopView(int itemId) {
		
		return adminMapper.shopView(itemId);
	}

	@Override
	public int shopModify(ItemVO item) {
		
		return adminMapper.shopModify(item);
	}

	@Override
	public int shopDelete(int itemId) {
		
		return adminMapper.shopDelete(itemId);
	}

}
