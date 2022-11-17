package com.loveGod.demo.Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.loveGod.demo.model.RegisterModel;
import com.loveGod.demo.service.RegisterService;

@Controller
public class LoginController {

	@Autowired
	private RegisterService rService; // Service部分
	// jsp 分別為：login(登入)、register(註冊)、registerSuccess(註冊成功)、user(修改會員)

	// ================================== 登入頁面 ==================================
	@GetMapping("/login") 								// 網址http://localhost:8080/my-app/login
	public String login(HttpServletRequest request) {   // 進入方法(login)
		// ----- 抓登入帳密要用來判斷重複登入(登入又故意去登入) ----- 
		HttpSession session = request.getSession();		
		Object memberId = session.getAttribute("memberId");
		if (memberId != null) { 						// 如果已有登入未登入
			return "redirect:index"; 					// 強制給我滾回來
		} else {
			return "login/login"; 						// 找 /login.jsp 顯示畫面：登入畫面
		}
	}

	// ================================== 登出頁面 ==================================
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) { // 進入方法(login)
		HttpSession session = request.getSession();    // 使用 session
		session.removeAttribute("memberId"); 		   // 刪掉
		session.removeAttribute("password");
		return "redirect:index";
	}

	// ================================== 註冊頁面 ==================================
	@GetMapping("/register") 							// 網址http://localhost:8080/my-app/register
	public String register() { 							// 進入方法(register)
		return "login/register"; 						// 找 資料夾/register.jsp 顯示畫面：註冊畫面
	}

	// ================================== 註冊成功/失敗 ==================================

		// ----- 生日換算成年齡 -----
	public int CalculateAge(Date Birthday) {
		// ----- 當前年份 - 生日 = 年齡 ----
		Calendar cal = Calendar.getInstance();
		Calendar bir = Calendar.getInstance();
		bir.setTime(Birthday);
		/* 取出當前年月日 */
		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH);
		int dayNow = cal.get(Calendar.DAY_OF_MONTH);
		/* 取出出生年月日 */
		int yearBirth = bir.get(Calendar.YEAR);
		int monthBirth = bir.get(Calendar.MONTH);
		int dayBirth = bir.get(Calendar.DAY_OF_MONTH);
		/* 大概年齡是當前年減去出生年 */
		int age = yearNow - yearBirth;
		/* 如果出當前月小與出生月，或者當前月等於出生月但是當前日小於出生日，那麽年齡age就減一歲 */
		if (monthNow < monthBirth || (monthNow == monthBirth && dayNow < dayBirth)) {
			age--;
		}
		return age;
	}

	// ----- 註冊成功畫面 -----
	//	@RequestMapping(value = "/registersubmit", method = RequestMethod.POST)
	@PostMapping("/registersubmit")
	public String registersubmit(@ModelAttribute(name = "registersubmit") RegisterModel rM, Model model) {

		List<RegisterModel> resultList = rService.findMemberId(rM);
		if (resultList.size() > 0) { 				  // 他有找到
			model.addAttribute("Msg", "*帳號已經有重複的");
			return "login/register";  				  // return "redirect:register";
		} else {
			// -- 資料傳到SQL ---
			int age = CalculateAge(rM.getBirthday()); // 把生日放進 轉換成年齡的方法 裡面執行再把結果放變數裡面
			rM.setAge(age); 						  // 放到年齡欄位裡面
			rService.insertRegister(rM);              // 把資料放進去(插入)
			return "login/registerSuccess"; 		  // 顯示畫面：註冊成功畫面
		}
	}

	// ================================== 使用者登入：判斷帳密是否正確 ========================
	@PostMapping("/loginsubmit")
	public String loginsubmit(HttpServletRequest request, @ModelAttribute(name = "loginsubmit") RegisterModel rM,
			Model model) {
		// ---- 資料傳到SQL ------
		List<RegisterModel> resultList = rService.findLogin(rM);

			System.out.println("==================== .登入. =========================");
			if (resultList.size() > 0) { 			   // 登入：不存在資料庫的帳密 => 帳密錯誤
				// 如果登入成功帳密存到Session
				// 第一步：获取session
				HttpSession session = request.getSession();
				// 第二步：将想要保存到数据存入session中
				session.setAttribute("memberId", resultList.get(0).getMemberId()); // 取得那欄位的帳號,從0(陣列)開始,放入session
				session.setAttribute("password", resultList.get(0).getPassword());
				session.setAttribute("match", resultList.get(0).getMach());
				// <c:set scope="session" var="name" value="${sessionScope.name}" /> 呼叫↓
				session.setAttribute("name", resultList.get(0).getName());		   // 顯示導覽頁的使用者	
				// 这样就完成了用户名和密码保存到session的操作
				return "redirect:index";
			} else {
				model.addAttribute("Msg", "*帳密錯誤!!"); // 畫面顯示：*帳密錯誤!!
				return "login/login"; 				   // 返回登入畫面
			}
	}
	// ===================================== 顯示：修改使用者資料 =======================================
	
	// ---- 用來顯示更新成功的方法 ----
