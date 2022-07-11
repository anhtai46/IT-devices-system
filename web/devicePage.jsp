<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Devices</title>
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
    </head>

    <body>
        <c:set var="search" value="${requestScope.SEARCH_USER}"/>
        <c:set var="deviceList" value="${requestScope.LIST_DEVICE}"/>
        <c:set var="brandList" value="${requestScope.LIST_BRAND}"/>
        <c:set var="categoryList" value="${requestScope.LIST_CATEGORY}"/>
        <c:set var="descriptionList" value="${requestScope.LIST_DESCRIPTION}"/>
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
                        <i class="fas fa-shopping-cart text-dark ml-5 "></i>
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
                                <a class="dropdown-item" href="myprofile.html">My profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="login.html">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- search-button -->
        <div class="row navbar-option col-sm-12 justify-content-center">
            <div class="container mt-2 mb-3">
                <a href="#" id="chosefilter">
                    <button class="btn insertnew btn-color" type="button">
                        <i class="filer-icon fa fa-filter"></i>
                        <label class="button-insert">Filter</label>
                    </button>
                </a>
                <div id="FilterModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg" role="content">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Chose Filter</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-row">
                                        <div class="row modal-body col-12">
                                            <div class="row">
                                                <h4 class="modal-title col-sm-12 ml-4">Chose: </h4>
                                                <div class="ml-5 row">
                                                    <label class="brand-1" id="chose-brand-1" for="brand-select1"> Lenovo<i class="fa fa-times"></i></label>
                                                    <label class="brand-2" id="chose-brand-2" for="brand-select2"> Apple <i class="fa fa-times"></i></label>
                                                    <label class="brand-3" id="chose-brand-3" for="brand-select3"> Asus <i class="fa fa-times"></i></label>
                                                    <label class="brand-4" id="chose-brand-4" for="brand-select4"> Dell <i class="fa fa-times"></i></label>
                                                    <label class="ram-1" id="chose-ram-1" for="ram-select1">4GB <i class="fa fa-times"></i></label>
                                                    <label class="ram-2" id="chose-ram-2" for="ram-select2">8GB <i class="fa fa-times"></i></label>
                                                    <label class="ram-3" id="chose-ram-3" for="ram-select3">16GB <i class="fa fa-times"></i></label>
                                                    <label class="ram-4" id="chose-ram-4" for="ram-select4">32GB <i class="fa fa-times"></i></label>
                                                    <label class="chip-1" id="chose-chip-1" for="chip-select1">I3 <i class="fa fa-times"></i></label>
                                                    <label class="chip-2" id="chose-chip-2" for="chip-select2">I5 <i class="fa fa-times"></i></label>
                                                    <label class="chip-3" id="chose-chip-3" for="chip-select3">I7 <i class="fa fa-times"></i></label>
                                                    <label class="chip-4" id="chose-chip-4" for="chip-select4">I9 <i class="fa fa-times"></i></label>
                                                    <label class="chip-5" id="chose-chip-5" for="chip-select5">M1 <i class="fa fa-times"></i></label>
                                                </div>
                                            </div>

                                            <div class="row col-sm-12">

                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <h4>Brand</h4>
                                            <div class="col-12 ">
                                                <input onclick="Show()" type="checkbox" class="brand-select1" id="brand-select1">
                                                <label class="brand-1" for="brand-select1"> Lenovo</label>

                                                <input onclick="Show1()" type="checkbox" class="brand-select2" id="brand-select2">
                                                <label class="brand-2" for="brand-select2"> Apple</label>

                                                <input onclick="Show2()" type="checkbox" class="brand-select3" id="brand-select3">
                                                <label class="brand-3" for="brand-select3"> Asus</label>

                                                <input onclick="Show3()" type="checkbox" class="brand-select4" id="brand-select4">
                                                <label class="brand-4" for="brand-select4"> Dell</label>

                                            </div>
                                        </div>
                                        <div class="col-12 d-flex mt-3">
                                            <h4 class="col-4">Ram</h4>
                                            <h4 class="col-4">Chip</h4>
                                            <h4 class="col-4">Display</h4>
                                        </div>
                                        <div class="col-12 d-flex">
                                            <div class="col-4">
                                                <input onclick="Showram()" type="checkbox" class="ram-select1" id="ram-select1">
                                                <label class="ram-1" for="ram-select1">4GB</label>

                                                <input onclick="Showram1()" type="checkbox" class="ram-select2" id="ram-select2">
                                                <label class="ram-2" for="ram-select2">8GB</label>

                                                <input onclick="Showram2()" type="checkbox" class="ram-select3" id="ram-select3">
                                                <label class="ram-3" for="ram-select3">16GB</label>

                                                <input onclick="Showram3()" type="checkbox" class="ram-select4" id="ram-select4">
                                                <label class="ram-4" for="ram-select4">32GB</label>
                                            </div>
                                            <div class="col-4">
                                                <input onclick="Showchip()" type="checkbox" class="chip-select1" id="chip-select1">
                                                <label class="chip-1" for="chip-select1">I3</label>

                                                <input onclick="Showchip1()" type="checkbox" class="chip-select2" id="chip-select2">
                                                <label class="chip-2" for="chip-select2">I5</label>

                                                <input onclick="Showchip2()" type="checkbox" class="chip-select3" id="chip-select3">
                                                <label class="chip-3" for="chip-select3">I7</label>

                                                <input onclick="Showchip3()" type="checkbox" class="chip-select4" id="chip-select4">
                                                <label class="chip-4" for="chip-select4">I9</label>

                                                <input onclick="Showchip4()" type="checkbox" class="chip-select5" id="chip-select5">
                                                <label class="chip-5" for="chip-select5">M1</label>
                                            </div>
                                            <div class="col-4">

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 d-flex">
                                        <div class="col-6 mt-3">
                                            <button class="btn-filter btn btn-danger">Cancel</button>
                                        </div>
                                        <div class="col-6 mt-3">
                                            <button class="btn-filter btn btn-color">Search</button>
                                        </div>
                                    </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="table">
                <table class="col-sm-12">
                    <thead>
                    <th class="text-center">#</th>
                    <th class="text-center">Device ID</th>
                    <th class="text-center">Image</th>
                    <th class="text-center">Device Name</th>
                    <th class="text-center">Warehouse</th>
                    <th class="text-center">Brand</th>
                    <th class="text-center">Quantity</th>
                    <th class="text-center">Detail</th>
                    <th class="text-center">Action</th>
                    </thead>
                    <tbody>
                        <c:forEach var="device" items="${deviceList}" varStatus="counter">
                            <tr>
                                <td class="text-center">${counter.count}</td>
                                <td class="text-center">${device.deviceID}</td>
                                <td class="text-center"><img class="img-product" src="${device.url}" alt="no import image"/></td>
                                <td class="text-center">${device.deviceName}</td>
                                <td class="text-center">${device.warehouseName}</td>
                                <td class="text-center">${device.brandName}</td>
                                <td class="text-center">${device.quantity}</td>
                                <td class="text-center"><a href="MainController?action=Detail&deviceID=${device.deviceID}&deviceName=${device.deviceName}&url=${device.url}&warehouseName=${device.warehouseName}&brandName=${device.brandName}&quantity=${device.quantity}">Detail</a></td>
                                <td class="text-center"><button type="submit">Borrow</button></td>
                            </tr>
                        </c:forEach>    
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <footer></footer>
    <script>
        $(document).ready(function () {
            $("#chosefilter").click(function () {
                $("#FilterModal").modal("show");
            });
        });

        function Show() {
            if (document.getElementById('chose-brand-1').style.display === "block") {
                document.getElementById('chose-brand-1').style.display = "none";
            } else {
                document.getElementById('chose-brand-1').style.display = "block"
            }
        }
        function Show1() {
            if (document.getElementById('chose-brand-2').style.display === "block") {
                document.getElementById('chose-brand-2').style.display = "none";
            } else {
                document.getElementById('chose-brand-2').style.display = "block"
            }
        }
        function Show2() {
            if (document.getElementById('chose-brand-3').style.display === "block") {
                document.getElementById('chose-brand-3').style.display = "none";
            } else {
                document.getElementById('chose-brand-3').style.display = "block"
            }
        }
        function Show3() {
            if (document.getElementById('chose-brand-4').style.display === "block") {
                document.getElementById('chose-brand-4').style.display = "none";
            } else {
                document.getElementById('chose-brand-4').style.display = "block"
            }
        }
        function Showram() {
            if (document.getElementById('chose-ram-1').style.display === "block") {
                document.getElementById('chose-ram-1').style.display = "none";
            } else {
                document.getElementById('chose-ram-1').style.display = "block"
            }
        }
        function Showram1() {
            if (document.getElementById('chose-ram-2').style.display === "block") {
                document.getElementById('chose-ram-2').style.display = "none";
            } else {
                document.getElementById('chose-ram-2').style.display = "block"
            }
        }
        function Showram2() {
            if (document.getElementById('chose-ram-3').style.display === "block") {
                document.getElementById('chose-ram-3').style.display = "none";
            } else {
                document.getElementById('chose-ram-3').style.display = "block"
            }
        }
        function Showram3() {
            if (document.getElementById('chose-ram-4').style.display === "block") {
                document.getElementById('chose-ram-4').style.display = "none";
            } else {
                document.getElementById('chose-ram-4').style.display = "block"
            }
        }
        function Showchip() {
            if (document.getElementById('chose-chip-1').style.display === "block") {
                document.getElementById('chose-chip-1').style.display = "none";
            } else {
                document.getElementById('chose-chip-1').style.display = "block"
            }
        }
        function Showchip1() {
            if (document.getElementById('chose-chip-2').style.display === "block") {
                document.getElementById('chose-chip-2').style.display = "none";
            } else {
                document.getElementById('chose-chip-2').style.display = "block"
            }
        }
        function Showchip2() {
            if (document.getElementById('chose-chip-3').style.display === "block") {
                document.getElementById('chose-chip-3').style.display = "none";
            } else {
                document.getElementById('chose-chip-3').style.display = "block"
            }
        }
        function Showchip3() {
            if (document.getElementById('chose-chip-4').style.display === "block") {
                document.getElementById('chose-chip-4').style.display = "none";
            } else {
                document.getElementById('chose-chip-4').style.display = "block"
            }
        }
        function Showchip4() {
            if (document.getElementById('chose-chip-5').style.display === "block") {
                document.getElementById('chose-chip-5').style.display = "none";
            } else {
                document.getElementById('chose-chip-5').style.display = "block"
            }
        }
    </script>
</body>
</html>
