<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试主页</title>
    <meta charset="utf-8">
    <!--适用于不同的设备，保证始终能充满整个屏幕-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1,minimum-scale=1,user-scalable=no">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-3.3.7/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/premium.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/theme.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">

    <!--必须先引用jQuery再引用bootstrap-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

    <style type="text/css">
        .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
            color: #fff;
        }
        a{
            text-decoration: none;
        }
        .sidebar-nav .nav-list  > li:hover {
            cursor: pointer;
            border-left: 4px solid #8989a6;
            overflow: hidden;
            background-color: #9acfea;
        }
        .sidebar-nav .nav-list  > .active li{
            overflow: hidden;
            border-left: 4px solid #909096;
        }

        .sidebar-nav .nav-list  > li {
            color: #222;
            padding: .5em 1em;
        }
        .sidebar-nav .nav-list.collapse.in li{
            border-bottom: 1px solid #ccc;
        }
    </style>
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-default" role="navigation" style="background: #3C4049;">
    <div class="container-fluid">
        <!--左侧title-->
        <div class="navbar-header">
            <span class="navbar-brand" style="color: white">公司内部管理系统</span>
        </div>

        <!--右侧logout-->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-off" style="color: white"></span>
                    <!--显示下拉图标-->
                    <span class="caret" style="color: white"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="">退出登录</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<!--左侧菜单栏-->
<div class="sidebar-nav">
    <ul>
        <li id="li-one" class="nav-header"><i class="glyphicon glyphicon-home"></i> 首页</li>
        <li data-target=".premium-menu"  class="nav-header collapsed" data-toggle="collapse">
            <i class="glyphicon glyphicon-tasks" ></i>   账单记录
        </li>
        <li>
            <ul class="premium-menu nav nav-list collapse">
                <li id="li-two" class="li-two"><i class="glyphicon glyphicon-chevron-right"></i>代收账单记录</li>
                <li id="li-three" class="li-three"><i class="glyphicon glyphicon-chevron-right"></i> 发货应收已收</li>
            </ul>
        </li>
        <li id="li-four" class="nav-header li-eight">
            <i class="glyphicon glyphicon-equalizer"></i> 财务总结
        </li>
        <li id="li-five" class="nav-header li-eight">
            <i class="glyphicon glyphicon-equalizer"></i> 笔记记录
        </li>
    </ul>
</div>

<!--右侧主体内容，这里就只显示当前click的内容-->
<div class="content" >
    <!--默认显示第一页-->
    <div id="matter1">
        <jsp:include page="contentOne.jsp"/>
    </div>

    <div id="matter2" style="display: none">
        <jsp:include page="contentTwo.jsp"/>
    </div>
    <div id="matter3" style="display: none">
        <jsp:include page="contentThree.jsp"/>
    </div>

    <div id="matter4" style="display: none">
        <jsp:include page="contentFour.jsp"/>
    </div>

    <div id="matter5" style="display: none">
        <jsp:include page="contentFive.jsp"/>
    </div>
</div>

<!-- 引入自定义js文件 -->
<script src="${pageContext.request.contextPath}/js/mainpage.js"></script>

</body>
</html>
