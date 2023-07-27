<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
		<!-- Nav Item - User Information -->
		<div class="topbar-divider d-none d-sm-block"></div>
		<input type="hidden" id="idUser" value="${sessionScope.idUser}"/>
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.name}</span>
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="vendor-profile"> <i
					class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Thông tin
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Đăng xuất
				</a>
			</div></li>

	</ul>

</nav>
<!-- End of Topbar -->
