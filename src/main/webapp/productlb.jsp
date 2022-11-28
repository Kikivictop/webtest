<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



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
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/plugins/plugins.css">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->
    <!--
    <script src="assets/js/vendor/vendor.min.js"></script>
    <script src="assets/js/plugins/plugins.min.js"></script>
    -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!--<link rel="stylesheet" href="assets/css/style.min.css">-->

    <style type="text/css">
        .active{
            background:orangered !important;
            color:white !important;
        }
    </style>

</head>

<body>


<!-- Start Header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- End Hamburger -->
<!-- Start Breadumb Area -->
<div class="breadcumb-area ptb--100 ptb_md--100 ptb_sm--100  bg_image bg_image--3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="inner text-center">
                    <h2 class="font--40 mb--0">商品列表</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadumb Area -->
<div class="main-wrapper">

    <!-- Start Shop Area -->
    <div class="shop-area bg-color ptb--120 ptb_md--80 ptb_sm--80" data-bg-color="#ffffff" style="padding-top: 20px;">
        <div class="container">
            <div class="row">
                <div class="order-2 order-lg-1 col-lg-4 mt_md--60 mt_sm--60">
                    <!-- Start Sidebar Area -->
                    <div class="shop-sidebar-container">
                        <div class="shop-sidebar-wrapper">
                            <!-- Start Single Widget -->
                            <div class="shop-sidebar search">
                                <h5 class="widget-title">搜索</h5>
                                <form class="inner" action="productLb" method="post">
                                    <div class="search-box">
                                        <input type="text" name="key" value="${key}" placeholder="商品名称…">
                                        <button><span class="fa fa-search"></span></button>
                                    </div>
                                </form>
                            </div>
                            <!-- End Single Widget -->

                            <!-- Start Single Widget -->
                            <div class="shop-sidebar related-product-inner mt--50">
                                <h5 class="widget-title">热销商品</h5>
                                <ul class="related-product">
                                    <!-- Start Single Product -->
                                    <c:forEach items="${phlist}" var="phproduct" begin="0" end="3">
                                    <li>
                                        <div class="product-item">
                                            <div class="thumbnail">
                                                <a href="productDetails?id=${phproduct.product.id}">
                                                    <img src="upfile/${phproduct.product.filename}" alt="multi-purpose">
                                                </a>
                                            </div>
                                            <div class="info">
                                                <h5 class="heading heading-h5"><a href="productDetails?id=${phproduct.product.id}">${phproduct.product.productname}</a></h5>
                                                <ul class="rating">
                                                </ul>
                                                <div class="price">
                                                            <span class="prize" style="font-weight:bolder;color:red">￥${phproduct.product.price}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->
                                </ul>
                            </div>
                            <!-- End Single Widget -->

                            <!-- Start Single Widget -->

                            <!-- End Single Widget -->


                            <!-- Start Single Widget -->
                            <!-- End Single Widget -->

                            <!-- End Single Widget -->
                            <!-- Start Single Widget -->
                            <!-- End Single Widget -->



                        </div>
                    </div>
                    <!-- End Sidebar Area -->
                </div>
                <div class="order-1 order-lg-2 col-lg-8">

                    <div class="content-search margin-bottom-20" >
                        <div class="row paihan" style="border:0px solid red;">
                            <div class="col-md-12" style="border:0px solid red;text-align: right">
                                <a href="productLb?biaoji=maxjg&fid=${fid}&sid=${sid}"><span class="layui-badge-rim ${biaoji eq 'maxjg'?'active':''}">价格高</span></a>
                                <a  href="productLb?biaoji=mixjg&fid=${fid}&sid=${sid}"><span class="layui-badge-rim ${biaoji eq 'mixjg'?'active':''}">价格低</span></a>
                                <a href="productLb?biaoji=salenum&fid=${fid}&sid=${sid}"><span class="layui-badge-rim ${biaoji eq 'salenum'?'active':''}">销量</span></a>
                                <a href="productLb?biaoji=favnum&fid=${fid}&sid=${sid}"><span class="layui-badge-rim ${biaoji eq 'favnum'?'active':''}">收藏</span></a>
                                <a href="productLb?biaoji=news&fid=${fid}&sid=${sid}"><span class="layui-badge-rim ${biaoji eq 'news'?'active':''}">新品</span></a>
                            </div>
                        </div>
                    </div>
                    <!-- Start Shop Minimal Product -->
                    <div class="shop-minimal-product">
                        <div class="row row--25">

                            <!-- Start Single Product -->
                            <c:forEach items="${pageInfo.list}" var="product">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12 mt--60" style="margin-top: 0px !important;">
                                <div class="product">
                                    <div class="inner">
                                        <div class="thumbnail">
                                            <a href="productDetails?id=${product.id}">
                                                <img src="upfile/${product.filename}" alt="Product Images">
                                            </a>
                                        </div>
                                        <div class="product-hover-action">
                                            <div class="hover-inner">
                                                <a href="javascript:void(0)" onclick="addCart('${product.id}',1)"><i class="fa fa-cart-plus"></i></a>
                                                <a href="javascript:void(0)" onclick="favAdd('${product.id}')"><i class="fa fa-heart-o"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <h2><a href="productDetails?id=${product.id}">${product.productname}</a></h2>
                                                <span class="prize" style="font-weight:bolder">${product.price}</span>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <!-- End Single Product -->

                            <!-- Start Single Product -->
                            <!-- End Single Product -->

                            <!-- Start Single Product -->
                            <!-- End Single Product -->

                            <!-- Start Pagenation Area -->
                            <div class="col-lg-12">
                                当前 <span>${pageInfo.pageNum}</span> 页,总 <span>${pageInfo.pages}</span> 页,共 <span>${pageInfo.total}</span> 条记录
                                <a href="productLb?pageNum=1&key=${key}&fid=${fid}&sid=${sid}&biaoji=${biaoji}">首页</a>
                                <a href="productLb?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}&fid=${fid}&sid=${sid}&biaoji=${biaoji}">上一页</a>
                                <a href="productLb?pageNum=${pageInfo.hasNextPage==false?pageInfo.pages:pageInfo.nextPage}&key=${key}&fid=${fid}&sid=${sid}&biaoji=${biaoji}">下一页</a>
                                <a href="productLb?pageNum=${pageInfo.pages}&key=${key}&fid=${fid}&sid=${sid}&biaoji=${biaoji}">尾页</a>
                            </div>
                            <!-- End Pagenation Area -->

                        </div>
                    </div>
                    <!-- End Shop Minimal Product -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Area -->
