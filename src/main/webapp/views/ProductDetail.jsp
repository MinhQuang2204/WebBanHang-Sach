<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<title>Chi tiết sản phẩm</title>
<!--Important link from https://bootsnipp.com/snippets/XqvZr-->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet"
	href="<c:url value="./assets/css/product_detail.css"></c:url>">

</head>

<body>
	<div id = "toast"></div>
	<div class="pd-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img class="col-md-12" src="${productDetail.image}" />
				</div>
				<div class="col-md-6">
					<div class="product-dtl">
						<div class="product-info">
							<div class="product-name">${productDetail.productName}</div>
							<div class="reviews-counter">
								<div class="rate">
									<input type="radio" id="star5" name="rate" value="5" checked />
									<label for="star5" title="text">5 stars</label> <input
										type="radio" id="star4" name="rate" value="4" checked /> <label
										for="star4" title="text">4 stars</label> <input type="radio"
										id="star3" name="rate" value="3" checked /> <label
										for="star3" title="text">3 stars</label> <input type="radio"
										id="star2" name="rate" value="2" /> <label for="star2"
										title="text">2 stars</label> <input type="radio" id="star1"
										name="rate" value="1" /> <label for="star1" title="text">1
										star</label>
								</div>
								<span>3 Đánh giá</span>
							</div>
							<div class="product-price-discount">
								<span style="color: var(- -primary-color);"><fmt:formatNumber
										type="number" pattern="#,###" value="${productDetail.price}"></fmt:formatNumber>đ</span>
								<span class="line-through"><fmt:formatNumber
										type="number" pattern="#,###"
										value="${productDetail.price + productDetail.price * 0.1}"></fmt:formatNumber>đ</span>
							</div>
						</div>
						<p></p>

						<div class="row">
							<div class="col-md-12">
								<label for="size">Hình thức bìa: ${cover.type_name}</label>
							</div>
							<div class="col-md-6">
								<label for="size">Số lượng hiện có:
									${productDetail.quantity}</label>
							</div>
							<div class="col-md-6">
								<label for="color"></label>
							</div>
						</div>

						<div class="product-count">
							<label for="size">Số lượng</label> <input id="checkAmount"
								type="hidden" value="${productDetail.quantity}" />
							<form action="#" class="display-flex">
								<div id="sub" class="qtyminus">-</div>
								<input type="text" id="quantity" name="quantity" value="1"
									class="qty">
								<div id="plus" class="qtyplus">+</div>
							</form>
							<c:if test="${sessionScope.account == null}">
								<c:if test="${productDetail.quantity > 0}">
									<a href="layout-Login?mask=login" class="round-pink-btn">Thêm
										vào giỏ hàng</a>
									<a href="layout-Login?mask=login" class="round-pink-btn">Mua
										ngay</a>
								</c:if>
								<c:if test="${productDetail.quantity == 0}">
									<a href="layout-Login?mask=login" class="round-pink-btn">Hết
										hàng</a>
								</c:if>
							</c:if>
							<c:if test="${sessionScope.account != null}">	
								<c:if test="${productDetail.quantity > 0}">
									<a type="submit" onclick="buy('${productDetail.id}') ; showSuccessToast();"
										class="round-pink-btn">Thêm vào giỏ hàng</a>
									<a href="layout-Payment" onclick="buy('${productDetail.id}')"
										class="round-pink-btn">Mua ngay</a>
								</c:if>
								<c:if test="${productDetail.quantity == 0}">
									<a class="round-pink-btn" onclick="showErrorToast()">Hết hàng</a>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
				<div class="product-info-tabs col-md-12">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="description-tab" data-toggle="tab" href="#description"
							role="tab" aria-controls="description" aria-selected="true">Mô
								tả</a></li>
						<li class="nav-item"><a class="nav-link" id="review-tab"
							data-toggle="tab" href="#review" role="tab"
							aria-controls="review" aria-selected="false">Đánh giá (0)</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="description"
							role="tabpanel" aria-labelledby="description-tab">${productDetail.description}</div>
						<div class="tab-pane fade" id="review" role="tabpanel"
							aria-labelledby="review-tab">
							<div style="color: var(- -primary-color);" class="review-heading">Đánh
								giá</div>
							<p class="mb-20">Chưa có đánh giá nào.</p>
							<form class="review-form">
								<div class="form-group">
									<label>Đánh giá của bạn</label>
									<div class="reviews-counter">
										<div class="rate">
											<input type="radio" id="star5" name="rate" value="5" /> <label
												for="star5" title="text">5 stars</label> <input type="radio"
												id="star4" name="rate" value="4" /> <label for="star4"
												title="text">4 stars</label> <input type="radio" id="star3"
												name="rate" value="3" /> <label for="star3" title="text">3
												stars</label> <input type="radio" id="star2" name="rate" value="2" />
											<label for="star2" title="text">2 stars</label> <input
												type="radio" id="star1" name="rate" value="1" /> <label
												for="star1" title="text">1 star</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>Bình luận</label>
									<textarea class="form-control" rows="10"></textarea>
								</div>
								<button class="round-pink-btn">Gửi</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

	<!--Import jQuery before materialize.js-->

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.14.0/sweetalert2.all.min.js"></script>


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

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value="./assets/javascript/product_detail.js"></c:url>"></script>
</body>