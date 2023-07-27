<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="./assets/font/fontawesome-free-6.2.0-web/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<title>NHQBook Võ Văn Ngân</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./assets/css/base.css">
<link rel="stylesheet" href="./assets/css/sales_registration_2.css">
</head>

<body>
	<!-- Header -->
	<div class="header">
		<div class="header-text">
			<a class="header-text-brand" href="home">NHQBook.vn</a> <span>Đăng
				ký trở thành Người bán NHQBook</span>
		</div>
	</div>

	<!-- Content -->
	<div class="container">
		<div class="content">
			<h4 class="content_title">Cài đặt thông tin cửa hàng</h4>
			<%
			if (session.getAttribute("alert") != null) {
				out.print("<h4 class='text-warning ml-1'>" + session.getAttribute("alert") + "</h4>");
			}
			session.removeAttribute("alert");
			%>
			<form action="layout-Signup?mask=1" method="post"
				class="needs-validation" novalidate>
				<div class="mb-3 form_text">
					<span class="text_title col-md-2">Tên Shop</span> <input name="nameShop"
						type="text" class="form-control col-md-10" id="firstName"
						placeholder="" value="" required> <span
						class="text_title col-md-2"></span>
					<div class="invalid-feedback col-md-10">Vui lòng nhập tên
						Shop.</div>
				</div>
				<div class="mb-3 form_text">
					<span class="text_title col-md-2">Số điện thoại</span> <input
						name="userName" type="tel" class="form-control col-md-10" id="tel"
						placeholder="" value="" required> <span
						class="text_title col-md-2"></span>
					<div class="invalid-feedback col-md-10">Vui lòng nhập số điện
						thoại.</div>
				</div>
				<input name="password" type="hidden" class="form-control col-md-10"
					id="password" placeholder="" value="">
				<div class="mb-3 form_text">
					<span class="text_title col-md-2">Email</span> <input name="email"
						type="email" class="form-control col-md-10" id="email"
						placeholder="" value="" required> <span
						class="text_title col-md-2"></span>
					<div class="invalid-feedback col-md-10">Vui lòng nhập Email.
					</div>
				</div>
				<div class="mb-3 form_text">
					<span class="text_title col-md-2">Địa chỉ lấy hàng</span>
					<div class="pd-l-0 col-md-3">
						<select name="ls_province" class="form_select" id="province">
						</select>
						<div class="invalid-feedback">Vui lòng chọn tỉnh.</div>
					</div>
					<div class="pd-l-0 col-md-3">
						<select name="ls_district" class="form_select" id="District">
						</select>
						<div class="invalid-feedback">Vui lòng chọn quận/huyện.</div>
					</div>
					<div class="pd-l-0 col-md-3">
						<select name="ls_ward" class="form_select" id="ward">
						</select>
						<div class="invalid-feedback">Vui lòng chọn phường/xã.</div>
					</div>
				</div>
				<div class="mb-3 form_text">
					<span class="text_title col-md-2">Địa chỉ cụ thể</span> <input name = "addressShop"
						type="text" class="form-control col-md-10" id="text"
						placeholder="" value="" required> <span class="text_title col-md-2"></span>
					<div class="invalid-feedback col-md-10">Vui lòng nhập địa chỉ
						lấy hàng cụ thể của Shop.</div>
				</div>

				<div class="mb-3 form_btn--save">
					<span class="col-md-2"></span>
					<button
						class="btn btn-outline-success my-2 my-sm-0 btn-lg btn-block btn-save"
						type="submit">Hoàn tất</button>
				</div>
			</form>
		</div>
	</div>
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