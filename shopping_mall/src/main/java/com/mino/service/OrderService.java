package com.mino.service;

import java.util.List;

import com.mino.domain.OrderItemDTO;

public interface OrderService {
	
	//주문 상품 정보
	public List<OrderItemDTO> getGoodsInfo(List<OrderItemDTO> orders);

}
