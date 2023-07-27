<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Thanh toán</title>

<link rel="stylesheet" href="./assets/css/base.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/payment.css">
</head>

<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<a href="home" class="header_text">
				<h2>NHQShop</h2>
			</a>
		</div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Sản phẩm của bạn</span> <span
						class="badge badge-secondary badge-pill">${sessionScope.cart.size() }</span>
				</h4>
				<ul class="list-group mb-3">
					<c:forEach items="${sessionScope.cart}" var="map">						
						<li id="listPD"
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">${map.value.product.productName}</h6>
								<!-- <small class="text-muted">Mô tả</small> -->
							</div> <span class="text-muted"><fmt:formatNumber type="number"
									pattern="#,###"
									value="${map.value.product.price * map.value.quantity}"></fmt:formatNumber>
								đ</span>
							<input id="price" type="hidden" value="${map.value.product.price * map.value.quantity}"/>
							<input id="id" type="hidden" value="${map.value.product.id}"/>
							<input id="quantity" type="hidden" value="${map.value.quantity }"/>
							<input id="idCart" type="hidden"  value="${map.value.cart.cart_id }"/>
						</li>
					</c:forEach>

					<!-- <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                            <h6 class="my-0">Mã giảm giá</h6>
                            <small>Free ship</small>
                        </div>
                        <span class="text-success">-25.000 đ</span>
                    </li> -->

					<c:set var="total" value="${0}" />
					<c:forEach items="${sessionScope.cart}" var="map">
						<c:set var="total"
							value="${total +map.value.quantity * map.value.product.price}"></c:set>
					</c:forEach>
					<li class="list-group-item d-flex justify-content-between"><span>Tổng</span>
						<strong><fmt:formatNumber type="number" pattern="#,###"
								value="${total}"></fmt:formatNumber>đ</strong></li>
					
				</ul>
					<input id="totalPrice" type="hidden" value="${total}"/>
				<!-- <form action="authorize_payment" method="post">
					<table>
						<tr>
							<td>Product/Service:</td>
							<td><input type="text" name="product" value="Next iPhone" /></td>
						</tr>
						<tr>
							<td>Sub Total:</td>
							<td><input type="text" name="subtotal" value="100" /></td>
						</tr>
						<tr>
							<td>Shipping:</td>
							<td><input type="text" name="shipping" value="10" /></td>
						</tr>
						<tr>
							<td>Tax:</td>
							<td><input type="text" name="tax" value="10" /></td>
						</tr>
						<tr>
							<td>Total Amount:</td>
							<td><input type="text" name="total" value="120" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="Checkout" /></td>
						</tr>
					</table>
				</form> -->

				<!-- <form class="card p-2">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Mã khuyến mãi">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary">Xác nhận</button>
                        </div>
                    </div>
                </form> -->

			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Thông tin thanh toán</h4>
				<form action="" method="get"
					class="needs-validation" novalidate>
					<input type="hidden" id="idUser" value="${sessionScope.idUser}"/>
					<div class="mb-3">
						<!-- <label for="firstName">Họ và tên</label> -->
						<input type="text" class="form-control" id="firstName"
							placeholder="Họ và tên" value="${sessionScope.account.users_last_name} ${sessionScope.account.users_first_name}" required>
						<div class="invalid-feedback">Vui lòng điền họ và tên.</div>
					</div>

					<div class="mb-3">
						<!-- <label for="email">Email <span class="text-muted"></span></label> -->
						<input type="email" class="form-control" id="email"
							placeholder="Email" value="${sessionScope.account.users_email }" required>
						<div class="invalid-feedback">Vui lòng điền email của bạn.</div>
					</div>

					<div class="mb-3">
						<!-- <label for="email">Email <span class="text-muted"></span></label> -->
						<input type="tel" class="form-control" id="tel"
							placeholder="Số điện thoại" value="${sessionScope.account.users_phone }"  required>
						<div class="invalid-feedback">Vui lòng điền số điện thoại
							của bạn.</div>
					</div>

					<div class="mb-3">
						<!-- <label for="address">Địa chỉ</label> -->
						<input type="text" class="form-control" id="address"
							placeholder="Địa chỉ" required value="${sessionScope.account.users_shipping_address }" >
						<div class="invalid-feedback">Vui lòng điền địa chỉ.</div>
					</div>

					<div class="row">
						<!-- <div class="col-md-4 mb-3">
							<select name="ls_province" class="custom-select d-block w-100"
								id="province" required>
							</select>
							<div class="invalid-feedback">Vui lòng chọn tỉnh.</div>
						</div>
						<div class="col-md-4 mb-3">
							<select name="ls_district" class="custom-select d-block w-100"
								id="District" required>
							</select>
							<div class="invalid-feedback">Vui lòng chọn quận/huyện.</div>
						</div>
						<div class="col-md-4 mb-3">
							<select name="ls_ward" class="custom-select d-block w-100"
								id="ward" required>
							</select>
							<div class="invalid-feedback">Vui lòng chọn phường/xã.</div>
						</div> -->
					</div>
					<hr class="mb-4">

					<!-- <h4 class="mb-3">Thanh toán</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="direct" name="paymentMethod" type="radio"
								class="custom-control-input" checked required> <label
								class="custom-control-label" for="direct">Thanh toán khi
								nhận hàng</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="ATM" name="paymentMethod" type="radio"
								class="custom-control-input" required> <label
								class="custom-control-label" for="ATM">Thẻ
								ATM/Visa/Master/JCB/QR Pay qua cổng VNPAY</label>
						</div>
					</div> -->
					
					<!-- <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="cc-name">Name on card</label>
                            <input type="text" class="form-control" id="cc-name" placeholder="" required>
                            <small class="text-muted">Full name as displayed on card</small>
                            <div class="invalid-feedback">
                                Name on card is required
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cc-number">Credit card number</label>
                            <input type="text" class="form-control" id="cc-number" placeholder="" required>
                            <div class="invalid-feedback">
                                Credit card number is required
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="cc-expiration">Expiration</label>
                            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                            <div class="invalid-feedback">
                                Expiration date required
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="cc-cvv">CVV</label>
                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                            <div class="invalid-feedback">
                                Security code required
                            </div>
                        </div>
                    </div> -->
					<!-- <hr class="mb-4"> -->
					<div id="paymentMethod" class="btn btn-primary btn-lg btn-block btn-payment"
						>Thanh toán</div>
				</form>
			</div>
		</div>


	</div>
	<script type="text/javascript" src="./assets/javascript/payment.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script
		src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
		crossorigin="anonymous"></script>
	<script
		src="https://getbootstrap.com/docs/4.3/examples/checkout/form-validation.js"></script>

	<script src="./assets/javascript/vietnamlocalselector.js"></script>
	<script src="./assets/javascript/vietnamlocalselector.min.js"></script>
	<script src="./assets/javascript/vietnamlocalselector.nonoop.js"></script>
	<script>
		var localpicker = new LocalPicker({
			province : "ls_province",
			district : "ls_district",
			ward : "ls_ward"
		});
	</script>
</body>