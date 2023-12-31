<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NHQBook - Register</title>

    <!-- Custom fonts for this template-->
    <link href="assestSeller/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="assestSeller/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image bg-login-title">NHQBook</div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Tạo tài khoản</h1>
                            </div>
                            <form action="layout-Signup?mask=3" class="user" method="POST">
                                <div class="form-group">
                                        <input name="fullname" type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="Tên" required>
                                   
                                </div>
                                <div class="form-group">
                                    <input name="userName" type="text" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Tài khoản" required>
                                </div>
                                <div class="form-group">
                                        <input name="password" type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Mật khẩu" required>
                                   
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Đăng kí
                                </button>
                                <hr>
                                <a href="#" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Đăng nhập với Google
                                </a>
                                <a href="#" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Đăng nhập với Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="layout-forgotPass">Quên mật khẩu?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="layout-loginAdmin">Đã có tài khoản? Đăng nhập.</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="assestSeller/vendor/jquery/jquery.min.js"></script>
    <script src="assestSeller/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assestSeller/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="assestSeller/js/sb-admin-2.min.js"></script>

</body>

</html>