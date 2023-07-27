<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<form class="form-inline">
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>
	</form>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<div class="topbar-divider d-none d-sm-block"></div>
		<input type="hidden" id="idUser" value="${sessionScope.adIdUser}"/>
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span id="nameShipper"
				class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.adName}</span>
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Đăng xuất
				</a>
			</div></li>

	</ul>

</nav>
<!-- End of Topbar -->
