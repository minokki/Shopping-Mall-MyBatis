package com.mino.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mino.domain.ImageVO;
import com.mino.domain.OrderItemDTO;
import com.mino.mapper.ImageMapper;
import com.mino.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ImageMapper imageMapper;

	@Override
	public List<OrderItemDTO> getGoodsInfo(List<OrderItemDTO> orders) {
		List<OrderItemDTO> list = new ArrayList<OrderItemDTO>();		
		
		for(OrderItemDTO oid : orders) {
			
			OrderItemDTO orderInfo = orderMapper.orderInfo(oid.getItemId());			

			orderInfo.setItemCount(oid.getItemCount());	
			
			orderInfo.initSaleTotal();
			
			List<ImageVO> imageList = imageMapper.getImageList(orderInfo.getItemId());
			
			orderInfo.setImageList(imageList);
			
			list.add(orderInfo);			
		}
		return list;

}
	
}