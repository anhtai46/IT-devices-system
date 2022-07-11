<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Device Detail</title>
        <link rel="stylesheet" href="css/style.css" />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap");
        </style>
        <link rel="stylesheet" href="fonts/themify-icons/themify-icons.css" />
        <link rel="icon" href="./img/word-image-1047.jpg" type="image/x-icon" />
        <link
            rel="stylesheet"
            href="node_modules/bootstrap/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
            integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
            crossorigin="anonymous"
            />
        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/fonts/fontawesome-free-6.1.1-web/css/all.min.css">

    </head>

    <body>
        <c:set var="descriptionList" value="${requestScope.DESCRIPTION_LIST}"/>
        <!-- nabar -->
        <div class="row navbar">
            <!-- logo -->
            <div class="col-sm-4 navbar-user-left d-flex align-items-center">
                <div class="col-sm-5 logo">
                    <a href="MainController?action=HomeSearchDevice&search="><img src="./img/logo.png" height="80" alt="" /></a>
                </div>
                <!-- product-list -->
                <div class="">
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center justify-content-center user-info" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown">
                            <p class="product-list">Product</p>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="userproduct.html">Laptop</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="userproduct.html">Camera</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="userproduct.html">Graphic Tablet</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="userproduct.html">Tablet</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="userproduct.html">All Product</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 text-center navbar-user-fill"></div>
            <!-- card-icon -->
            <div class="col-sm-4 text-center navbar-user-right d-flex">
                <div class="col-sm-6 card-shopping">
                    <a href="card.html" role="button">
                        <i class="fas fa-shopping-cart text-dark ml-5 mt-2"></i>
                    </a>
                </div>
                <!-- welcome -->
                <div class="col-sm-6">
                    <div class="nav-item dropdown align-items-center">
                        <a class="nav-link dropdown-toggle d-flex align-items-center justify-content-end user-info"
                           href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown">
                            <img src="${sessionScope.User.picture}"
                                 class="rounded-circle" height="25">
                            <p class="user-name">${sessionScope.UserDB.userName}</p>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="myprofile.jsp">My profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="MainController?action=Logout">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="detail-devices-wapper d-flex row">
        <div class="col-sm-7 order-first">
            <img class="img-devices" src="${requestScope.URL}" id="main-img">
        </div>
        <div class="row detail-devices col-sm-5 mt-5">
            <div class="divices-name col-sm-12 mt-5">
                <h2>${requestScope.DEVICE_NAME}</h2>
                <br/>
            </div>
            <div class="col-sm-12">
                <p>Warehouse : ${requestScope.WAREHOUSE_NAME}</p>
                <p>Brand Name : ${requestScope.BRAND_NAME}</p>
                <p>Quantity : ${requestScope.QUANTITY}</p>
                <div class="buttons_added">
                    <p>Amount: </p>
                    <input aria-label="quantity" max="100" min="1" name="" type="number" value="1">
                </div>
                </span>
                <div class="col-sm-12 mt-5">
                    <button class="rent-button"><i class="fas fa-shopping-cart"> Add to Card</i></button>
                    <button class="rent-button-1">Rent Now</button>
                </div> 
            </div>
        </div>
        <div class="col-sm-12">
            <h2 class="ml-5 mt-5">PRODUCT DESCRIPTION</h2>
            <div class="ml-5">
                <c:forEach var="detail" items="${requestScope.DETAIL_LIST}" varStatus="counter">
                    <p>${descriptionList[counter.count-1]}: ${detail.value}</p>
                </c:forEach>
            </div>
        </div>
        <div class="col-sm-12">

        </div>
    </div>

    <footer class="footer-distributed">
        <div class="footer-left">
            <h3>Company<span>DRS</span></h3>
            <p class="footer-company-name">Company DRS © 2022</p>
        </div>
        <div class="footer-center">
            <div>
                <i class="fa fa-map-marker"></i>
                <p><span>FPT UNIVERSITY</span> KCN - THU DUC CITY - TP.HCM</p>
            </div>
            <div>
                <i class="fa fa-phone"></i>
                <p>3463452343</p>
            </div>
            <div>
                <i class="fa fa-envelope"></i>
                <p><a href="mailto:admin@gmail.com">admin@gmail.com</a></p>
            </div>
        </div>
        <div class="footer-right">
            <p class="footer-company-about">
                <span>About the company</span>
                The company specializes in providing and leasing IT equipment to businesses and companies in need.
            </p>
            <div class="footer-icons">
                <a href="https://www.facebook.com/"><i class="ti-facebook"></i></a>
                <a href="https://www.twitter.com/"><i class="ti-twitter"></i></a>
                <a href="https://www.instagram.com/"><i class="ti-instagram"></i></a>
                <a href="https://www.github.com/"><i class="ti-github"></i></a>
            </div>
        </div>
    </footer>  
</body>
</html>
