<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<title>Giỏ Hàng</title>
<link rel="stylesheet"
	href="<c:url value="./assets/css/cart.css"></c:url>">
</head>

<body>
	<!-- Content -->
	<section class="h-100 h-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">
						<div class="card-body p-0">
							<div class="row g-0">
								<div class="col-lg-8">
									<div class="p-5">
										<div
											class="d-flex justify-content-between align-items-center mb-5">
											<h1 style="color: var(- -primary-color);"
												class="fw-bold mb-0 text-black">Giỏ hàng</h1>
											<h6 class="mb-0 text-muted">${sessionScope.cart.size()}
												sản phẩm</h6>
										</div>
										<hr class="my-4">

										<c:forEach items="${sessionScope.cart}" var="map">
											<div
												class="row mb-4 d-flex justify-content-between align-items-center mask">
												<div class="col-md-2 col-lg-2 col-xl-2">
													<img src="${map.value.product.image}"
														class="img-fluid rounded-3"
														alt="${map.value.product.productName}">
												</div>
												<div class="col-md-3 col-lg-3 col-xl-3">
													<h6 class="text-muted">${map.value.product.productName}</h6>
													<h6 class="text-black mb-0">
														<fmt:formatNumber type="number" pattern="#,###"
															value="${map.value.product.price}"></fmt:formatNumber>
														đ
													</h6>
												</div>
												<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
													<form action="cart-change" method="post">
														<button class="btn btn-link px-2" type="submit"
															onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
														</button>
														<input type="hidden" name="pId"
															value="${map.value.product.id}" /> <input id="quantity"
															min="0" name="quantity" value="${map.value.quantity}"
															type="number" class="form-control form-control-sm" />

														<button class="btn btn-link px-2" type="submit"
															onclick="buy('${productDetail.id}') this.parentNode.querySelector('input[type=number]').stepUp()">
														</button>
													</form>

													<!-- <button>
														<a href="process?num=-1&id=${pd.product_id}">-</a>
													</button>
													<p>${pd.product_Amount}</p>
													<button>
														<a href="process?num=1&id=${pd.product_id}">+</a>
													</button>
												 -->

												</div>
												<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
													<h6 class="mb-0">
														<fmt:formatNumber type="number" pattern="#,###"
															value="${map.value.product.price * map.value.quantity}"></fmt:formatNumber>
														đ
													</h6>
												</div>
												<div class="col-md-1 col-lg-1 col-xl-1 text-end">
													<%-- <input type="hidden" name="id"
														value="${map.value.product.product_id}" /> --%>
													<a type="submit"
														href="${pageContext.request.contextPath}/member/cart-remove?pId=${map.value.product.id}"
														class="text-muted"><i class="fas fa-times"></i></a>
												</div>

												<!-- <form action="process" method="post">
													<input type="hidden" name="id" value="${pd.product_id}" />
													<input type="submit" value="X" />
												</form>
											 -->
											</div>

											<hr class="my-4">
										</c:forEach>


										<div class="pt-5">
											<h6 class="mb-0">
												<a href="home" class="text-body"> <i
													style="color: var(- -primary-color);"
													class="fas fa-long-arrow-alt-left me-2"></i> Tiếp tục mua
													sắm
												</a>
											</h6>
										</div>
									</div>
								</div>
								<div class="col-lg-4 bg-grey">
									<div class="p-5">
										<h3 class="fw-bold mb-5 mt-2 pt-1">Tổng cộng</h3>
										<hr class="my-4">

										<div class="d-flex justify-content-between mb-4">
											<h5 class="text-uppercase">${sessionScope.cart.size()}
												sản phẩm</h5>
											<!-- <h5>€ 132.00</h5> -->
										</div>

										<!-- <h5 class="text-uppercase mb-3">Shipping</h5>

                                        <div class="mb-4 pb-2">
                                            <select class="select">
                                                <option value="1">Standard-Delivery- €5.00</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                                <option value="4">Four</option>
                                            </select>
                                        </div>

                                        <h5 class="text-uppercase mb-3">Give code</h5>

                                        <div class="mb-5">
                                            <div class="form-outline">
                                                <input type="text" id="form3Examplea2"
                                                    class="form-control form-control-lg" />
                                                <label class="form-label" for="form3Examplea2">Enter your code</label>
                                            </div>
                                        </div> -->

										<hr class="my-4">

										<div class="d-flex justify-content-between mb-5 total">
											<h5 class="text-uppercase">Thành tiền</h5>
											<h5>
												<c:set var="total" value="${0}" />
												<c:forEach items="${sessionScope.cart}" var="map">
													<c:set var="total"
														value="${total +map.value.quantity * map.value.product.price}"></c:set>
												</c:forEach>
												<span><fmt:formatNumber type="number" pattern="#,###"
														value="${total}"></fmt:formatNumber></span>đ
											</h5>
										</div>

										<c:if test="${sessionScope.cart.size() > 0}">
											<a href="layout-Payment"
												class="btn btn-dark btn-block btn-lg"
												data-mdb-ripple-color="dark">Thanh toán</a>
										</c:if>
										<c:if test="${sessionScope.cart.size() == 0}">
											<a href="showCart"
												class="btn btn-dark btn-block btn-lg"
												data-mdb-ripple-color="dark">Thanh toán</a>
										</c:if>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript" src="./assets/javascript/EventCart.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- <script type="text/javascript">
		function removeItems(id) {
			$.ajax({
				url : "/WebBanHang/member/cart-remove",
				type : "get", //send it through get method
				data : {
					pId : id
				},
				success : function(data) {

				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
	</script> -->
</body>
