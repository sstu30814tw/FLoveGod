package com.loveGod.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.loveGod.demo.model.Order;
import com.loveGod.demo.model.OrderDetail;
import com.loveGod.demo.service.OrderDetailService;
import com.loveGod.demo.service.OrderService;

@Controller
public class OrderForPieController {
	
	@Autowired
	private OrderDetailService oDService;
	@Autowired
	private OrderService oService;
	
	
	@GetMapping("/orderPie")
	public String viewHomePage(Model model){
		List<OrderDetail> orderDetail = oDService.listOrderDetail();
		List<Order> order = oService.findAllOrder();
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("order", order);
	        return "/shop/orderPie";
	 }

}
