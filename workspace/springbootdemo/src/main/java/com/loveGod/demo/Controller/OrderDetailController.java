 package com.loveGod.demo.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.loveGod.demo.model.OrderDetail;
import com.loveGod.demo.service.OrderDetailService;


@Controller
public class OrderDetailController {
	
	@Autowired
	private OrderDetailService oDService;
	

	@GetMapping("/orderDetailList")
    public String orderList(@RequestParam("orderId")Integer oderId,Model model) {
		List<OrderDetail> orderDetail = oDService.findOrderID(oderId);
		model.addAttribute("orderDetail", orderDetail);
		return "/shop/orderDetailList";
    }

	
	
	//---商品照片
	@GetMapping("/downImg/{id}")
	public ResponseEntity<byte[]> downImg(@PathVariable("id")Integer prodId){
		OrderDetail o1=oDService.getOrderDetail(prodId);
		
		byte[] oPhoto=o1.getProd_photo();
		
		//改變contextType
		HttpHeaders headers=new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]> (oPhoto,headers,HttpStatus.OK);
	}
	

 }
	
	
	


