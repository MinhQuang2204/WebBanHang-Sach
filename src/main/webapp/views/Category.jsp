<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>
<title>Mua sắm online</title>
<link rel="stylesheet"
	href='<c:url value="./assets/css/category.css"></c:url>'>
</head>

<body>
	<div id = "toast"></div>
	<div class="container">
		<!-- Content -->
		<div class="content">
			<div class="content-item">
				<div class="content_header content_header--fCategory">
					<a href="" class="">${categoryName.category_name}</a> <a
						class="dropdown-toggle dropdown-toggle_category dropdown-toggle--fCategory"
						href="#" role="button" data-toggle="dropdown" aria-expanded="true">
						Giá </a>
					<div class="dropdown-menu sort-list">
						<a class="sort-item" href="">Giá: Giảm dần</a> <a
							class="sort-item" href="">Giá: Tăng dần</a>
					</div>
				</div>
				<div class="row">
					<c:forEach items="${ListP}" var="pd">
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
				<div class="content_footer">
					<ul class="content_paging row">
						<li class="paging-item col"><i
							class="fa-sharp fa-solid fa-angle-left pagination-item__link"></i>
						</li>
						<!-- <li class="paging-item col"><a href=""
							class="pagination-item__link paging_active">1</a></li>
						<li class="paging-item col"><a href=""
							class="pagination-item__link">2</a></li>
						<li class="paging-item col"><a href=""
							class="pagination-item__link">3</a></li>
						<li class="paging-item col"><a href=""
							class="pagination-item__link">4</a></li>
						<li class="paging-item col"><a href=""
							class="pagination-item__link">...</a></li>
						<li class="paging-item col"><a href=""
							class="pagination-item__link">10</a></li> -->
						<c:forEach begin="1" end="${endP}" var="pd">
							<li class="paging-item col"><a
								href="Category?cid=${categoryName.category_id}&&index=${pd}"
								class="pagination-item__link ${tag==pd?"paging_active":""}">${pd}</a>
							</li>
						</c:forEach>
						<li class="paging-item col"><i
							class="fa-sharp fa-solid fa-angle-right pagination-item__link"></i>
						</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
	
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

</body>
