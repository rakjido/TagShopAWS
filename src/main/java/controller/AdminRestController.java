package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import service.ShopsService;
import service.UsersService;
import vo.ProductsVo;
 

@RestController
@RequestMapping("/admin")
public class AdminRestController {
	
	@Autowired
	private UsersService service;
	
	@Autowired
	private ShopsService shopService;
	
	@RequestMapping(value="/usersList", method=RequestMethod.POST)
	public Object getEnabledUsers(){
		
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", service.getEnabledUsers());

		return mp;
	}
	
	@RequestMapping(value="/productsList", method=RequestMethod.POST)
	public Object getProductList(){
		System.out.println("들어옴");
		System.out.println(shopService.productCategories());
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", shopService.productCategories());
		
		return mp;
	}
	


}