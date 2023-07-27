<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>

    <title>NHQBook - Loại sản phẩm</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- Custom styles for this page -->
    <link href="assestSeller/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./assestSeller/css/product.css">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<%@ include file="/common/admin/AdSlideBar.jsp"%>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				
				<%@ include file="/common/admin/AdTopBar.jsp"%>
					
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="container-header">
                        <h1 class="h3 mb-2 text-gray-800 col-lg-9">Quản lý loại sản phẩm</h1>
                        <a class="h5 mb-2 text-gray-800 col-lg-3 link-add-product js-btn-addTypeBook">
                            <div class="btn btn-success btn-circle icon-add"><i class="fa-solid fa-circle-plus"></i></div>
                            Thêm loại sách
                        </a>
                    </div>
                    

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã loại sách</th>
                                            <th>Tên loại sách</th>
                                            <th>Sửa</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Mã loại sách</th>
                                            <th>Tên loại sách</th>
                                            <th>Sửa</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </tfoot>
                                    <tbody id="idCateTable">
                                        <!-- <tr>
                                            <td>1</td>
                                            <td>Sách thiếu nhi</td>
                                            <td><a href="#" class="btn btn-warning btn-circle"><i
                                                        class="fa-regular fa-pen-to-square"></i></a></td>
                                            <td><a href="#" class="btn btn-danger btn-circle"><i
                                                        class="fas fa-trash"></i></a></td>
                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>NHQBook &copy; Nhà sách số 1 Võ Văn Ngân</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
            
        </div>
        <!-- End of Content Wrapper -->

        <div class="row form_modal type_product js-modal">
            <form class="col-lg-6 modal_container">
                <i class="fa-solid fa-x icon-X js-btn-close"></i>
                <div class="mb-3 form_text modal_body col-lg-12">
                    <span class="text_title">Tên thể loại</span>
                    <input type="text" class="form-control " id="nameTypeBook" placeholder="" value="" required>
                </div>
    
                <div class="mb-3 form_btn--save col-lg-12">
                    <span class="col-lg-2"></span>
                    <button id="btnLuu" class="btn-pri btn-outline-success my-2 my-sm-0 btn-lg btn-block btn-save"
                        >Lưu</button>
                </div>
            </form>
        </div>
    </div>
    <!-- End of Page Wrapper -->

	<script src="./assets/javascript/AdTypeProduct.js"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="assestSeller/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="assestSeller/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="assestSeller/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="assestSeller/js/demo/datatables-demo.js"></script>

</body>
