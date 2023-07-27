<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
	

<head>
<link rel="stylesheet" href='<c:url value="./assets/css/base.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="./assets/css/change_phone.css"></c:url>'>
</head>

<body>

	<!-- Content -->
	<div class="container">
		<div class="col-md-6 row content">
			<div class="row content_logo">
				<svg width="80" height="80" fill="none">
                    <path fill-rule="evenodd" clip-rule="evenodd"
						d="M11.348 54.153c-8.05-16.329-5.904-41.708-5.904-41.708 22.053.65 34.686-7.268 34.686-7.268v70.306c-13.094-5.7-20.277-11.185-20.277-11.185-5.076-3.943-8.505-10.145-8.505-10.145zM40.131 5.177s12.633 7.918 34.685 7.268c0 0 2.145 25.38-5.904 41.708 0 0-3.43 6.202-8.505 10.145 0 0-7.183 5.485-20.276 11.184V5.177z"
						fill="url(#paint0_linear)"></path>
                    <path fill-rule="evenodd" clip-rule="evenodd"
						d="M69.355 16.767c-18.593.548-29.245-6.127-29.245-6.127v59.277c11.04-4.806 17.097-9.43 17.097-9.43 4.279-3.325 7.17-8.554 7.17-8.554 6.787-13.768 4.978-35.166 4.978-35.166z"
						fill="#FFEAEA"></path>
                    <path fill-rule="evenodd" clip-rule="evenodd"
						d="M10.865 16.767s-1.809 21.398 4.978 35.166c0 0 2.891 5.23 7.17 8.554 0 0 6.057 4.624 17.097 9.43V10.64s-10.652 6.675-29.245 6.127z"
						fill="#fff"></path>
                    <path
						d="M51.808 29.967a2.273 2.273 0 113.334 3.09l-14.85 16.02c-.4.43-1.077.444-1.493.028l-1.749-1.75a1.037 1.037 0 01-.027-1.437l14.785-15.951z"
						fill="var(--primary-color)"></path>
                    <path
						d="M28.377 36.8a2.27 2.27 0 013.105-.098l9.48 8.35a2.27 2.27 0 11-3 3.406l-9.48-8.349a2.27 2.27 0 01-.105-3.309z"
						fill="var(--primary-color)"></path>
                    <defs>
                        <linearGradient id="paint0_linear" x1="5.185"
						y1="5.177" x2="5.185" y2="75.483" gradientUnits="userSpaceOnUse">
                            <stop stop-color="var(--primary-color)"></stop>
                            <stop offset="1"
						stop-color="var(--primary-color)"></stop>
                        </linearGradient>
                    </defs>
                </svg>
			</div>

			<div class="row content_title">Để tăng cường bảo mật cho tài
				khoản của bạn, hãy xác minh thông tin bằng một trong những cách sau.
			</div>

			<form class="col-md-12 content_otp">
				<div class="col-md-2"></div>
				<div class="col-md-8 btn_otp">
					<i class="fa-regular fa-envelope"></i> Xác minh bằng mã OTP gửi qua
					Email
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-8 btn_otp">
					<i class="fa-solid fa-phone"></i> Xác minh bằng mã OTP gửi qua Số
					điện thoại
				</div>
				<div class="col-md-2"></div>
			</form>
		</div>
	</div>
</body>
