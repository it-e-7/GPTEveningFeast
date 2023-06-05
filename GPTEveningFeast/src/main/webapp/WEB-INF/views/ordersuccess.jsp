<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/order.js"></script>
<link rel="stylesheet" type="text/css" href="/evenapp/resources/css/ordersuccess.css" />
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	
	<div id="contents">
	<div class="innercon">
			<h2>주문완료</h2>

			<div class="conarea">
				<section class="leftarea">
					<div class="confirmdata">
						<h3>
							${signinUser.userName} 고객님,감사합니다.
							<br>
							주문을 완료했습니다.
						</h3>
						<p>주문번호 ${productList[0].orderId}</p>
					</div>
					
					<div class="order-info">
						<div class="delivery-field">
							<h4 class="tit">기본배송지</h4>
							<div class="cont">
								<div class="addrinfo">
									<strong>배송지 정보</strong>
									<span>
										<strong>${signinUser.userName}</strong>
									</span>
									<p class="addr">${signinUser.userAddress}</p>
								</div>
							</div>
						</div>
						
						<div class="product-field">
							<h4 class="tit">
								주문상품 정보
								<em>${fn:length(productList)}</em>
							</h4>
							<div class="cont">
								<div>
									<strong class="ti">배송</strong>
									<ul class="product-list nothumb">
										<c:forEach var="vo" items="${productList}">
										<li>
											<strong class="txt-ti">${vo.productName}</strong>
											<span class="txt-num">
												<strong>
													<em>${vo.productCnt}</em>
													개
												</strong>
											</span>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</section>

				<section class="rightarea">
					<div class="price-field">
						<h4 class="tit">결제정보</h4>
						<dl class="orderprice">
							<dt>총 상품금액</dt>
							<dd>
								<strong>
									<em>
										<fmt:formatNumber value="${price}" pattern="#,###" />
									</em>
									원
								</strong>
							</dd>
						</dl>
						<dl class="plus">
							<dt>총 배송비</dt>
							<dd>
								<strong>
									<em>3,500</em>
									원
								</strong>
							</dd>
						</dl>
						<dl class="total">
							<dt>총 결제금액</dt>
							<dd>
								<strong>
									<em>3,500</em>
									원
								</strong>
							</dd>
						</dl>
					</div>
					<div class="pay">
						<h4 class="tit">결제내역</h4>
						<dl>
							<dt>H.Point Pay</dt>
							<dd>
								<span class="txt-price">
									<em>
										<fmt:formatNumber value="${price}" pattern="#,###" />
									</em>
									원
								</span>
							</dd>
						</dl>
						<p>
							코사카드 / 일시불
						</p>
					</div>
					<div class="hpoint">
					</div>
				</section>
			</div>
			
			<div class="btns">
					<a href="/evenapp" class="btn fill big lightgray">쇼핑하기</a>
					<a href="javascript:moveOrderList(${fn:length(productList)})"
						class="btn fill big orange">주문 내역 보기
					</a>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>