<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:set var="deviceName" value="${sessionScope.DEVICE_NAME}"/>
        <c:set var="cateName" value="${sessionScope.CATE_NAME}"/>
        <c:set var="warehouseName" value="${sessionScope.WAREHOUSE_NAME}"/>
        <c:set var="descriptionList" value="${sessionScope.DESCRIPTION_LIST}"/>
        <c:set var="brandList" value="${sessionScope.BRAND_LIST}"/>
        <c:set var="deviceError" value="${requestScope.DEVICE_ERROR}"/>
        <c:set var="detailError" value="${requestScope.DETAIL_ERROR}"/>

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
            <button class="btn btn-secondary">
                <a href="warehousemanager.html">Manage Warehouse</a>
            </button>
        </div>
        <div class="row manager-function d-flex align-items-center">
            <div class="col-sm-6 left-function text-center">
                <button type="button" class="btn">
                    <!-- <i class="fas fa-plus-circle"></i>
                    <label for="">insert new Device</label> -->
                    <div class="nav-item dropdown d-flex align-items-center insert-wapper">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdownMenuLink"
                           role="button" data-toggle="dropdown">
                            <label class="button-insert">Insert New Device</label>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="#">Device</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="insertcatagory.html">Category</a>
                            </li>
                        </ul>
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
                <!-- <button type="button" class="btn">
                    <label for="">Category</label>
                    <i class="fas fa-arrow-down"></i>
                </button>-->
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
        <div class="row">
            <div class="tittle-add-devices col-sm-12 text-center mt-2 mb-2">
                <h2>Insert Device Information</h2>
            </div>
            <div class="col-sm-12">
                <form action="CreateDeviceController" method="POST" enctype="multipart/form-data">
                    <div class="choose-manager-tittle col-sm-12 text-center mt-3 ml-5 mb-3">
                        <label for="#" class="col-sm-2">
                            <h4>Device name</h4>
                        </label>
                        <input type="text" name="deviceName"  value="${deviceName}" class="col-sm-4"/>
                    </div>
                    <div class="choose-manager-tittle col-sm-12 text-center ml-5 mb-3">
                        <label for="#" class="col-sm-2">
                            <h4>Category name</h4>
                        </label>
                        <input type="text" name="cateName"  value="${cateName}" class="col-sm-4" readonly>
                    </div>
                    <div class="choose-manager-tittle col-sm-12 text-center mt-3 ml-5 mb-3">
                        <label for="#" class="col-sm-2">
                            <h4>Warehouse name</h4>
                        </label>
                        <input type="text" name="warehouseName" value="${warehouseName}" class="col-sm-4" readonly>
                    </div>
                    <div class="choose-manager-tittle col-sm-12 text-center mt-3 ml-5 mb-3">
                        <label for="#" class="col-sm-2">
                            <h4>Brand Name</h4>
                        </label>
                        <c:set var="detailID" value="detailID"/>
                        <select name="brandID" class="col-sm-4 pt-1 pb-1"  id="list-chose">
                            <option selected disabled>Choose Brand</option>
                            <c:forEach var="brand" items="${brandList}">
                                <option value="${brand.key}">${brand.value}</option>
                            </c:forEach>
                        </select> </br>               
                    </div>
                    <div class="choose-manager-tittle col-sm-12 text-center mt-3 ml-5 mb-3">
                        <label for="#" class="col-sm-2">
                            <h4>Quantity</h4>
                        </label>
                        <input type="number" name="quantity" required="" placeholder="Input Quantity" id="input-device" class="col-sm-4"/>
                    </div>
                    <c:forEach var="description" items="${descriptionList}" varStatus="counter" >
                        <div class="choose-manager-tittle col-sm-12 text-center mt-3 ml-5 mb-3">
                            <label for="#" class="col-sm-2">
                                <h4>${description.descriptionName}</h4>
                            </label>
                            <c:set var="detailID" value='${detailID}${counter.count}'/>
                            <select name="${detailID}" class="col-sm-4 pt-1 pb-1"  id="list-chose">   
                                <option selected disabled>Choose ${description.descriptionName}</option>
                                <c:forEach var="detail" items="${sessionScope[description.descriptionName]}">
                                    <option value="${detail.getDetailID()}">${detail.getDetailName()}</option>
                                </c:forEach>
                            </select> </br>
                            <c:set var="detailID" value='detailID'/>
                        </div>
                    </c:forEach>
                    <div class="choose-manager-tittle col-sm-12 text-center mt-3 ml-5 mb-5">
                        <label for="#" class="col-sm-2">
                            <h4>Choose File</h4>
                        </label>
                        <img class="product-img-thumb" id="img-thumb" height="100px" width="100px" src="" alt="" >
                        <input type="file"  name="image" required="" onchange="readURL(this);">
                    </div>
                    <c:if test="${deviceError.getQuantityError() != null}">
                        <div class="alert alert-warning" role="alert">
                            <strong>ERROR!</strong> ${deviceError.getQuantityError()}
                            <button type="button" class="close" data-dismiss="alert"> 
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <c:if test="${detailError.getDetailNameError() != null}">
                        <div class="alert alert-warning" role="alert">
                            <strong>ERROR!</strong> ${detailError.getDetailNameError()}
                            <button type="button" class="close" data-dismiss="alert"> 
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <div class="col-sm-12 d-flex justify-content-center">
                        <a href="" class="col-sm-5">
                            <button type="submit" name="action" value="CreateDevice" class="btn btn-primary col-sm-4">Insert</button>
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
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('img-thumb').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

</html>