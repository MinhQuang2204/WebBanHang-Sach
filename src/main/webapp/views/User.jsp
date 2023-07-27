<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<link rel="stylesheet" href="./assets/css/user.css">
<link rel="stylesheet"
	href="<c:url value="./assets/css/user.css"></c:url>">
</head>

<body>


	<!-- Content -->
	<div class="container">
		<div class="user_content row">
			<div class="col-md-2 user_content-left">
				<div class="user_name">${sessionScope.name}</div>
				<div class="dropdown-divider"></div>
				<div class="left-item" onclick="changeToProfileForm()">
					<i class="fa-solid fa-user"></i> Tài khoản của tôi
				</div>
				<ul class="list-left-item">
					<a href="#" class="left-item" onclick="changeToProfileForm()">Hồ
						sơ</a>
					<a href="#" class="left-item" onclick="changeToAddressForm()">Địa
						chỉ</a>
					<a href="#" class="left-item" onclick="changeToChangepassForm()">Đổi
						mật khẩu</a>
				</ul>
				<a href="#" class="left-item" onclick="changeToOrderForm()"> <i
					class="fa-solid fa-cart-shopping"></i> Đơn hàng
				</a>
				<!-- <a href="Seller" class="left-item left-item-last">
                    <i class="fa-brands fa-shopify"></i>
                    Trang người bán
                </a> -->
			</div>
			<!-- Profile -->
			<div id="profile_form"
				class="user_content-right user_profile col-md-10 order-md-1 active">
				<h4 class="mb-3">Hồ Sơ Của Tôi</h4>
				<form class="needs-validation" novalidate>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Tên</span> <input type="text"
							class="form-control col-md-10" id="firstName" placeholder=""
							value="${sessionScope.name}" required> <span
							class="text_title col-md-2"></span>
						<div class="invalid-feedback col-md-10">Vui lòng nhập tên.</div>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Tài khoản</span>
						<div class="text_email active">
							<span class="col-md-4">${sessionScope.email}</span> <!-- <a href=""
								style="color: #495057;" class="col-md-6 a--primary">Thay đổi</a> -->
						</div>
						<div class="text_email">
							<span class="col-md-4"></span> <a href="" style="color: #495057;"
								class="col-md-6 a--primary">Thêm</a>
						</div>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Số điện thoại</span>
						<div class="text_phonenumber">
							<span class="col-md-4">********22</span> <a href=""
								style="color: #495057;" class="col-md-6 a--primary">Thay đổi</a>
						</div>
						<div class="text_phonenumber active">
							<a href="" style="color: #495057;" class="col-md-6 a--primary">Thêm</a>
						</div>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Giới tính</span> <input
							name="gender" type="radio" value="Nam" ${sessionScope.account.users_gender == "Nam" ? "checked":""}> <span
							class="gender">Nam</span> <input name="gender" type="radio"
							value="Nữ" ${sessionScope.account.users_gender == "Nu" ? "checked":""}> <span class="gender">Nữ</span> <input
							name="gender" type="radio" value="Khác"> <span
							class="gender">Khác</span>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Ngày sinh</span> <input
							class="col-md-2" type="date" id="birthday" name="birthday" value="${sessionScope.account.users_birthday}"
							required> <span class="text_title col-md-8"></span> <span
							class="text_title col-md-2"></span>
						<div class="invalid-feedback col-md-10">Vui lòng chọn ngày
							sinh.</div>
					</div>
					<div class="mb-3 form_btn--save">
						<span class="col-md-2"></span>
						<button
							class="btn btn-outline-success my-2 my-sm-0 btn-lg btn-block"
							type="submit">Lưu</button>
					</div>
				</form>
			</div>

			<!-- Address -->
			<div id="address_form"
				class="user_content-right user_address col-md-10 order-md-1">
				<h4 class="mb-3">Địa chỉ Của Tôi</h4>
				<form class="needs-validation" novalidate>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Tên</span> <input type="text"
							class="form-control col-md-10" id="firstNameChange" placeholder=""
							value="${sessionScope.name}" required> <span
							class="text_title col-md-2"></span>
						<div class="invalid-feedback col-md-10">Vui lòng nhập tên.</div>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Số điện thoại</span> <input
							type="tel" class="form-control col-md-10" id="telChange" placeholder=""
							value="${sessionScope.account.users_phone}" required> <span
							class="text_title col-md-2"></span>
						<div class="invalid-feedback col-md-10">Vui lòng nhập số
							điện thoại.</div>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-2">Địa chỉ cụ thể</span> <input
							type="text" class="form-control col-md-10" id="textAddress"
							placeholder="" value="${sessionScope.account.users_shipping_address}" required> <span
							class="text_title col-md-2"></span>
						<div class="invalid-feedback col-md-10">Vui lòng nhập địa
							chỉ cụ thể của bạn.</div>
					</div>
					<div class="mb-3 form_text">
						<!-- <span class="text_title col-md-2">Địa chỉ</span>
						<div class="pd-l-0 col-md-3">
							<select name="ls_province" class="form_select" id="province"
								required>
							</select>
							<div class="invalid-feedback">Vui lòng chọn tỉnh.</div>
						</div>
						<div class="pd-l-0 col-md-3">
							<select name="ls_district" class="form_select" id="District"
								required>
							</select>
							<div class="invalid-feedback">Vui lòng chọn quận/huyện.</div>
						</div>
						<div class="pd-l-0 col-md-3">
							<select name="ls_ward" class="form_select" id="ward" required>
							</select>
							<div class="invalid-feedback">Vui lòng chọn phường/xã.</div>
						</div> -->
					</div>

					<div class="mb-3 form_btn--save">
						<span class="col-md-2"></span>
						<button id="luu"
							class="btn btn-outline-success my-2 my-sm-0 btn-lg btn-block btn-save"
							type="submit">Lưu</button>
					</div>
				</form>
			</div>

			<!-- Change Password -->
			<div id="changepass_form"
				class="user_content-right user_password col-md-10 order-md-1">
				<h4>Đổi mật khẩu</h4>
				<h6 class="mb-3" style="font-weight: 400;">Để bảo mật tài
					khoản, vui lòng không chia sẻ mật khẩu cho người khác</h6>
				<form class="needs-validation" novalidate>
					<div class="mb-3 form_text">
						<span class="text_title col-md-3">Mật khẩu hiện tại</span> <input
							type="password" class="form-control col-md-4"
							id="currentPassword" placeholder="" value="" required> <a href="layout-Login?mask=forgot"
							class="forgot_password col-md-5">Quên mật khẩu?</a> <span
							class="text_title col-md-3"></span>
						<div class="invalid-feedback col-md-9">Vui lòng nhập mật
							khẩu.</div>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-3">Mật khẩu mới</span> <input
							type="password" class="form-control col-md-4" id="newPassword"
							placeholder="" value="" required> <span
							class="text_title col-md-5"></span> <span
							class="text_title col-md-3"></span>
						<div class="invalid-feedback col-md-9">Vui lòng nhập mật
							khẩu mới.</div>
					</div>
					<div class="mb-3 form_text">
						<span class="text_title col-md-3">Xác nhận mật khẩu</span> <input
							type="password" class="form-control col-md-4" id="newPassword"
							placeholder="" value="" required> <span
							class="text_title col-md-5"></span> <span
							class="text_title col-md-3"></span>
						<div class="invalid-feedback col-md-9">Vui lòng nhập lại mật
							khẩu mới.</div>
					</div>
					<div class="mb-3 form_btn--save">
						<span class="col-md-3"></span>
						<button
							class="col-md-2 btn btn-outline-success my-2 my-sm-0 btn-lg btn-block btn-save"
							type="submit">Xác nhận</button>
					</div>
				</form>
			</div>

			<!-- My Oder-->
			<div id="order_form"
				class="user_content-right user_oder col-md-10 order-md-1">
				<input type="hidden" id="idUser" value="${sessionScope.idUser}"/>
				<div class="col-md-12">
					<ul class="list_typeOrder">
						<li id="item_typeOrder_all" class="item_typeOrder col-2-4 active"
							onclick="changeToAllForm()">Tất cả</li>
						<li id="item_typeOrder_waiting" class="item_typeOrder col-2-4"
							onclick="changeToWaitingForm()">Chờ xác nhận</li>
						<li id="item_typeOrder_shipping" class="item_typeOrder col-2-4"
							onclick="changeToShippingForm()">Đang giao</li>
						<li id="item_typeOrder_shipped" class="item_typeOrder col-2-4"
							onclick="changeToShippedForm()">Đã giao</li>
						<li id="item_typeOrder_cancel" class="item_typeOrder col-2-4"
							onclick="changeToCancelForm()">Đã huỷ</li>
					</ul>
				</div>

				<!-- All form -->
				<div id="all_form" class="col-md-12 all_order active">
					<!-- <div class="no_order">
                        <img class="img-no_order" src="./assets/img/no_order.png" alt="">
                        <span class="titler-no_order">Chưa có đơn hàng</span>
                    </div> -->
				</div>

				<!-- waiting form -->
				<div id="waiting_form" class="col-md-12 waiting_order active">
					<!-- <div class="no_order">
                        <img class="img-no_order" src="./assets/img/no_order.png" alt="">
                        <span class="titler-no_order">Chưa có đơn hàng</span>
                    </div> -->

					<!-- <div class="item_order" id="list_order">
						<div class="col-md-12 header_order">Chờ xác nhận</div>
						<div class="col-md-12 body_order">
							<div class="col-md-2">
								<img class="body_img"
									src="https://cdn0.fahasa.com/media/catalog/product/8/9/8936071674593_1_1.jpg"
									alt="">
							</div>
							<div class="col-md-10 body_content">
								<span class="content_item body_name">Các Nền Văn Minh Thế
									Giới - Hy Lạp Cổ Đại</span> <span class="content_item body_quantity">x2</span>
							</div>
						</div>
						<div class="col-md-12 footer_order">
							<div class="col-md- footer_item">
								Tổng số tiền:
								<div class="total">148.000đ</div>
							</div>
							<span class="col-md-12 footer_item footer_item-btn"> <a
								href="" class="btn footer_btn">Huỷ</a>
							</span>
						</div>
					</div>
				 --></div>

				<!-- Shipping form -->
				<div id="shipping_form" class="col-md-12 shipping_order active">
					<!-- <div class="no_order">
						<img class="img-no_order" src="./assets/img/no_order.png" alt="">
						<span class="titler-no_order">Chưa có đơn hàng</span>
					</div>
				 --></div>

				<!-- Shipped form -->
				<div id="shipped_form" class="col-md-12 shipped_order active">
					<!-- <div class="no_order">
                        <img class="img-no_order" src="./assets/img/no_order.png" alt="">
                        <span class="titler-no_order">Chưa có đơn hàng</span>
                    </div> -->

					<!-- <div class="item_order">
						<div class="col-md-12 header_order">Đã giao</div>
						<div class="col-md-12 body_order">
							<div class="col-md-2">
								<img class="body_img"
									src="https://cdn0.fahasa.com/media/catalog/product/8/9/8936071674593_1_1.jpg"
									alt="">
							</div>
							<div class="col-md-10 body_content">
								<span class="content_item body_name">Các Nền Văn Minh Thế
									Giới - Hy Lạp Cổ Đại</span> <span class="content_item body_quantity">x2</span>
							</div>
						</div>
						<div class="col-md-12 footer_order">
							<div class="col-md- footer_item">
								Tổng số tiền:
								<div class="total">148.000đ</div>
							</div>
							<span class="col-md-12 footer_item footer_item-btn"> <a
								href="" class="btn footer_btn">Mua lại</a>
							</span>
						</div>
					</div>
				 --></div>

				<!-- Cancel form -->
				<div id="cancel_form" class="col-md-12 cancel_order active">
					<!-- <div class="no_order">
                        <img class="img-no_order" src="./assets/img/no_order.png" alt="">
                        <span class="titler-no_order">Chưa có đơn hàng</span>
                    </div> -->

					<!-- <div class="item_order">
						<div class="col-md-12 header_order">Đã huỷ</div>
						<div class="col-md-12 body_order">
							<div class="col-md-2">
								<img class="body_img"
									src="https://cdn0.fahasa.com/media/catalog/product/8/9/8936071674593_1_1.jpg"
									alt="">
							</div>
							<div class="col-md-10 body_content">
								<span class="content_item body_name">Các Nền Văn Minh Thế
									Giới - Hy Lạp Cổ Đại</span> <span class="content_item body_quantity">x2</span>
							</div>
						</div>
						<div class="col-md-12 body_order">
							<div class="col-md-2">
								<img class="body_img"
									src="https://cdn0.fahasa.com/media/catalog/product/8/9/8936071674593_1_1.jpg"
									alt="">
							</div>
							<div class="col-md-10 body_content">
								<span class="content_item body_name">Các Nền Văn Minh Thế
									Giới - Hy Lạp Cổ Đại</span> <span class="content_item body_quantity">x2</span>
							</div>
						</div>
						<div class="col-md-12 footer_order">
							<div class="col-md- footer_item">
								Tổng số tiền:
								<div class="total">296.000đ</div>
							</div>
							<span class="col-md-12 footer_item footer_item-btn"> <a
								href="" class="btn footer_btn">Mua lại</a>
							</span>
						</div>
					</div>
				 --></div>
			</div>
		</div>
	</div>
	
	<script src="./assets/javascript/UserInfo.js"></script>

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

	<script
		src="<c:url value="./assets/javascript/vietnamlocalselector.js"></c:url>"></script>
	<script
		src="<c:url value="./assets/javascript/vietnamlocalselector.min.js"></c:url>"></script>
	<script
		src="<c:url value="./assets/javascript/vietnamlocalselector.nonoop.js"></c:url>"></script>
	<script>
		var localpicker = new LocalPicker({
			province : "ls_province",
			district : "ls_district",
			ward : "ls_ward"
		});
	</script>
	<script src="<c:url value="./assets/javascript/user.js"></c:url>"></script>
	<script
		src="<c:url value="./assets/javascript/OrderStatus.js"></c:url>"></script>
</body>