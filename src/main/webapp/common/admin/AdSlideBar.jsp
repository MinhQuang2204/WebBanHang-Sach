<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fa-solid fa-book-open"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			NHQBook <sup>admin</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item -->
	<li class="nav-item active"><a class="nav-link" href="admin-account">
			<i class="fa-regular fa-address-card"></i> <span>Quản lý tài
				khoản</span>
	</a></li>
	
	<!-- Nav Item -->
	<li class="nav-item"><a class="nav-link" href="admin-typeProduct">
			<i class="fa-regular fa-address-book"></i> <span>Quản lý loại
				sản phẩm</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="admin-product"> <i
			class="fa-solid fa-boxes-stacked"></i> <span>Quản lý sản phẩm</span></a>
	</li>

	<hr class="sidebar-divider my-0">
</ul>
<!-- End of Sidebar -->
