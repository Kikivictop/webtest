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
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/plugins/plugins.css">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->
    <!--
    <script src="assets/js/vendor/vendor.min.js"></script>
    <script src="assets/js/plugins/plugins.min.js"></script>
    -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="css/page.css" />
    <!--<link rel="stylesheet" href="assets/css/style.min.css">-->
    <style>
        .notice{
            list-style:none;
            padding: 20px;
        }

        .notice li{
            border-bottom:1px dashed #EEEEEE;
            margin-bottom: 20px;
        }
        .notice li div:first-child{
            margin-bottom: 5px;
            font-size: 16px;
            font-weight: 600;
        }
        .notice li div:last-child{
            color:gray;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>

<body>

<!-- Start Header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Start Header -->

<!-- Start Search Flyover -->

<!-- End Hamburger -->
<!-- 轮播图-->
<div class="layui-carousel" id="test10">
    <div carousel-item="">
        <c:forEach items="${imgadvlist}" var="img" begin="0" end="5">
            <div><img src="upfile/${img.filename}" style="width: 100%"></div>
        </c:forEach>
    </div>
</div>
<!-- 轮播图-->
<!-- Start Breadumb Area -->

<!-- End Breadumb Area -->
<div class="main-wrapper">
    <!-- Start Contact Form -->
    <div class="feature-product-area bg-color pt--90 pt_md--80 pt_sm--80 pb--100 pb_md--80 pb_sm--80" data-bg-color="#fff">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center">
                        <h2 class="title">推荐商品</h2>
                        <img src="assets/images/logo/shape.png" alt="Shape Images">
                    </div>
                </div>
            </div>
            <div class="row mt--20">

                <!-- Start Single Product -->
                <c:forEach items="${tjproductlist}" var="tjproduct">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 mt--30">
                        <div class="product">
                            <div class="inner">
                                <div class="thumbnail">
                                    <a href="productDetails?id=${tjproduct.id}">
                                        <img src="upfile/${tjproduct.filename}" alt="Product Images">
                                    </a>
                                </div>
                                <div class="product-hover-action">
                                    <div class="hover-inner">
                                        <a href="javascript:void(0)" onclick="addCart('${tjproduct.id}',1)"><i class="fa fa-cart-plus"></i></a>
                                        <a href="javascript:void(0)" onclick="favAdd('${tjproduct.id}')"><i class="fa fa-heart-o"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="content">
                                <h2><a href="productDetails?id=${tjproduct.id}">${tjproduct.productname}</a></h2>
                                        <span class="prize" style="font-weight:bolder">￥${tjproduct.price}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- End Single Product -->

                <!-- Start Single Product -->

                <!-- End Single Product -->

                <!-- Start Single Product -->

                <!-- End Single Product -->

                <!-- Start Single Product -->

                <!-- End Single Product -->

            </div>
        </div>
    </div>
    <!-- End Contact Form -->

</div>

<!-- Quick View Modal -->
<!--// Quick View Modal -->
<!-- Start Footer Area -->
<jsp:include page="foot.jsp"></jsp:include>
<!-- End Footer Area -->















<!-- JS
============================================ -->

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
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
        });

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            ,interval: 1800
            ,anim: 'fade'
            ,height: '120px'
        });

        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '100%'
            ,height: '540px'
            ,interval: 5000
        });

        //事件
        carousel.on('change(test4)', function(res){
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });



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
</script>

</body>

</html>



