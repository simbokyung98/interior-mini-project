<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/equipment/dental_equipment_main.css" rel="stylesheet" type="text/css"/>
<div id="dentalequipmentmain_wrapper">

        <div id="eq_main_image_list" class="eq_slider">
            <input type="radio" name="slide" id="slide1" checked>
            <input type="radio" name="slide" id="slide2">
            <input type="radio" name="slide" id="slide3">
            <input type="radio" name="slide" id="slide4">
            <ul id="imgholder" class="imgs">
                <li><img src="${pageContext.request.contextPath}/resources/subinimage/eqimage2.PNG"></li>
                <li><img src="${pageContext.request.contextPath}/resources/subinimage/eqimage3.PNG"></li>
                <li><img src="${pageContext.request.contextPath}/resources/subinimage/eqimage4.PNG"></li>
                <li><img src="${pageContext.request.contextPath}/resources/subinimage/chair_slider.PNG"></li>
            </ul>
            <div class="bullets">
                <label for="slide1">&nbsp;</label>
                <label for="slide2">&nbsp;</label>
                <label for="slide3">&nbsp;</label>
                <label for="slide4">&nbsp;</label>
            </div>
            <!--<img id="eq_main_image1" class="eq_main_image" src="/subinimage/eqimage3.jpg">
            <img id="eq_main_image2" class="eq_main_image" src="/subinimage/eqimage3.PNG">
            <img id="eq_main_image3" class="eq_main_image" src="/subinimage/eqimage4.PNG">-->
        </div>
            <div id="dentalequipmentmain_content"><!-- 본문 작성 시작-->
                <div id="dentalequipmentmain_left">
                    <div class="dropdown">
                        <button class="dropdown-button">Category</button>
                        <div class="dropdown-content">
                        	<div class="p-2 d-flex flex-column">
						       <label class="dropdown-content-element">
						           <input type="radio" name="category" value="unitchair">
						           <span class="ml-2">유니트 체어</span>
						       </label>
						       <label class="dropdown-content-element">
						           <input type="radio" name="category" value="largecamera">
						           <span class="ml-2">대형 영상 장비</span>
						       </label>
						       <label class="dropdown-content-element">
						           <input type="radio" name="category" value="washingmachine">
						           <span class="ml-2">멸균 및 세척기</span>
						       </label>
						       <label class="dropdown-content-element">
						           <input type="radio" name="category" value="smallcamera">
						           <span class="ml-2">소형 영상 장비</span>
						       </label>
						       <label class="dropdown-content-element">
						           <input type="radio" name="category" value="etc">
						           <span class="ml-2">기타 장비</span>
						       </label>
					       </div>
                            <%-- <a type="button" class="dropdown-content-element" name="category" href="${pageContext.request.contextPath}/equipment/dental_equimpent_main?category=unitchair">유니트 체어</a>
                            <a type="button" class="dropdown-content-element" name="category" href="${pageContext.request.contextPath}/equipment/dental_equimpent_main?category=largecamera">대형 영상 장비</a>
                            <a type="button" class="dropdown-content-element" name="category" href="${pageContext.request.contextPath}/equipment/testCategory?category=washingmachine">멸균 및 세척기</a>
                            <a type="button" class="dropdown-content-element" name="category" href="${pageContext.request.contextPath}/equipment/dental_equimpent_main?category=smallcamera">소형 영상 장비</a>
                            <a type="button" class="dropdown-content-element" name="category" href="${pageContext.request.contextPath}/equipment/dental_equimpent_main?category=etc">기타 장비</a> --%>
                        </div>
                    </div>
                </div>
            <div id="dental_product_list_wrap">
                <div id="dentalequipmentmain_right">
                    <p id="best_product_content">BEST ITEM</p>
                    <div id="makeline">　</div>
                    <div id="eq_list1" class="eq_list"><!--베스트 상품-->
                    <c:forEach var="bestchair" items="${bestchairList}" begin="0" end="2">
                        <a id="go_k3chair" href="${pageContext.request.contextPath}/equipment/equipment_detail_consult?modelNumber=${bestchair.modelNumber}" class="gotolink">
                            <div id="eq_list_content1" class="card">
                                <img id="eq_list_content1_image"src="/springframework-mini-project/equipment/display?fileName=${bestchair.pattachoname}" class="card-img-top">
                                <div class="card-body">
                                    <p id="eq_list_content1_element1" class="card-text"><img id="eq_best_icon"src="${pageContext.request.contextPath}/resources/subinimage/popularity.png"/>${bestchair.productName}</p>
                                    <hr/>
                                    <p id="eq_list_content1_element2" class="card-text">${bestchair.productIntro}</p>
                                    <p id="eq_list_content1_element3" class="card-text"><img id="eq_price_icon"src="${pageContext.request.contextPath}/resources/subinimage/price_icon.png"/>가격</p>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                    </div>

                    <!-- <form id="product_filter" action="Sort" method="get">
                    	<input type="hidden"
                    	name="sort" value="1"></input><input class="btn btn-link-dark" type="submit" value="인기순"/>　　|　　
                    	<a 
                    	name="sort" value="2">조회순</a> 　　| 　　
                    	<a 
                    	name="sort" value="3">리뷰순</a> 　　| 　　
                    	<a 
                    	name="sort" value="4">최신 등록순</a>
                    </form>   -->  
                    <div class="p-2 d-flex">
				       <label>
				           <input type="radio" name="sort" value="popular">
				           <span class="ml-2">인기순</span>
				       </label>
				       <label>
				           <input type="radio" name="sort" value="views">
				           <span class="ml-2">조회순</span>
				       </label>
				       <label>
				           <input type="radio" name="sort" value="reviews">
				           <span class="ml-2">리뷰순</span>
				       </label>
				       <label>
				           <input type="radio" name="sort" value="new">
				           <span class="ml-2">최신 등록순</span>
				       </label>
			       </div>
                    <p id="best_product_content" >전체 상품</p>
                    <div id="makeline">　</div>
                    <div id="product_all_list_sort">
						<div id="eq_list2" class="eq_list"><!--전체 상품-->
	                        <!--href="${pageContext.request.contextPath}/equipment/dental_equipment_main?sort='salesCount'"  -->
	                    <c:forEach var="chair" items="${chairList}">
	                        <a id="go_k3chair" href="${pageContext.request.contextPath}/equipment/equipment_detail_consult?modelNumber=${chair.modelNumber}" class="gotolink">
	                            <div id="eq_list_content1" class="card">
	                                <img id="eq_list_content1_image"src="/springframework-mini-project/equipment/display?fileName=${chair.pattachoname}" class="card-img-top">
	                                <div class="card-body">
	                                    <p id="eq_list_content1_element1" class="card-text">${chair.productName}</p>
	                                    <hr/>
	                                    <p id="eq_list_content1_element2" class="card-text">${chair.productIntro}</p>
	                                    <p id="eq_list_content1_element3" class="card-text"><img id="eq_price_icon"src="${pageContext.request.contextPath}/resources/subinimage/price_icon.png"/>가격</p>
	                                </div>
	                            </div>
	                        </a>
	                    </c:forEach>
	
	                  </div>
                    
                    </div>
                  <!-- 장바구니 테스트용입니당 추후 카테고리 구분되면 지울게용가리 -->
                  <div id="eq_list3" class="eq_list"><!--전체 상품-->
                        <!--href="${pageContext.request.contextPath}/equipment/dental_equipment_main?sort='salesCount'"  -->
                    <c:forEach var="chair" items="${chairList}" begin="0" end="1">
                        <a id="go_k3chair" href="${pageContext.request.contextPath}/equipment/equipment_detail?modelNumber=${chair.modelNumber}" class="gotolink">
                            <div id="eq_list_content1" class="card">
                                <img id="eq_list_content1_image"src="/springframework-mini-project/equipment/display?fileName=${chair.pattachoname}" class="card-img-top">
                                <div class="card-body">
                                    <p id="eq_list_content1_element1" class="card-text">${chair.productName}</p>
                                    <hr/>
                                    <p id="eq_list_content1_element2" class="card-text">${chair.productIntro}</p>
                                    <div id="eq_list_content1_element3" class="card-text"><img id="eq_price_icon"src="${pageContext.request.contextPath}/resources/subinimage/price_icon.png"/>가격　<fmt:formatNumber pattern="###,###,###,###" value="${chair.price}"/>원</div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                  </div>
            </div>
         </div>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/resources/js/equipment/dental_equipment_main.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>