<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<head>

    <title>NHQBook - Admin</title>

    <!-- Custom styles for this page -->
    <link href="assestSeller/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                    <h1 class="h3 mb-2 text-gray-800">Quản lý sản phẩm</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã sách</th>
                                            <th>Tên sách</th>
                                            <th>Thể loại</th>
                                            <th>Số lượng</th>
                                            <th>Giá bán</th>
                                            <th>Tình trạng</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Mã sách</th>
                                            <th>Tên sách</th>
                                            <th>Thể loại</th>
                                            <th>Số lượng</th>
                                            <th>Giá bán</th>
                                            <th>Tình trạng</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </tfoot>
                                    <tbody id="product">
                                        <!-- <tr>
                                            <td>1</td>
                                            <td>Các Nền Văn Minh Thế Giới - Hy Lạp Cổ Đại</td>
                                            <td>Sách nước ngoài</td>
                                            <td>148.000</td>
                                            <td><a href="#" class="btn btn-danger btn-circle"><i class="fas fa-trash"></i></a></td>
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

    </div>
    <!-- End of Page Wrapper -->

    <script src="./assets/javascript/AdProduct.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="assestSeller/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="assestSeller/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="assestSeller/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="assestSeller/js/demo/datatables-demo.js"></script>

</body>
