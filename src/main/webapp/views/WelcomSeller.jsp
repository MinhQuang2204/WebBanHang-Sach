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
<title>NHQBook Võ Văn Ngân</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./assets/css/base.css">
<link rel="stylesheet" href="./assets/css/sales_registration_1.css">
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
			<img class="content_image"
				src="https://deo.shopeesz.com/shopee/pap-admin-live-sg/upload/upload_9dab85081088531ee6d1aa958a90f55e.png"
				alt="">
			<h5 class="content_title">Chào mừng đến với NHQBook</h5>
			<p class="content_title">Để đăng ký bán hàng trên NHQBook, bạn
				cần cung cấp một số thông tin cơ bản.</p>
			
			<c:if test="${sessionScope.account != null}">
				<a href="Seller-Registation" class="content_btn">Đăng kí</a>
			</c:if>
			<c:if test="${sessionScope.account == null}">
				<a href="layout-Login?mask=login" class="content_btn">Đăng kí</a>
			</c:if>
		</div>
	</div>
</body>