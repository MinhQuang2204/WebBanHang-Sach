<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="home"">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fa-solid fa-book-open"></i>
		</div>
		
		<div class="sidebar-brand-text mx-3">NHQBook <sup>Seller</sup></div>
		
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<!-- <li class="nav-item active"><a class="nav-link"
		href="seller-register-complete""> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>Trang chủ</span></a></li> -->

	<li class="nav-item"><a class="nav-link" href="vendor-profile">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Hồ sơ Shop</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Nav Item -->
	<li class="nav-item"><a class="nav-link" href="vendor-orderForm">
			<i class="fas fa-fw fa-table"></i> <span>Quản lý đơn hàng</span>
	</a></li>


	<!-- Nav Item -->
	<li class="nav-item"><a class="nav-link" href="vendor-produce">
			<i class="fa-solid fa-boxes-stacked"></i> <span>Quản lý sản
				phẩm</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
<!-- End of Sidebar -->
