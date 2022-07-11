<%-- 
    Document   : user
    Created on : Jul 11, 2022, 5:24:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>USER</title>
  <link rel="stylesheet" href="css/style.css" />
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap");
  </style>
  <link rel="stylesheet" href="fonts/themify-icons/themify-icons.css" />
  <link rel="icon" href="./img/word-image-1047.jpg" type="image/x-icon" />
  <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />
  <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
  <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
  <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/fonts/fontawesome-free-6.1.1-web/css/all.min.css">

</head>

<body>
  <!-- nabar -->
  <!-- <div class="container"> -->
  <div class="row navbar">
    <!-- logo -->
    <div class="col-sm-4 navbar-user-left d-flex align-items-center">
      <div class="col-sm-5 logo">
        <a href="#"><img src="./img/logo.png" height="80" alt="" /></a>
      </div>
      <!-- product-list -->
      <div class="">
        <div class="nav-item dropdown">
          <a class="nav-link dropdown-toggle d-flex align-items-center justify-content-center user-info" href="#"
            id="navbarDropdownMenuLink" role="button" data-toggle="dropdown">
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
    <!-- cart-icon -->
    <div class="col-sm-4 text-center navbar-user-right d-flex">
      <div class="col-sm-6 cart-shopping">
        <a href="cart.html" class="" role="button">
          <i class="fas fa-shopping-cart text-dark ml-5"></i>
        </a>
      </div>
      <!-- welcome -->
      <div class="col-sm-6">
        <div class="nav-item dropdown align-items-center">
          <a class="nav-link dropdown-toggle d-flex align-items-center user-info" href="#" id="navbarDropdownMenuLink"
            role="button" data-toggle="dropdown">
            <img src="img/anhtai.jpg" class="rounded-circle" height="30" width="30" />
            <p class="user-name">Anh Tai</p>
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li>
              <a class="dropdown-item" href="myprofile.html"><img src="https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/148200636_528659258096027_8966625421411191162_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=dzMdGh7CUt4AX978A2p&_nc_ht=scontent.fsgn5-11.fna&oh=00_AT_T8cl7XJeQ7xnVIt7NSbBeFkMmZy_8FtaihBZKvwhxjw&oe=62BB3767"
                height="25"> My profile</a>
            </li>
            <li>
              <a class="dropdown-item" href="login.html"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- search-button -->
  <div class="row navbar-option col-sm-12 d-flex">
    <div class="col-sm-11">
      <div class="table table-user">
        <table class="col-sm-12" id="myTable">
          <thead>
            <th class="text-center">STT</th>
            <th class="text-center">Request ID</th>
            <th class="text-center">Request Date</th>
            <th class="text-center">Status</th>
            <th class="text-center">Action</th>
          </thead>
          <tbody>
            <tr id="info">
              <td class="text-center">01</td>
              <td class="text-center">SE01</td>
              <td class="text-center">12/02/2022</td>
              <td class="text-center">Active</td>
              <td class="text-center">
                <a href="requetdetail.html">
                  <button class="btn btn-primary" type="button">
                    <i class="fas fa-info-circle text-light"></i>
                  </button>
                </a>
                <a href="#">
                  <button class="btn btn-danger" type="button" onclick="Delete()">
                    <i class="fas fa-times-circle"></i>
                  </button>
                </a>
              </td>
            </tr>
            
          </tbody>
        </table>
      </div>
    </div>
    <div class="navbar-col col-sm-1 order-first">
      <ul class="float-left">
        <li>
        </li>
        
        <li>
          <a href=""><span class="indicator"></span><i class="fas-option active fas fa-sync-alt"><span
                class="navbaroption-tittle">Processing</span></i></a>
        </li>
        <li>
          <a href="userapproved.html"><i class="fas-option fas fa-check-circle"><span
                class="navbaroption-tittle">Approved</span></i></a>
        </li>
        <li>
          <a href="usersuccessful.html"><i class="fas-option fas fa-undo-alt"><span
                class="navbaroption-tittle">Successful</span></i></a>
        </li>
        <li>
          <a href="userreturned.html"><i class="fas-option fas fa-sync-alt"><span
                class="navbaroption-tittle">Returned</span></i></a>
        </li>
        <li class="option-user-3">
          <a href="usercancel.html"><i class="fas-option fas fa-ban"><span
                class="navbaroption-tittle">Cancel</span></i></a>
        </li>
      </ul>
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
        <p><span>Đại học FPT</span> KCN - TP.Thủ Đức - TP.HCM</p>
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
        The company specializes in providing and leasing IT equipment to
        businesses and companies in need.
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

<script>
  function Delete() {
    $("#info").remove();
  }
</script>

</html>
