<%-- 
    Document   : createDevice
    Created on : Jun 12, 2022, 11:13:47 AM
    Author     : duong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
        </style>
        <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
              integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    </head>

    <body>
        <c:set var="categoryList" value="${sessionScope.LIST_CATEGORY}"/>
        <c:set var="warehouseList" value="${sessionScope.LIST_WAREHOUSE}"/>
        <c:set var="deviceError" value="${requestScope.DEVICE_ERROR}"/>

        <div class="navbar-top">
            <div class="navbar-header">
                <!-- logo -->
                <div class="col-sm-3 logo">
                    <a href="#"><img src="./img/logo.png" height="80" alt=""></a>
                </div>
                <!-- name web -->
                <div class="col-sm-6 d-flex align-items-center justify-content-center text-center name-website">
                    <a href="#">DRS - FPT University HCM</a>
                </div>
                <!-- welcome -->
                <div class="col-sm-3 welcome d-flex align-items-center justify-content-end">
                    <div class="nav-item dropdown ">
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
        <div class="manage-navbar">
            <a href="MainController?search=&action=SearchDevice">
                <button class="btn btn-primary" name="action" type="submit" value="SearchDevice">
                    Manage Devices
                </button>
            </a>
            <a href="warehousemanager.html">
                <button class="btn btn-secondary">
                    Manage Warehouse
                </button>
            </a>
            <a href="insertcatagory.html">
                <button class="btn btn-secondary">
                    Manage Category
                </button>
            </a>
        </div>
        <div class="row manager-function d-flex align-items-center">
            <div class="col-sm-6 left-function text-center">
                <button type="button" class="btn">
                    <!-- <i class="fas fa-plus-circle"></i>
                    <label for="">insert new Device</label> -->
                    <div class="nav-item  d-flex align-items-center insert-wapper">
                        <a class="nav-link d-flex align-items-center" href="#"
                           role="button">
                            <label class="button-insert">Insert New Device</label>
                        </a>
                    </div>
                </button>
                <button type="button" class="btn">
                    <!-- <i class="fas fa-plus-circle"></i>
                    <label for="">insert new Device</label> -->
                    <div class="nav-item dropdown d-flex align-items-center">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdownMenuLink"
                           role="button" data-toggle="dropdown">
                            <input type="submit" value="Ram">
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="#">Ram</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">CPU</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">VGA</a>
                            </li>
                        </ul>
                    </div>
                </button>
                <button type="button" class="btn">
                    <label for="">Filter</label>
                </button>
            </div>
            <div class="col-sm-6 right-function">
                <div class="search">
                    <form action="" id="search-box">
                        <div class="row search-box-wrapper">
                            <input type="text" id="search-text" class="col-8" placeholder="Tìm">
                            <button id="search-btn" class="col-2"><i class="fas fa-search "></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row container-fluid">
            <div class="tittle-add-devices col-sm-12 text-center mt-2 mb-2">
                <h2>Insert New Devices</h2>
            </div>
            <div class="col-sm-12">
                <form action="MainController" method="POST">
                    <div class="col-sm-12 text-center mt-3 ml-5 mb-3">
                        <label for="#" class="col-sm-2">
                            <h4>Device name</h4>
                        </label>
                        <input type="text" name="deviceName" class="col-sm-4" name="" id="input-device" required="" placeholder="Input Devices Name"/> </br>
                    </div>
                    <div class="col-sm-12 text-center ml-5 mb-3">
                        <label for="#" class="col-sm-2">
                            <h4>Category name</h4>
                        </label>

                        <select name="cateID" class="col-sm-4 pt-1 pb-1"  id="list-chose">
                            <option selected disabled>Choose Category</option>
                            <c:forEach var="category" items="${categoryList}">
                                <option value="${category.key}">${category.value}</option>
                            </c:forEach>
                        </select> 
                    </div>
                    <div class="col-sm-12 text-center ml-5 mb-5">
                        <label for="#" class="col-sm-2">
                            <h4>Warehouse name</h4>
                        </label>
                        <select name="warehouseName" class="col-sm-4 pt-1 pb-1"  id="list-chose">
                            <option selected disabled>Choose Warehouse</option>
                            <c:forEach var="warehouse" items="${warehouseList}">
                                <option value="${warehouse.value}">${warehouse.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <c:if test="${deviceError.getDeviceNameError() != null}">
                        <div class="alert alert-warning" role="alert">
                            <strong>ERROR!</strong> ${deviceError.getDeviceNameError()}
                            <button type="button" class="close" data-dismiss="alert"> 
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <c:if test="${deviceError.getCateIDError() != null}">
                        <div class="alert alert-warning" role="alert">
                            <strong>ERROR!</strong> ${deviceError.getCateIDError()}
                            <button type="button" class="close" data-dismiss="alert"> 
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <c:if test="${deviceError.getWarehouseIDError() != null}">
                        <div class="alert alert-warning" role="alert">
                            <strong>ERROR!</strong> ${deviceError.getWarehouseIDError()}
                            <button type="button" class="close" data-dismiss="alert"> 
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <div class="col-sm-12 d-flex justify-content-center">
                        <a  class="col-sm-5">
                            <button type="submit" name="action" value="InputDeviceInfo" class="btn btn-primary col-sm-4">Next</button>
                        </a>
                    </div>

                </form>


            </div>
        </div>
    </div>
</body>
<footer></footer>
<script>
    $(document).ready(function () {
        $("#fa-info-circle").click(function () {
            $("#detailModal").modal("show");
        });
    });

</script>

</html>
