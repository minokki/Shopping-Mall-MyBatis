package com.mino.mapper;

import com.mino.domain.OrderItemDTO;

public interface OrderMapper {

	//주문 상품 정보	
	public OrderItemDTO orderInfo(int bookId);
}
