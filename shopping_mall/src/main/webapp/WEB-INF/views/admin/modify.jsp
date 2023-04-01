<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../resources/css/admin/modify.css?after">

<script  src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  
  <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script> <!--ckeditor5  -->
<title>Insert title here</title>
</head>
<body>
	<%@include file="../includes/admin/header.jsp" %>
					
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/modify" method="post" id="modifyForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>물품 제목</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="itemName" value="${viewInfo.itemName}">
                    				<span class="ck_warn itemName_warn">책 이름을 입력해주세요.</span>
                    			</div>
                    		</div>
       							<div class="form_section">
                    			<div class="form_section_title">
                    				<label>카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
                    					<span>대분류</span>
                    					<select class="cate1">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cate_wrap">
                    					<span>중분류</span>
                    					<select class="cate2">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cate_wrap">
                    					<span>소분류</span>
                    					<select class="cate3" name="cateCode">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>  
                    				<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span>                  				                    				
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="itemPrice" value="${viewInfo.itemPrice}">
                    				<span class="ck_warn itemPrice_warn">상품 가격을 입력해주세요.</span>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="itemStock" value="${viewInfo.itemStock}">
                    				<span class="ck_warn itemStock_warn">상품 재고를 입력해주세요.</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" value="0">
                    				<input name="itemDiscount" type="hidden" value="${viewInfo.itemDiscount}">
                    				<span class="discount_val">할인 가격 : <span class="discount_price"></span></span>
                    				<span class="ck_warn itemDiscount_warn">할인률을 입력해주세요.</span>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>물품 소개</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="itemIntro" id="itemIntro_textarea">${viewInfo.itemIntro}</textarea>
                    				<span class="ck_warn itemIntro_warn">물품 소개를 입력해주세요.</span>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>물품 목차</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="itemContents" id="itemContents_textarea">${viewInfo.itemContents}</textarea>
                    				<span class="ck_warn itemContents_warn">물품 목차를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<input type="hidden" name='itemId' value="${viewInfo.itemId}">
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
	                    	</div> 
                    </div>  
                	<form id="moveForm" action="/admin/shopList" method="get" >
 						<input type="hidden" name="pageNum" value="${page.pageNum}">
						<input type="hidden" name="amount" value="${page.amount}">
						<input type="hidden" name="keyword" value="${page.keyword}">
						<input type="hidden" name='itemId' value="${viewInfo.itemId}">
                	</form>                     
                </div>
 
 				<%@include file="../includes/admin/footer.jsp" %>


<script> <!-- 페이지 랜더링시 작동되는 코드 -->
	$(document).ready(function(){
		/* 물품 소개 */
		ClassicEditor
			.create(document.querySelector('#itemIntro_textarea'))
			.catch(error=>{
				console.error(error);
			});
			
		/* 물품 목차 */	
		ClassicEditor
		.create(document.querySelector('#itemContents_textarea'))
		.catch(error=>{
			console.error(error);
		});		
	
		/* 카테고리 */
		let cateList = JSON.parse('${cateList}');

		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		let cate3Obj = new Object();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");
		
		/* 카테고리 배열 초기화 메서드 */
		function makeCateArray(obj,array,cateList, tier){
			for(let i = 0; i < cateList.length; i++){
				if(cateList[i].tier === tier){
					obj = new Object();
					
					obj.cateName = cateList[i].cateName;
					obj.cateCode = cateList[i].cateCode;
					obj.cateParent = cateList[i].cateParent;
					
					array.push(obj);				
					
				}
			}
		}	
		
		/* 배열 초기화 */
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		makeCateArray(cate3Obj,cate3Array,cateList,3);
		
		
		let targetCate2 = '';
		let targetCate3 = '${viewInfo.cateCode}';
		
		for(let i = 0; i < cate3Array.length; i++){
			if(targetCate3 === cate3Array[i].cateCode){
				targetCate3 = cate3Array[i];
			}
		}// for			
		
		for(let i = 0; i < cate3Array.length; i++){
			if(targetCate3.cateParent === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
			}
		}				
		
		$(".cate3 option").each(function(i,obj){
			if(targetCate3.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});			
		
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate3.cateParent === cate2Array[i].cateCode){
				targetCate2 = cate2Array[i];	
			}
		}// for		
		
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate2.cateParent === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
			}
		}		
		
		$(".cate2 option").each(function(i,obj){
			if(targetCate2.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});				
		
		
		
		for(let i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}	
		
		$(".cate1 option").each(function(i,obj){
			if(targetCate2.cateParent === obj.value){
				$(obj).attr("selected", "selected");
			}
		});		
		
		/* 할인율  출력 */
		let itemPriceInput = $("input[name='itemPrice']");
		let discountInput = $("input[name='itemDiscount']");
		
		let itemPrice = itemPriceInput.val();
		let rawDiscountRate = discountInput.val();
		let discountRate = rawDiscountRate * 100;
		
		
		let discountPrice = itemPrice * (1-rawDiscountRate);
		$(".discount_price").html(discountPrice);
		$("#discount_interface").val(discountRate);
					
		}); //document.ready
	
</script>  <!-- 페이지 이동시 작동되는 코드 끝 -->