</div>

<!-- Quick View Modal -->

<!--// Quick View Modal -->
<!-- Start Footer Area -->
<jsp:include page="foot.jsp"></jsp:include>
<!-- End Footer Area -->















<!-- JS
============================================ -->
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
    function addCart(productid,num){
        layer.load(0, {shade: false});
        $.ajax({
            url:'addCart?productid='+productid+"&num="+num,
            date:'',
            type:'post',
            success:function(msg){
                if(msg==0){
                    location.replace("login.jsp")
                }else if(msg==1){
                    layer.msg('已成功添加到购物车',{
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }else{
                    layer.msg('操作成功', {
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }
            }
        })
    }


    function priceSearch(){
        var minprice = $("#minprice").val();
        var maxprice = $("#maxprice").val();

        var fid = $("#fid").val();
        var sid = $("#sid").val();
        location.replace('productLb?minprice='+minprice+"&maxprice="+maxprice+"&fid="+fid+"&sid="+sid);
    }



    function favAdd(productid){
        layer.load(0, {shade: false});
        $.ajax({
            url:'favAdd?productid='+productid,
            date:'',
            type:'post',
            success:function(msg) {
                if (msg == 0) {
                    location.replace("login.jsp")
                } else if(msg == 1){
                    layer.msg('已添加至收藏', {
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }else{
                    layer.msg('不能重复操作', {
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }
            }
        })
    }


</script>
<!-- Modernizer JS -->
<script src="assets/js/vendor/modernizr.min.js"></script>
<!-- jQuery JS -->
<script src="assets/js/vendor/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<script src="assets/js/plugins/plugins.js"></script>
<!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
<!--
<script src="assets/js/vendor/vendor.min.js"></script>
<script src="assets/js/plugins/plugins.min.js"></script>
-->

<!-- Main JS -->
<script src="assets/js/main.js"></script>

</body>
</html>

