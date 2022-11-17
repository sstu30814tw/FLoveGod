package com.loveGod.demo.Controller.Management;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.loveGod.demo.model.Products;
import com.loveGod.demo.service.ProdManagementService;

@Controller
public class ProManagementController {
	
	@Autowired
	private ProdManagementService pmService;

	@GetMapping("/product/page")
	public String viewMember(@RequestParam(name="p",defaultValue="1") Integer pageNumber, Model model) {
		Page<Products> page = pmService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "management/shopManagement";
	}
	@GetMapping("/product/deleteProduct")
	public String deleteProduct(@RequestParam("id") Integer id) {
		pmService.deleteById(id);
		return "redirect:/product/page";
	}
	
	@GetMapping("product/editProduct")
	public String editProduct(@RequestParam("id") Integer id, Model model) {
		Products pro = pmService.findById(id);
		model.addAttribute("products",pro);
		return "management/editproduct";
	}
	
//	@GetMapping("product/editPhoto")
//	public String editPhoto(@RequestParam("id") Integer id, Model model) {
//		Products pho = pmService.findById(id);
//		model.addAttribute("photo",pho);
//		return "management/editphoto";
//	}
	
//	@PostMapping("/product/postEditProduct")
//	public String postEditProduct(@ModelAttribute("products") Products pro) {
//		pmService.insert(pro);
//		return "redirect:/product/page";
//	}
	
    @PostMapping("/product/postEditProduct")
    public String postEditProduct(
            @RequestParam("prodId") Integer prodId,
            @RequestParam("productName") String productName,
            @RequestParam("productPrice") Integer productPrice,
            @RequestParam("productStock") Integer productStock,
            @RequestParam(value = "photo", required = false) MultipartFile prodPhoto) {

        byte[] photo;
        if(!prodPhoto.isEmpty()){
            try {
                photo = prodPhoto.getBytes();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            Products product = pmService.findById(prodId);
            photo = product.getProdPhoto();
        }
        Products products = new Products(prodId, productName, productPrice, photo, productStock);
        pmService.insert(products);
        return "redirect:/product/page";
    }
	

	
//	//跳轉到上傳圖片的頁面
//	@GetMapping("/newProducts")
//	public String newProducts() {
//		return "shop/uploadPage";
//		
//	}	
	
	
	//上傳圖片成功導入 另外一個頁面
	@PostMapping("/product/fileUpload")
	public String postNewProducts(@RequestParam("pName")String name,
								  @RequestParam("file") MultipartFile photo,
								  @RequestParam("pPrice")Integer price,
								  @RequestParam("pStock")Integer stock) {
		Products addP=new Products(); //資料庫的table 名稱
		try {
			//到資料庫取得 放入使用者輸入的名稱
			addP.setProdName(name);
			// 放入價格
			addP.setProdPrice(price);
			// 放入照片
			addP.setProdPhoto(photo.getBytes());
			// 放入庫存
			addP.setProdStock(stock);
			// 透過 Service 的  (老師命名的方法insertProducts) 這個方法 主要是在存入save 到資料庫 addP=把名稱、價格、照片放入
			pmService.insert(addP);
			
			return "/shop/uploadSuccessPage" ;
			
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
	
//-------------------------------------
	//headers 這個回傳是HTML
	@GetMapping("/shop")
	public String listProducts(Model model) {
		List<Products> list=pmService.findAllProducts();
		model.addAttribute("productsList",list);
		return "shop/shop";
	}
	
	
	//回傳圖片
	@GetMapping("/downloadImg/{id}")
	public ResponseEntity<byte[]> downloadImg(@PathVariable("id")Integer id){
		Products p1=pmService.findById(id);
		
		byte[] pPhoto=p1.getProdPhoto();
		
		//改變contextType
		HttpHeaders headers=new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]> (pPhoto,headers,HttpStatus.OK);
	}
}
