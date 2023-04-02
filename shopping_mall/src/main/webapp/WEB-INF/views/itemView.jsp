<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/itemView.css?after">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<!-- 로그인 전 -->
				<c:if test = "${member == null}">
                <li >
                    <a href="/member/login">로그인</a>
                </li>
                <li>
                    <a href="/member/sign">회원가입</a>
                </li>
                 </c:if>
                 	<!-- 로그인 후 -->
				<c:if test = "${member != null}">
					<!-- 관리자 -->
					<c:if test="${member.adminCk == 1 }">
                        <li><a href="/admin/main">관리자 페이지</a></li>
                    </c:if>
                <li >
                    <a id="gnb_logout_button">로그아웃</a>
                </li>
                <li>
                    마이룸
                </li>
                 <li>
                    장바구니
                </li>
                 </c:if>
                <li>
                    고객센터
                </li>            
            </ul>    
		</div>
		<div class="top_area">
			<div class="logo_area">
				<a href="/"><img src="/resources/img/logo.png"></a>
			</div>
			<div class="search_area">
				<div class="search_wrap">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                				<input type="text" name="keyword" <c:out value="${pageMaker.page.keyword}"/>">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
			</div>
			<div class="login_area">
			
				<!-- 로그인 안한 상태 -->
				<c:if test="${member == null}">
				<div class="login_button"><a href="/member/login">로그인</a></div>
				<span><a href="/member/sign">회원가입</a></span>
				</c:if>
				
				<!-- 로그인한 상태 -->
				<c:if test="${member != null}">
				<div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <span>충전금액 : <fmt:formatNumber value="${member.money}" pattern="\#,###.##"/></span>
                        <span>포인트 : <fmt:formatNumber value="${member.point}" pattern="\#,###.##"/></span>
                         <a href="/member/logout">로그아웃</a>
                 </div>
				</c:if>
			</div>
			<div class="clearfix"></div>			
		</div>
		
		<div class="content_area">
				<div class="line">
			</div>			
			<div class="content_top">
				<div class="ct_left_area">
					<div class="image_wrap" data-itemid="${itemInfo.imageList[0].itemId}" data-path="${itemInfo.imageList[0].uploadPath}" data-uuid="${itemInfo.imageList[0].uuid}" data-filename="${itemInfo.imageList[0].fileName}">
						<img>
					</div>				
				</div>
				<div class="ct_right_area">
					<div class="title">
						<h1>
							${itemInfo.itemName}
						</h1>
					</div>
					<div class="line">
					</div>
					<div class="line">
					</div>	
					<div class="price">
						<div class="sale_price">정가 : <fmt:formatNumber value="${itemInfo.itemPrice}" pattern="#,### 원" /></div>
						<div class="discount_price">
							판매가 : <span class="discount_price_number"><fmt:formatNumber value="${itemInfo.itemPrice - (itemInfo.itemPrice*itemInfo.itemDiscount)}" pattern="#,### 원" /></span> 
							[<fmt:formatNumber value="${itemInfo.itemDiscount*100}" pattern="###" />% 
							<fmt:formatNumber value="${itemInfo.itemPrice*itemInfo.itemDiscount}" pattern="#,### 원" /> 할인]</div>							
					</div>			
					<div class="line">
					</div>	
					<div class="button">						
						<div class="button_quantity">
							주문수량
							<input type="text" value="1">
							<span>
								<button>+</button>
								<button>-</button>
							</span>
						</div>
						<div class="button_set">
							<a class="btn_cart">장바구니 담기</a>
							<a class="btn_buy">바로구매</a>
						</div>
					</div>
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_middle">
				<div class="item_intro">
					${itemInfo.itemIntro}
				</div>
				<div class="item_content">
					${itemInfo.itemContents }
				</div>
			</div>
			<div class="line">
			</div>				
			<div class="content_bottom">
				리뷰
			</div>
		</div>
		
		 <!-- Footer 영역 -->
        <div class="footer_nav">
            <div class="footer_nav_container">
                <ul>
                    <li>회사소개</li>
                    <span class="line">|</span>
                    <li>이용약관</li>
                    <span class="line">|</span>
                    <li>고객센터</li>
                    <span class="line">|</span>
                    <li>광고문의</li>
                    <span class="line">|</span>
                    <li>채용정보</li>
                    <span class="line">|</span>
                </ul>
            </div>
        </div> <!-- class="footer_nav" -->
        
        <div class="footer">
            <div class="footer_container">
                
                <div class="footer_left">
                    <img src="/resources/img/logo.png">
                </div>
                <div class="footer_right">
                    (주) Vamitem    대표이사 : OOO
                    <br>
                    사업자등록번호 : ooo-oo-ooooo
                    <br>
                    대표전화 : oooo-oooo(발신자 부담전화)
                    <br>
                    <br>
                    COPYRIGHT(C) <strong>kimvampa.tistory.com</strong>    ALL RIGHTS RESERVED.
                </div>
                <div class="clearfix"></div>
            </div>
        </div> <!-- class="footer" -->    
	</div>
</div>

<script>

$(document).ready(function(){
	
	/* 이미지 삽입 */
	const bobj = $(".image_wrap");
	
	if(bobj.data("itemid")){
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		bobj.find("img").attr('src', '/displayImg?fileName=' + fileCallPath);
	} else {
		bobj.find("img").attr('src', '/resources/img/noimg.JPG');
	}

	
});	
</script>


</body>
</html>