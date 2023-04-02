<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="resources/css/index.css?after">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
                   <a href="/cart/${member.memberId}">장바구니</a>
                </li>
                 </c:if>
                <li>
                    고객센터
                </li>            
            </ul>    
		</div>
		<div class="top_area">
			<div class="logo_area">
				<a href="/"><img src="resources/img/logo.png"></a>
			</div>
			<div class="search_area">
				<div class="search_wrap">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                				<select name="type">
                					<option value="T">물품명</option>
                				
                				</select>
                				<input type="text" name="keyword">
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
		<div class="navi_bar_area">
			<div class="navi_bar_area">
			<div class="dropdown">
			    <button class="dropbtn">상의 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<a href="/search?type=C&cateCode=101001">반팔</a>
			    	<a href="/search?type=C&cateCode=101002">니트</a>
			    	<a href="/search?type=C&cateCode=101003">후드</a>    		      		      
			    </div>			
			</div>
			
				<div class="dropdown">
			    <button class="dropbtn">아우터 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
					<a href="/search?type=C&cateCode=103001">자켓</a> 
			    	<a href="/search?type=C&cateCode=103002">가디건</a> 
			    	<a href="/search?type=C&cateCode=103003">코트</a>    		      		      
			    </div>			
			</div>
			
			<div class="dropdown">
			    <button class="dropbtn">하의 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<a href="/search?type=C&cateCode=102001">반바지</a> 
			    	<a href="/search?type=C&cateCode=102002">슬렉스</a> 
			    	<a href="/search?type=C&cateCode=102003">청바지</a>     		      		      
			    </div>			
			</div>
			
				<div class="dropdown">
			    <button class="dropbtn">신발 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<a href="/search?type=C&cateCode=104001">구두</a> 
			    	<a href="/search?type=C&cateCode=104002">스니커즈</a> 
			    	<a href="/search?type=C&cateCode=104003">슬리퍼</a>       		      		      
			    </div>			
			</div>
		
		</div>		
		</div>
		<div class="content_area">
			
			
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
                    <img src="resources/img/logo.png">
                </div>
                <div class="footer_right">
                    (주) VamBook    대표이사 : OOO
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
	$("#gnb_logout_button").click(function () {
		
		$.ajax({
			type:"Post",
			url:"/member/logout",
			success:function(data){
				alert("로그아웃");
				document.location.reload(); //로그아웃하면 새로고침 되도록, 세션 변경사항이 화면에 반영
			}
			
		})
	});
</script>
</body>
</html>