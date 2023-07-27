<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header -->
	<div class="header">

		<!-- Header Img -->
		<div class="header-img"></div>

		<!-- Navbar Search -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light-new">
			<div class="container">
				<a class="navbar-brand" href="home"> <span>NHQShop</span>.vn
				</a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">

					<form action="Search" method="post"
						class="form-inline my-2 my-lg-0 mr-auto">
						<input name="txt" value="${tagSearch}" type="Search"
							class="form-control mr-sm-2 header_search"
							placeholder="Nhập sách cần tìm kiếm..." aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm</button>
					</form>

					<div class="menu_right">
						<ul class="navbar-nav" style="flex-direction: row;">
							<c:if test="${sessionScope.account == null}">
								<li class="nav-item item-login--icon"><a
									class="nav-link nav-link--account"
									href="layout-Login?mask=login"> <i class="fa-solid fa-user"
										href="layout-Login?mask=login"></i>
								</a></li>
								<li class="nav-item item-login--dropdown dropdown"><a
									class="nav-link dropdown-toggle nav-link--account" href=""
									role="button" data-toggle="dropdown" aria-expanded="false">
										<i class="fa-solid fa-user" href="layout-Login?mask=login"></i>
										<span class="account_title">Tài khoản</span>
								</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="layout-Login?mask=login">Đăng
											nhập</a> <a class="dropdown-item" href="layout-Login?mask=signup">Đăng
											kí</a>
										<div class="dropdown-divider"></div>
										<!-- <a class="dropdown-item item-facebook" href=""> <i
											class="fa-brands fa-facebook"></i> Đăng nhập bằng Facebook
										</a> -->
										<!-- <div class="fb-login-button" data-width="" data-size="large"
											data-button-type="login_with" data-layout="default"
											data-auto-logout-link="false" data-use-continue-as="false"></div> -->
										<a href="Seller" class="dropdown-item"> <i
											class="fa-brands fa-shopify"></i> Trang người bán
										</a> <a class="dropdown-item item-google"
											href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/WebBanHang/LoginGoogleHandler&response_type=code
		   &client_id=53687840933-fd8nnbpaif4sjq16fj886kmkd0ml4fjb.apps.googleusercontent.com&approval_prompt=force">
											<i class="fa-brands fa-google"></i> Đăng nhập bằng Google
										</a>
									</div></li>
							</c:if>
							<c:if test="${sessionScope.account != null}">
								<li class="nav-item item-login--icon"><a
									class="nav-link nav-link--account" href="user"> <i
										class="fa-solid fa-user" href="user"></i>
								</a></li>
								<li id="logged" class="nav-item dropdown user_name--logged"><a
									class="nav-link dropdown-toggle
                        nav-link--account"
									href="user" role="button" data-toggle="dropdown"
									aria-expanded="false"> <i class="fa-solid fa-user"></i>
										${sessionScope.name}
								</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="user"> Tài khoản của tôi</a><a
											href="Seller" class="dropdown-item"> <i
											class="fa-brands fa-shopify"></i> Trang người bán
										</a> <a class="dropdown-item" href="Logout">Đăng xuất</a>
									</div></li>
							</c:if>
							<c:if test="${sessionScope.account != null}">
								<li class="nav-item"><a class="nav-link nav-link--cart"
									href="showCart"> <i class="fa-solid fa-cart-shopping"></i>
										<span class="cart_title">Giỏ hàng</span>
								</a></li>
							</c:if>
							<c:if test="${sessionScope.account == null}">
								<li class="nav-item"><a class="nav-link nav-link--cart"
									href="layout-Login?mask=login"> <i class="fa-solid fa-cart-shopping"></i>
										<span class="cart_title">Giỏ hàng</span>
								</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</nav>

		<!-- Navbar Category -->
		<nav class="navbar navbar-expand-lg bg-light-new">
			<div class="container">
				<div class="container-fluid">
					<ul class="navbar-nav navbar_category--max">
						<li class="nav-item dropdown"><a
							class="dropdown-toggle dropdown-toggle_category" href="#"
							role="button" data-toggle="dropdown" aria-expanded="true">
								Danh mục </a>
							<div class="dropdown-menu category-list">
								<c:forEach items="${listCategory}" var="cg">
									<a class="category-item" href="Category?cid=${cg.category_id}">${cg.category_name}</a>
								</c:forEach>
							</div></li>
					</ul>
					<ul class="navbar-nav navbar-nav--sec">
						<li class="nav-item"><a class="nav-link nav-item_category"
							aria-current="page" href="">Sách mới</a></li>
						<li class="nav-item"><a class="nav-link nav-item_category"
							href="">Sắp phát hành</a></li>
						<li class="nav-item"><a class="nav-link nav-item_category"
							href="">Sách bán chạy</a></li>
						<li class="nav-item"><a class="nav-link nav-item_category"
							href="">Sách có chữ kí</a></li>
						<li class="nav-item"><a class="nav-link nav-item_category"
							href="">Gợi ý cho bạn</a></li>
					</ul>
				</div>
			</div>
		</nav>

	</div>

	<!-- <script>
		function statusChangeCallback(response) { // Called with the results from FB.getLoginStatus().
			console.log('statusChangeCallback');
			console.log(response); // The current login status of the person.
			if (response.status === 'connected') { // Logged into your webpage and Facebook.
				testAPI();
			} else { // Not logged into your webpage or we are unable to tell.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this webpage.';
			}
		}

		function checkLoginState() { // Called when a person is finished with the Login Button.
			FB.getLoginStatus(function(response) { // See the onlogin handler
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '787023645895487',
				cookie : true, // Enable cookies to allow the server to access the session.
				xfbml : true, // Parse social plugins on this webpage.
				version : 'v15.0' // Use this Graph API version for this call.
			});

			FB.getLoginStatus(function(response) { // Called after the JS SDK has been initialized.
				statusChangeCallback(response); // Returns the login status.
			});
		};

		function testAPI() { // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
			console.log('Welcome!  Fetching your information.... ');
			FB.api('/me',function(response) {
				console.log('Successful login for: '
					+ response.name);
				document.getElementById('status').innerHTML = 'Thanks for logging in, '
					+ response.name + '!';
			});
		}
	</script> -->

	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/en_US/sdk.js"></script>

</body>
</html>