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
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/order.css" />
</head>
<body>

	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>

	<div id=contents>
		<div class="innercon">
			<h2>주문하기</h2>

			<div class="conarea">
				<section class="leftarea">
					<div id="orderShippingSlitmDiv">
						<fieldset class="delivery-field toggle active">
							<legend class="tit toggle-ti">
								배송지 정보
							</legend>
							<div class="cont">
								<div class="addrinfo">
									<strong>배송지 정보</strong>
									<div class="arrow">
										<span>
											<strong>
												${signinUser.userName}
											</strong>
										</span>
										<p class="addr">
											${signinUser.userAddress}
										</p>
									</div>
								</div>
							</div>
						</fieldset>

						<fieldset class="product-field toggle active">
							<legend class="tit toggle-ti">
								주문상품
								<em>${fn:length(preOrderProduct)}</em>
							</legend>
							<div class="cont">
								<div>
									<strong class="ti">
										<em>배송</em>
									</strong>
									<ul class="product-list nothumb">
										<c:forEach var="vo" items="${preOrderProduct}">
										<li>
											<strong class="txt-ti">
												${vo.productName}
											</strong>
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
						</fieldset>
					</div>
					<fieldset class="pay-field">
						<legend class="tit">결제수단</legend>
						<label> 
							<input type="radio" name="hpay" checked> 
								<span>
									<i class="icon hpointpay">H.Point Pay</i>
								</span>
						</label>
					</fieldset>
				</section>

				<section class="rightarea">
				<fieldset class="price-field">
					<dl class="orderprice">
						<dt>총 상품금액</dt>
						<dd>
							<strong>
								<em id="smrySumItemAmt">
									<fmt:formatNumber value="${price}" pattern="#,###" />
								</em>
								원
							</strong>
						</dd>
					</dl>
					<div>
						<dl class="plus toggle-ti">
							<dt>총 배송비</dt>
							<dd>
								<strong>
									<em id="smryDlvSumAmt">
										3,500
									</em>
									원
								</strong>
							</dd>
						</dl>
						<div class="cont infotxt" id="smryDlvSumAmtDtl"></div>
					</div>
					<dl	class="total">
						<dt>총 결제예상금액</dt>
						<dd>
							<strong>
								<em id="smryExpSumAmt">0</em>
								원
							</strong>
						</dd>
					</dl>
					</fieldset>
					
					<fieldset class="agree-field">
						<ul class="list">
							<li>
								전자금융거래 이용약관 동의 
								<b>(필수)</b>
							</li>
							<li>
								개인정보 수집 및 이용 동의 
								<b>(필수)</b>
							</li>
							<li>
								개인정보 제3자 제공/위탁 동의 
								<b>(필수)</b>
							</li>							
						</ul>
						<div class="contarea agreewrap">
							<label class="allagree"> 
								<input type="checkbox" name id="agreeAll">
								<span>
									모든 내용을 확인 하였으며 결제에 동의합니다.
								</span>
							</label>
							<span class="talk" hidden>결제진행을 위해 아래 항목에 동의 해 주세요.</span>
						</div>
					</fieldset>
					
					<button class="btn fill big orange btn-order" onclick="successOrder()">
<%-- 						<c:out value="${fn:length(preOrderProduct)}" /> --%>
						<span class="txt-price">
							총 
							<em id="expSumAmt">0</em>
							원
						</span>
						<strong>결제하기</strong>
					</button>
				</section>
			</div>
		</div>
	</div>
</body>
</html>