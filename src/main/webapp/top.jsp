<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>网上蔬菜订购系统</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->


    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->


</head>

<body>
<!-- Start Header -->
<header class="header-area haeder-default header--transparent black-logo-version ptb_lg--40 ptb_md--40 ptb_sm--30">
    <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-6" style="border:0px solid red;max-width: 100%;">
        <div style="padding-right: 20px;letter-spacing: 1px;border:0px solid orange;text-align: right;">
            <c:choose>
                <c:when test="${sessionScope.sessionmember ne null}">
                    欢迎你!&nbsp;&nbsp;${sessionScope.sessionmember.uname}
                    <a  href="cartList">购物车</a>
                    <a  href="dingdanLb">订单信息</a>
                    <a  href="addressLb">收货地址</a>
                    <a  href="favLb">收藏</a>
                    <a  href="accountMsg">个人信息</a>

                    <a  href="memberExit">
                        退出
                    </a>
                </c:when>
                <c:otherwise>
                    <a  href="login">
                        登录/注册
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="header-wrapper container">
        <div class="row align-items-center">
            <!-- Start Header Left -->
            <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-6">
                <div class="logo" style="border: 0px solid red;">
                    <a href="index" style="color: black;letter-spacing: 5px;font-weight: bolder;font-family: Arial;font-size: 20px;-webkit-font-smoothing: antialiased;">
                        <!--
                        <img src="assets/images/logo/logo-black.png" alt="Draven logo">
                        -->
                        网上蔬菜订购系统
                    </a>
                </div>
            </div>
            <!-- Start Header Center -->
            <div class="col-xl-12 d-none d-xl-block">
                <nav class="mainmenu__nav">
                    <!-- Start Mainmanu Nav -->
                    <ul class="primary-menu megamenu-wrapper">
                        <li><a href="index">首页</a></li>
                        <li><a href="aboutDetails">关于我们</a></li>
                        <li><a href="newsLb">站内资讯</a></li>
                        <c:forEach items="${sessionScope.fcategorylist}" var="fcategory">
                            <li class="lavel-1"><a href="productLb?fid=${fcategory.id}">${fcategory.name}</a>
                                <ul class="dropdown__menu">
                                    <c:forEach items="${fcategory.childlist}" var="scategory">
                                        <li><a href="productLb?fid=${fcategory.id}&sid=${scategory.id}"><span>${scategory.name}</span></a></li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                        <li><a href="msgLb">在线留言</a></li>

                    </ul>
                    <!-- End Mainmanu Nav -->
                </nav>
            </div>
            <!-- Start Header Right -->
            <c:if test="${sessionScope.sessionmember ne null}">
            <div class="col-xl-1 col-lg-6 col-md-6 col-sm-6 col-6">
                <div class="header-icon d-flex justify-content-end cart text-right">
                    <a class="cart-trigger" href="#">
                        <i class="fa fa-shopping-cart"></i>
                        <span class="cart-count">${fn:length(sessioncartlist)}</span>
                    </a>
                    <a class="hamburger-trigger d-block d-xl-none pl--15" href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
            </div>
            </c:if>

        </div>
    </div>
</header>
<!-- Start Header -->
<!-- Start Search Flyover -->
<!--// Quick View Modal -->
<!-- Start Footer Area -->


</body>

</html>

