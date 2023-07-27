<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NHQBook - Hồ sơ</title>

    <!-- Custom fonts for this template-->
    <link href="assestSeller/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="./assestSeller/vendor/fontawesome-free-6.2.0-web/css/all.min.css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- Custom styles for this template-->
    <link href="assestSeller/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./assestSeller/css/profile.css">


</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		
		<%@ include file="/common/seller/SlideBar.jsp"%>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <%@ include file="/common/seller/TopBar.jsp"%>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Thông tin cửa hàng</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <form class="form_input">
                            <div class="mb-3 form_text">
                                <span class="text_title col-lg-2">Tên Shop</span>
                                <input type="text" class="form-control col-lg-12" id="name" placeholder="" value=""
                                    required>
                            </div>
                            <div class="mb-3 form_text">
                                <span class="text_title col-lg-2">Số điện thoại</span>
                                <input type="tel" class="form-control col-lg-12" id="tel" placeholder="" value=""
                                    required>
                            </div>
                            <div class="mb-3 form_text">
                                <span class="text_title col-lg-2">Email</span>
                                <input type="email" class="form-control col-lg-12" id="email" placeholder="" value=""
                                    required>
                            </div>
                            <div class="mb-3 form_text">
                                <span class="text_title col-lg-2">Địa chỉ cửa hàng</span>
                                <input type="text" class="form-control col-lg-12" id="text" placeholder="" value=""
                                    required>
                            </div>

                            <div class="mb-3 form_btn--save">
                                <span class="col-lg-2"></span>
                                <button class="btn btn-outline-success my-2 my-sm-0 btn-lg btn-block btn-save"
                                    type="submit">Lưu</button>
                            </div>
                        </form>
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
    
    <%@ include file="/common/seller/Footer.jsp"%>
    
    <script src="./assets/javascript/sellerProfile.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="assestSeller/vendor/jquery/jquery.min.js"></script>
    <script src="assestSeller/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assestSeller/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="assestSeller/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="assestSeller/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="assestSeller/js/demo/chart-area-demo.js"></script>
    <script src="assestSeller/js/demo/chart-pie-demo.js"></script>

</body>