<%-- 
    Document   : Login
    Created on : Jun 5, 2022, 9:56:09 AM
    Author     : Trung Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
    </style>
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/themify-icons/themify-icons.css">
    <link rel="icon" href="./img/word-image-1047.jpg" type="image/x-icon">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- navbarlogin -->
    <div class="col-sm-12 navbarlogin">
        <h1><a class="ml-4" href="#">DRS - FPT University HCM</a></h1>
    </div>
    <!-- login-form -->
    <div class="container">
        <div class="row justify-content-center align-items-center login-wapper d-flex">
            <div class="col-sm-3 login-form">
                <h1 class="text-center">Login</h1>
                <form>
                    <!-- Email input -->
                    <div class="col-sm-12 form-outline mb-4 mt-4">
                        <input type="email" id="form2Example1" class="form-control" placeholder="Email" />
                    </div>
                    <!-- Password input -->
                    <div class="col-sm-12 form-outline mb-4">
                        <input type="password" id="form2Example2" class="form-control" placeholder="Password"/>
                    </div>
                    <!-- 2 column grid layout for inline styling -->
                    <div class="row mb-4">
                        <div class="col-sm-12 d-flex justify-content-center">
                            <!-- Checkbox -->
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" checked />
                                <label class="form-check-label"> Remember me </label>
                            </div>
                        </div>
                        <div class="col-sm-12 text-center forgot-password">
                            <!-- Simple link -->
                            <a href="#">Forgot password?</a>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-sm-12 d-flex justify-content-center">
                            <a class="btn btn-lg btn-google btn-block text-uppercase btn-outline" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8084/DeviceManagement/LoginHandler&response_type=code
                               &client_id=33568893407-i7p94f2ca7var420dpis79903h4o46ut.apps.googleusercontent.com&approval_prompt=force"> <img src="https://img.icons8.com/color/16/000000/google-logo.png">Login With Google</a>   
                        </div>
                        <div class="col-sm-12 text-center forgot-password">
                        </div>
                    </div>
                    <!-- Submit button -->
                    <button type="submit" class="btn btn-color btn-block mb-4 col-sm-12">Sign in</button>
                    <a href="admin.html">Admin</a>
                    <a href="user.html">User</a>
                    <a href="iddevicenamager.html">Manager</a>
                    <a href="requeststaff.html">Staff</a>
                </form>
            </div>
        </div>
    </div>
    <footer>
    </footer>
    <input type="hidden" value="${requestScope.ERROR}" id="ERROR"/>
        <script>
            var ERROR = document.getElementById("ERROR").value;
            if (ERROR !== "") {
                alert(ERROR);
            }
        </script>
</body>

