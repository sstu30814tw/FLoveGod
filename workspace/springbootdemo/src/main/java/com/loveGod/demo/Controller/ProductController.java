package com.loveGod.demo.Controller;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

@Controller
public class ProductController {
	
	

	//--------- 分頁顯示------------------------
//	@GetMapping("shop/page")
//	public String viewMessages(@RequestParam(name="p",defaultValue = "1") Integer pageNumber, Model model) {
//		Page<Products> page = pService.findByPage(pageNumber);
//		model.addAttribute("page", page);
//		
//		
//		return "shop/shop";
//	}
//	

	
//----------------------	
	//------------依id找產品
//	@GetMapping("/order/get/{id}")
//	public Order getById(@PathVariable("id") Integer  id ) {
//		Optional<Order> optional=oDao.findById(id);
//		
//		if(optional.isPresent()) {
//			Order respr =optional.get();
//			return respr;
//		}
//		
//		Order emptyOrder=new Order();
//		emptyOrder.setUserId("沒有這筆資料");
//		return emptyOrder;
//	}
	//跳頁 每頁幾筆資料
//	@GetMapping("/products/page/{pageNumber}")
//	public List<Products> findByPage(@PathVariable Integer pageNumber){
//		//從第幾頁開始 每頁三比 根據id屬性 由小排到大
//		Pageable pgb=PageRequest.of(pageNumber-1, 3, Sort.Direction.ASC, "prodPrice");
//		Page<Products> page=pDao.findAll(pgb);
//		List<Products> list=page.getContent();
//		return list;
//	}
//		

}
