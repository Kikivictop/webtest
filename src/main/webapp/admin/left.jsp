
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理系统</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body class='contrast-red '>

    <nav class='' id='main-nav'>
        <div class='navigation'>
            <div class='search'>
                <form accept-charset="UTF-8" action="search_results.html" method="get" /><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
                <div class='search-wrapper'>
                    <input autocomplete="off" class="search-query" id="q" name="q" placeholder="Search..." type="text" value="" />
                    <button class="btn btn-link icon-search" name="button" type="submit"></button>
                </div>
                </form>
            </div>
            <ul class='nav nav-stacked'>
                <li class='active'>
                    <a href='index'>
                        <i class='icon-home'></i>
                        <span>首页</span>
                    </a>
                </li>
                <li>
                    <a class='dropdown-collapse in' href='#'>
                        <i class='icon-cog'></i>
                        <span>系统设置</span>
                        <i class='icon-angle-down angle-down'></i>
                    </a>
                    <ul class='nav nav-stacked in'>
                        <li class=''>
                            <a href='imgadvList'>
                                <i class='icon-caret-right'></i>
                                <span>滚动图片</span>
                            </a>
                        </li>
                        <li class=''>
                            <a href='aboutShow'>
                                <i class='icon-caret-right'></i>
                                <span>关于我们</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class=''>
                    <a class='dropdown-collapse in' href='#'>
                        <i class='icon-th'></i>
                        <span>业务管理</span>
                        <i class='icon-angle-down angle-down'></i>
                    </a>
                    <ul class='nav nav-stacked in'>
                        <li class=''>
                            <a href='newsList'>
                                <i class='icon-caret-right'></i>
                                <span>资讯信息</span>
                            </a>
                        </li>
                        <li class=''>
                            <a href='memberList'>
                                <i class='icon-caret-right'></i>
                                <span>会员管理</span>
                            </a>
                        </li>
                        <li class=''>
                            <a href='categoryList'>
                                <i class='icon-caret-right'></i>
                                <span>类别管理</span>
                            </a>
                        </li>
                        <li class=''>
                            <a href='productList'>
                                <i class='icon-caret-right'></i>
                                <span>商品管理</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='dingdanList'>
                                <i class='icon-caret-right'></i>
                                <span>订单管理</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='commentList'>
                                <i class='icon-caret-right'></i>
                                <span>评价管理</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='msgList'>
                                <i class='icon-caret-right'></i>
                                <span>留言管理</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='loginipList'>
                                <i class='icon-caret-right'></i>
                                <span>访客记录</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='backproductList'>
                                <i class='icon-caret-right'></i>
                                <span>退货管理</span>
                            </a>
                        </li>

                    </ul>
                </li>






                <li>
                    <a class='dropdown-collapse in' href='#'>
                        <i class='icon-cog'></i>
                        <span>统计分析</span>
                        <i class='icon-angle-down angle-down'></i>
                    </a>
                    <ul class='nav nav-stacked in'>
                        <li class=''>
                            <a href='saleMoney'>
                                <i class='icon-caret-right'></i>
                                <span>销售额统计</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='statisticsNum'>
                                <i class='icon-caret-right'></i>
                                <span>销量统计</span>
                            </a>
                        </li>

                    </ul>
                </li>




            </ul>
        </div>
    </nav>



</body>
</html>