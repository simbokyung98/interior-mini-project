package com.mycompany.webapp.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.product.ProductDto;

@Mapper
public interface ProductDao {
	public int insertproduct(ProductDto product);
	public List<ProductDto> selectchairlist();
	public void saveImage(Map<String, Object> hmap);
	//public Map<String, Object> getByteImage(Map<String, Object> imap);
	public Map<String, Object> getByteImage();
}
