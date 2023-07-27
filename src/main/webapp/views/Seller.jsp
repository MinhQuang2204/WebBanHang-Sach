<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="./assets/font/fontawesome-free-6.2.0-web/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<title>Admin</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./assets/css/admin.css">
</head>
<body>
	<header class="header col-md-2" role="banner">
		<h1 class="logo">
			<a href="home"> <i class="fa-solid fa-book icon"></i> NHQBook
			</a>
		</h1>
		<div class="nav-wrap">
			<nav class="main-nav" role="navigation">
				<ul class="unstyled list-hover-slide">
					<li onclick="changeToOrderManagementForm()"><a href="#"> <i
							class="fa-solid fa-clipboard icon"></i> Quản lý đơn hàng
					</a></li>
					<li onclick="changeToProductManagementForm()"><a href="#">
							<i class="fa-solid fa-box icon"></i> Quản lý sản phẩm
					</a></li>
					<li onclick="changeToAddProductsForm()"><a href="#"> <i
							class="fa-solid fa-circle-plus icon"></i> Thêm sản phẩm
					</a></li>
				</ul>
			</nav>
			<div class="list-hover-slide main-nav link-logout">
				<li class="unstyled"><a href="#"> <i
						class="fa-solid fa-right-from-bracket icon"></i> Đăng xuất
				</a></li>
			</div>
		</div>
	</header>


	<div class="content col-md-10">

		<!-- Order Management -->
		<div id="order_management-form" class="order_management active">
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
						onclick="changeToCancelForm()">Đơn huỷ</li>
				</ul>

				<div class="filter_date">
					<div class="col-md-12 footer_item footer_item-btn">
						<span class="filter_title filter_title--main">Ngày đặt hàng</span>
						<span class="filter_title">Từ</span> <input class="date--from"
							type="date"> <span class="filter_title">Đến</span> <input
							class="date--to" type="date"> <a href=""
							class="btn footer_btn btn--out">Xuất</a>
					</div>
				</div>
			</div>

			<!-- All form -->
			<div id="all_form" class="col-md-12 all_order">
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

				<div class="item_order">
					<div class="col-md-12 header_order">
						<div class="header-item client_name col-md-7">
							<span style="color: #fff;">Khách hàng: </span> Trần Văn Nguyên
						</div>
						<div class="header-item day_set col-md-2">05/10/2022</div>
						<div class="header-item status_order col-md-3">Chờ xác nhận
						</div>
						<div class="header-item client_name col-md-7">
							<span style="color: #fff;">Địa chỉ: </span> 11/1G đường 26 Phước
							Long A Quận 9 Hồ Chí Minh
						</div>
					</div>
					<div class="col-md-12 body_order">
						<div class="col-md-12 body_content">
							<span class="content_item body_name col-md-7">Các Nền Văn
								Minh Thế Giới - Hy Lạp Cổ Đại</span> <span
								class="content_item body_quantity col-md-2">x1</span> <span
								class="content_item body_total col-md-3">148.000đ</span> <span
								class="content_item body_name col-md-7">Các Nền Văn Minh
								Thế Giới - Hy Lạp Cổ Đại</span> <span
								class="content_item body_quantity col-md-2">x1</span> <span
								class="content_item body_total col-md-3">148.000đ</span>
						</div>
					</div>
					<div class="col-md-12 footer_order">
						<div class="footer_item">
							Tổng số tiền:
							<div class="total">296.000đ</div>
						</div>
						<span class="col-md-12 footer_item footer_item-btn"> <a
							href="" class="btn footer_btn">Xác nhận</a> <a href=""
							class="btn footer_btn">Huỷ</a>
						</span>
					</div>
				</div>
			</div>

			<!-- Shipping form -->
			<div id="shipping_form" class="col-md-12 shipping_order active">
				<div class="no_order">
					<img class="img-no_order" src="./assets/img/no_order.png" alt="">
					<span class="titler-no_order">Chưa có đơn hàng</span>
				</div>
			</div>

			<!-- Shipped form -->
			<div id="shipped_form" class="col-md-12 shipped_order active">
				<!-- <div class="no_order">
                    <img class="img-no_order" src="./assets/img/no_order.png" alt="">
                    <span class="titler-no_order">Chưa có đơn hàng</span>
                </div> -->
			</div>

			<!-- Cancel form -->
			<div id="cancel_form" class="col-md-12 cancel_order active">
				<!-- <div class="no_order">
                    <img class="img-no_order" src="./assets/img/no_order.png" alt="">
                    <span class="titler-no_order">Chưa có đơn hàng</span>
                </div> -->
			</div>
		</div>

		<!-- Product Management -->
		<div id="product_management-form" class="product_management">
			<div class="filter_date">
				<div class="col-md-12 footer_item footer_item-btn">
					<span class="filter_title filter_title--main cl-prm">Thể
						loại</span>
					<form action=""></form>
					<select name="" id="">
						<option value="">Tất cả</option>
						<option value="">Sách</option>
						<option value="">Truyện</option>
						<option value="">Tiểu thuyết</option>
						<option value="">Sách nước ngoài</option>
					</select> <a href="" class="btn footer_btn btn--out">Lọc</a>
				</div>
			</div>
			<div class="col-md-12 product_header">
				<div class="col-md-5 cl-prm">Tên sản phẩm</div>
				<div class="col-md-2 cl-prm">Thể loại</div>
				<div class="col-md-3 cl-prm">Số lượng trong kho</div>
				<div class="col-md-2 cl-prm">Giá bán</div>
			</div>
			<div class="col-md-12 product_body">
				<div class="col-md-5 body_name">Các Nền Văn Minh Thế Giới - Hy
					Lạp Cổ Đại</div>
				<div class="col-md-2 body_name">Sách</div>
				<div class="col-md-3 body_name">100</div>
				<div class="col-md-2">148.000đ</div>
			</div>
			<div class="col-md-12 product_body">
				<div class="col-md-5 body_name">Các Nền Văn Minh Thế Giới - Hy
					Lạp Cổ Đại</div>
				<div class="col-md-2 body_name">Sách nước ngoài</div>
				<div class="col-md-3 body_name">200</div>
				<div class="col-md-2">148.000đ</div>
			</div>

		</div>

		<!-- Add Products -->
		<div id="add_products-form" class="add_products">
			<form class="col-md-12 add_products-content">
				<div class="col-md-12 add_products-header">Thêm sản phẩm</div>
				<div class="add_products-item">
					<div class="col-md-2 add_products-title">Tên sản phẩm</div>
					<input type="text" class="col-md-10" required>
				</div>
				<div class="add_products-item">
					<div class="col-md-2 add_products-title">Thể loại</div>
					<select class="col-md-10 add_products-category" name="" id="">
						<option value="">Sách</option>
						<option value="">Truyện</option>
						<option value="">Tiểu thuyết</option>
						<option value="">Sách nước ngoài</option>
					</select>
				</div>
				<div class="add_products-item">
					<div class="col-md-2 add_products-title">Giá niêm yết</div>
					<input type="text" class="col-md-10" required>
				</div>
				<div class="add_products-item">
					<div class="col-md-2 add_products-title">Giá bán</div>
					<input type="text" class="col-md-10" required>
				</div>
				<div class="add_products-item">
					<div class="col-md-2 add_products-title">Mô tả</div>
					<textarea class="form-control col-md-10" rows="3" required></textarea>
				</div>
				<div class="add_products-item">
					<div class="col-md-2 add_products-title detailed_description">
						Mô tả chi tiết</div>
					<textarea class="form-control col-md-10" rows="7" required></textarea>
				</div>
				<div class="add_products-item">
					<div class="col-md-2 add_products-title">Ảnh minh hoạ</div>
					<div class="col-md-10 input-image">
						<div class="preview-images-zone"></div>
						<fieldset class="form-group">
							<a class="add_image-link" href="javascript:void(0)"
								onclick="$('#pro-image').click()">Thêm hình ảnh</a> <input
								type="file" id="pro-image" name="pro-image"
								style="display: none;" class="form-control" multiple required>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./assets/javascript/admin.js"></script>
</body>