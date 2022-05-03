package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mycompany.webapp.dto.product.ProductDto;
import com.mycompany.webapp.service.ProductService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@SessionAttributes({"cartForm"})
public class CartController {
	@Resource
	private ProductService productService;
	
	//세션 생성
	@ModelAttribute("cartForm")
	public List<ProductDto> getCartForm(){
		log.info("카트 세션 생성");
		List<ProductDto> cartForm=new ArrayList<ProductDto>();
		return cartForm;
	}
	
	//카트에 추가
	@PostMapping(value="/cartSessionAdd", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String addCartForm(@ModelAttribute("cartForm") List<ProductDto> cartList
			, String modelNum, String qua, Model model) {
		log.info("카트에 추가해요?");
		String result=null;
		for(ProductDto dto:cartList) {	
			if(dto.getModelNumber().equals(modelNum)) {
				log.info("카트에 동일한 장비 있음");
				result="wrong";
			}
		}
		//카트에 동일한 장비가 없을 경우
		if(result==null) {
			ProductDto productDto=new ProductDto();
			productDto.setModelNumber(modelNum);
			productDto.setCartQua(qua);
			cartList.add(productDto);
			model.addAttribute("cartForm", cartList);
			result="success";
			log.info("카트에 추가 완료");
		}
		//result  전송
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("result", result);
		String json = jsonobject.toString();
		log.info("카트에 추가할 정보"+cartList);
		log.info(json);
		return json;
	}
	
	//카트 조회
	@RequestMapping("/equipment/shoppingcart_rentalandpurchase")
	public String shoppingcart_rentalandpurchase(@ModelAttribute("cartForm") List<ProductDto> cartList,
			Model model, String modelNum) {
		log.info(cartList);
		List<ProductDto> productList=new ArrayList<ProductDto>();
		if(cartList.size()!=0) {
			for(ProductDto dto:cartList) {
				ProductDto productDto=productService.detailProduct(dto.getModelNumber());
				productDto.setCartQua(dto.getCartQua());
				productList.add(productDto);
			}
			model.addAttribute("productList", productList);
			log.info(productList);
		}
		
		return "/equipment/shoppingcart_rentalandpurchase";

	}
}