//	public Model getViewUser(HttpServletRequest request, Model model) {
//		HttpSession session = request.getSession();
//		String memberId = session.getAttribute("memberId").toString(); // 使用Session是因為要用抓這人的帳密來判斷這人的資料
//		String password = session.getAttribute("password").toString();
//		List<RegisterModel> userList = rService.viewUser(memberId, password);
//		if (userList.size() > 0){
//			// 表示有資料
//			model.addAttribute("MemberId", userList.get(0).getMemberId());
//			model.addAttribute("Password", userList.get(0).getPassword());
//			model.addAttribute("Name", userList.get(0).getName());
//			model.addAttribute("Sex", userList.get(0).getSex());
//			model.addAttribute("Birthday", userList.get(0).getBirthday());
//			model.addAttribute("Phone", userList.get(0).getPhone());
//			model.addAttribute("Mail", userList.get(0).getMail());
//			model.addAttribute("Address", userList.get(0).getAddress());
//			model.addAttribute("Mach", userList.get(0).getMach());
//			model.addAttribute("Text", userList.get(0).getText());
//			model.addAttribute("Line", userList.get(0).getLine());
//			model.addAttribute("Ig", userList.get(0).getIg());
//		}
//		return model;
//	}
	
	// ---- 顯示修改會員資料 ----
	@GetMapping("/user")
	public String viewUser(HttpServletRequest request, RegisterModel rM, Model model) {
		HttpSession session = request.getSession();
		String memberId = session.getAttribute("memberId").toString(); // 使用Session是因為要用抓這人的帳密來判斷這人的資料
		String password = session.getAttribute("password").toString();
		List<RegisterModel> userList = rService.viewUser(memberId, password);
		if (userList.size() > 0){
			// 表示有資料
			model.addAttribute("MemberId", userList.get(0).getMemberId());
			model.addAttribute("Password", userList.get(0).getPassword());
			model.addAttribute("Name", userList.get(0).getName());
			model.addAttribute("Sex", userList.get(0).getSex());
			model.addAttribute("Birthday", userList.get(0).getBirthday());
			model.addAttribute("Phone", userList.get(0).getPhone());
			model.addAttribute("Mail", userList.get(0).getMail());
			model.addAttribute("Address", userList.get(0).getAddress());
			model.addAttribute("Mach", userList.get(0).getMach());	
			model.addAttribute("Text", userList.get(0).getText());	
			model.addAttribute("Line", userList.get(0).getLine());			
			model.addAttribute("Ig", userList.get(0).getIg());
			return "/user/user";
		}else {
			//表示帳密錯誤 或者Session有問題
			session.removeAttribute("memberId"); 	// 刪掉
			session.removeAttribute("password");
			return "redirect:index";
		}
	}
	// ===================================== 送出：修改使用者資料 =======================================
	@PostMapping("/usersubmit")
	public String UpdateUser(HttpServletRequest request, 
			@ModelAttribute("usersubmit")RegisterModel rM, Model model) {
		System.out.println("=============== .送出修改. =================");
		int age = CalculateAge(rM.getBirthday()); // 把生日放進 轉換成年齡的方法 裡面執行再把結果放變數裡面
		rM.setAge(age); 						  // 放到年齡欄位裡面
		
		HttpSession session = request.getSession();
		String memberId = session.getAttribute("memberId").toString(); // 使用Session是因為要用抓這人的帳密來判斷這人的資料
		String password = session.getAttribute("password").toString();
		rM.setMemberId(memberId); 	
		rM.setPassword(password); 	
		
		int isUpdate = rService.updateUser(rM);              // 把資料放進去(插入)
		if(isUpdate > 0) {
//			model = getViewUser(request, model);		// 如果要顯示更新成功這三段就要開啟getViewUser方法
//			model.addAttribute("Msg", "*更新成功!!");
//			return "user/user";
			return "redirect:user";						// 使用此return是不會顯示更新成功
		}
		else {
			model.addAttribute("Msg", "*更新失敗!!"); // 畫面顯示：*帳密錯誤!!
			return "user/user"; 				   // 返回登入畫面
		}
	}
	
}
