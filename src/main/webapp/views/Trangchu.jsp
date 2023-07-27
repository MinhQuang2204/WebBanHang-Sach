<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.4/swiper-bundle.css"
	integrity="sha512-wbWvHguVvzF+YVRdi8jOHFkXFpg7Pabs9NxwNJjEEOjiaEgjoLn6j5+rPzEqIwIroYUMxQTQahy+te87XQStuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<div id = "toast"></div>
	<div class="container">

		<!-- Swiper -->
		<div class="row container_swiper">
			<div class="swiper mySwiper col-md-8">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/Megasale_Main_Banner_Slide_840x320.jpg"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/VPP_Main_banner_T10_840x320.jpg"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/manga_T092022_Manga_T102022_840x320.png"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/STKT1022_Banner_840x320.jpg"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/casio_web_t10.jpg"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/dongamamxanh_t10_840x320.jpg"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/pnj_840x320.jpg"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/MocaT1022_840x320.jpg"
							alt="">
					</div>
					<div class="swiper-slide">
						<img
							src="https://cdn0.fahasa.com/media/magentothem/banner7/FahasaOnline-T10_840x320.jpg"
							alt="">
					</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>
			<div class="swiper-slide-right col-md-4">
				<div class="swiper-slide" style="height: auto;">
					<img
						src="https://cdn0.fahasa.com/media/wysiwyg/Thang-10-2022/Megasale_Flashsale_Subbanner_392x156.jpg"
						alt="">
				</div>
				<div class="swiper-slide" style="height: auto;">
					<img
						src="https://cdn0.fahasa.com/media/wysiwyg/Duy-VHDT/STKT1022_Banner_392x156.jpg"
						alt="">
				</div>
			</div>
		</div>

		<!-- Content -->
		<div class="content">

			<!-- Item 1 -->
			<div class="content-item">
				<div class="content_header">
					<a href="" class="">Sách mới</a>
				</div>
				<form name="f" action="" method="get">
					<div id="content-newbook" class="row">
						<c:forEach items="${displayProduct}" var="pd">
							<div class="newbook col-2-4">
								<div class="card">
									<a href="PdsDetail?psdID=${pd.id}" class="card-item"> <img
										src="${pd.image}" class="card-img-top" alt="${pd.productName}">
										<div class="card-body">
											<h6 class="card-title home-product-item__name">${pd.productName}</h6>
											<div class="home-product-item__price">
												<span class="home-product-item__price-old"><fmt:formatNumber
														type="number" pattern="#,###"
														value="${pd.price + pd.price*0.1}"></fmt:formatNumber>đ</span> <span
													class="home-product-item__price-current"> <fmt:formatNumber
														type="number" pattern="#,###" value="${pd.price}"></fmt:formatNumber>đ
												</span>
											</div>
										</div> <%-- <c:if test="${pd.id_discount != 0}">
											<div class="home-product-item__sale-off">${pd.id_discount}%</div>
										</c:if> --%>
									</a>

									<div class="card-body card-btn">
										<c:if test="${sessionScope.account != null}">
											<c:if test="${pd.quantity > 0}">
												<a type="submit"
													onclick="buy('${pd.id}'); showSuccessToast();"
													class="card-link btn--success">Thêm vào giỏ hàng</a>
											</c:if>
											<c:if test="${pd.quantity == 0}">
												<a class="card-link btn--danger" onclick="showErrorToast()">Hết hàng</a>
											</c:if>
										</c:if>
										<c:if test="${sessionScope.account == null}">
											<c:if test="${pd.quantity > 0}">
												<a href="layout-Login?mask=login" class="card-link">Thêm
													vào giỏ hàng</a>
											</c:if>
											<c:if test="${pd.quantity == 0}">
												<a href="layout-Login?mask=login" onclick="showErrorToast()" class="card-link btn--danger">Hết
													hàng</a>
											</c:if>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</form>
				<div class="content_footer">
					<a type="submit" onclick="LoadMore()"
						class="content_footer-seemore">Xem thêm</a>
				</div>
			</div>

			<!-- Item 2 -->
			<div class="content-item">
				<div class="content_header">
					<a href="" class="">Sắp phát hành</a>
				</div>
				<form name="" action="" method="post">
					<div class="row">
						<c:forEach items="${listTop10Product}" var="pd">
							<div class="col-2-4">
								<div class="card">
									<a href="PdsDetail?psdID=${pd.id}" class="card-item"> <img
										src="${pd.image}" class="card-img-top" alt="${pd.productName}">
										<div class="card-body">
											<h6 class="card-title home-product-item__name">${pd.productName}</h6>
											<div class="home-product-item__price">
												<span class="home-product-item__price-old"><fmt:formatNumber
														type="number" pattern="#,###"
														value="${pd.price + pd.price*0.1}"></fmt:formatNumber>đ</span> <span
													class="home-product-item__price-current"> <fmt:formatNumber
														type="number" pattern="#,###" value="${pd.price}"></fmt:formatNumber>đ
												</span>
											</div>
										</div> <%-- <c:if test="${pd.id_discount != 0}">
											<div class="home-product-item__sale-off">${pd.id_discount}%</div>
										</c:if> --%>
									</a>
									
									
									<div class="card-body card-btn">
										<c:if test="${sessionScope.account != null}">
											<c:if test="${pd.quantity > 0}">
												<a type="submit"
													onclick="buy('${pd.id}'); showSuccessToast();"
													class="card-link btn--success">Thêm vào giỏ hàng</a>
											</c:if>
											<c:if test="${pd.quantity == 0}">
												<a class="card-link btn--danger" onclick="showErrorToast()">Hết hàng</a>
											</c:if>
										</c:if>
										<c:if test="${sessionScope.account == null}">
											<c:if test="${pd.quantity > 0}">
												<a href="layout-Login?mask=login" class="card-link">Thêm
													vào giỏ hàng</a>
											</c:if>
											<c:if test="${pd.quantity == 0}">
												<a href="layout-Login?mask=login" onclick="showErrorToast()" class="card-link btn--danger">Hết
													hàng</a>
											</c:if>
										</c:if>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</form>

				<div class="content_footer">
					<a type="submit" onclick="LoadMore()"
						class="content_footer-seemore">Xem thêm</a>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function buy(id) {
			var amount = 1;
			$.ajax({
				url : "/WebBanHang/member/cart-add",
				type : "get", //send it through get method
				data : {
					pId : id,
					quantity : amount
				},
				success : function(data) {

				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
	</script>

	<script type="text/javascript">
		function LoadMore() {
			var amount = document.getElementsByClassName("newbook").length;
			$.ajax({
				url : "/WebBanHang/layout-load",
				type : "get",
				data : {
					exist : amount,
				},
				success : function(data) {
					$("#content-newbook").append(data);
				},
				error : function(xhr) {
				}
			});
		}
	</script>

	<script>
		function showSuccessToast() 
	    {
	      const main = document.getElementById('toast');
	        if (main) {
	            const toast = document.createElement('div');
	
	            const autoRemoveId = setTimeout(function() {
	                main.removeChild(toast);
	            }, 1000);
	
	            toast.onclick = function(e) {
	                if (e.target.closest('.toast__close')){
	                    main.removeChild(toast);
	                    clearTimeout(autoRemoveId);
	                }
	            }
	
	            toast.classList.add('toast', `toast--success`);
	            toast.style.animation = `slideInLeft ease 0.3s forwards, fadeOut linear 1s 0.3s forwards`;
	
	            toast.innerHTML = `
	                <div class="toast__icon"> 
	                    <i class="fa-solid fa-circle-check"}"></i>
	                </div>
	                <div class="toast__body">
	                    <h3 class="toast__title">Thành công</h3>
	                    <p class="toast__msg">Đã thêm vào giỏ hàng</p>
	                </div>
	                <div class="toast__close">
	                    <i class="fa-solid fa-xmark"></i>
	                </div>
	            `;
	            main.appendChild(toast);
	
	        	}
	    	}
	    	
	    	function showErrorToast() 
		    {
		      const main = document.getElementById('toast');
		        if (main) {
		            const toast = document.createElement('div');
		
		            const autoRemoveId = setTimeout(function() {
		                main.removeChild(toast);
		            }, 1000);
		
		            toast.onclick = function(e) {
		                if (e.target.closest('.toast__close')){
		                    main.removeChild(toast);
		                    clearTimeout(autoRemoveId);
		                }
		            }
		
		            toast.classList.add('toast', `toast--error`);
		            toast.style.animation = `slideInLeft ease 0.3s forwards, fadeOut linear 1s 0.3s forwards`;
		
		            toast.innerHTML = `
		                <div class="toast__icon"> 
		                    <i class="fa-solid fa-circle-exclamation"}"></i>
		                </div>
		                <div class="toast__body">
		                    <h3 class="toast__title">Thất bại</h3>
		                    <p class="toast__msg">Không thể thêm vào giỏ hàng</p>
		                </div>
		                <div class="toast__close">
		                    <i class="fa-solid fa-xmark"></i>
		                </div>
		            `;
		            main.appendChild(toast);
		
		        	}
		    	}
	</script>
	

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>

</body>