<script>  <!-- 사용자가 사용함에 따라 변경되도록 하는 기능  -->
		//카테고리 json 데이터를 객체로 변환 JSON.parse 메서드 활용
		let cateList = JSON.parse('${cateList}');
		
		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		let cate3Obj = new Object();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");
		
		//for문 재사용, 메서드화
		function cateArray(obj,array,cateList,tier) {
			for(let i=0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);
		}
		}
		};
		
		
		/* 배열 초기화 */
		cateArray(cate1Obj,cate1Array,cateList,1);
		cateArray(cate2Obj,cate2Array,cateList,2);
		cateArray(cate3Obj,cate3Array,cateList,3);
		
		//대분류 추가 
		for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		//중분류 추가
		$(cateSelect1).on("change",function(){
		let selectVal1 = $(this).find("option:selected").val();	
		console.log("셀렉트1==="+selectVal1);
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");
		
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
		});
		
		/* 소분류 <option>태그 */
		$(cateSelect2).on("change",function(){
		
		let selectVal2 = $(this).find("option:selected").val();
		cateSelect3.children().remove();
		
		cateSelect3.append("<option value='none'>선택</option>");		
		
		for(let i = 0; i < cate3Array.length; i++){
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
			}
		}// for		
		
		});	
		
		/* 할인률 input */
		$("#discount_interface").on("propertychange change keyup paste input", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='itemDiscount']");
		
		let discountRate = userInput.val(); //유저가 작성한 값을 저장
		let sendDiscount = discountRate / 100; //입력한 값 /100 소수로 만듦.
		
		let costPrice = $("input[name='itemPrice']").val(); // 원가
		let discountPrice = costPrice * (1-sendDiscount); //할인가격  / 상품가격 * (1- (할인율/100))
		
		if(!isNaN(discountRate)){ //문자 입력 유효성 검사
		$(".discount_price").html(discountPrice); //discount_price내용을 discountPrice값으로 변경
		discountInput.val(sendDiscount); //소수로 변한 값을 discountInput에 저장
		}
		});
		
		$("input[name='itemPrice']").on("change", function () {   //할인율을 작성햇다가 상품 금액을 변경 할시 작동되는 함수
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='itemDiscount']");
		
		let discountRate = userInput.val(); //유저가 작성한 값을 저장
		let sendDiscount = discountRate / 100; //입력한 값 /100 소수로 만듦.
		
		let costPrice = $("input[name='itemPrice']").val(); // 원가
		let discountPrice = costPrice * (1-sendDiscount); //할인가격  / 상품가격 * (1- (할인율/100))
		
		if(!isNaN(discountRate)){
		$(".discount_price").html(discountPrice); //discount_price내용을 discountPrice값으로 변경
		
		}
		
		});
		
		$("#cancelBtn").on("click",function(e){
			e.preventDefault();
			$("#moveForm").submit();
		});
		
		$("#deleteBtn").on("click",function(e){
			e.preventDefault();
			let moveForm = $("#moveForm");
			moveForm.find("input").remove();
			moveForm.append('<input type="hidden" name="itemId" value="${viewInfo.itemId}">');
			moveForm.attr("action", "/admin/delete");
			moveForm.attr("method", "post");
			moveForm.submit();
		});
		//유효성 검사
		$("#modifyBtn").on("click", function(e){  
			e.preventDefault();
			
			let itemNameCk = false;
			let cateCodeCk = false;
			let priceCk = false;
			let stockCk = false;
			let discountCk = false;
			let introCk = false;
			let contentsCk = false;	
			
		
			/* 체크 대상 변수 */
			let itemName = $("input[name='itemName']").val();
			let cateCode = $("select[name='cateCode']").val();
			let itemPrice = $("input[name='itemPrice']").val();
			let itemStock = $("input[name='itemStock']").val();
			let itemDiscount = $("#discount_interface").val();
			let itemIntro = $(".bit p").html();
			let itemContents = $(".bct p").html();	
			
			/* 공란 체크 */
			if(itemName){
				$(".itemName_warn").css('display','none');
				itemNameCk = true;
			} else {
				$(".itemName_warn").css('display','block');
				itemNameCk = false;
			}
			
			if(cateCode != 'none'){
				$(".cateCode_warn").css('display','none');
				cateCodeCk = true;
			} else {
				$(".cateCode_warn").css('display','block');
				cateCodeCk = false;
			}	
			
			if(itemPrice != 0){
				$(".itemPrice_warn").css('display','none');
				priceCk = true;
			} else {
				$(".itemPrice_warn").css('display','block');
				priceCk = false;
			}	
			
			if(itemStock != 0){
				$(".itemStock_warn").css('display','none');
				stockCk = true;
			} else {
				$(".itemStock_warn").css('display','block');
				stockCk = false;
			}		
			
			if(!isNaN(itemDiscount)){
				$(".itemDiscount_warn").css('display','none');
				discountCk = true;
			} else {
				$(".itemDiscount_warn").css('display','block');
				discountCk = false;
			}	
			
			if(itemIntro != '<br data-cke-filler="true">'){
				$(".itemIntro_warn").css('display','none');
				introCk = true;
			} else {
				$(".itemIntro_warn").css('display','block');
				introCk = false;
			}	
			
			if(itemContents != '<br data-cke-filler="true">'){
				$(".itemContents_warn").css('display','none');
				contentsCk = true;
			} else {
				$(".itemContents_warn").css('display','block');
				contentsCk = false;
			}		
			
			/* 최종 확인 */
			if(itemNameCk && cateCodeCk && priceCk && stockCk && discountCk && introCk && contentsCk ){
				$("#modifyForm").submit();
			} else {
				return false;
			}
});

</script>
</body>
</html>