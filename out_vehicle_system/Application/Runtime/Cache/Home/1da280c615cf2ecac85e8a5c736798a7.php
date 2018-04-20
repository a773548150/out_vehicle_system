<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="/Public/layui/css/layui.css">
    <!--<link rel="stylesheet" type="text/css" href="/Application/Home/Common/css/index.css">-->
    <link rel="stylesheet" type="text/css" href="/Application/Home/Public/css/publicOrder.css">
    <title>司机管理页面</title>
</head>
<body>
<ul class="layui-nav" lay-filter="">
    <li class="layui-nav-item layui-this"><a href="">公共订单</a></li>
    <li class="layui-nav-item "><a href="">个人订单</a></li>
    <li class="layui-nav-item"><a href="">个人中心</a></li>
    <li class="layui-nav-item">
        <a href=""><img src="http://t.cn/RCzsdCq" class="layui-nav-img">我</a>
        <dl class="layui-nav-child">
            <dd><a href="/Home/Index/toAlertPassword">修改密码</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="/Home/Index/loginOff" id="loginOff">退出</a></dd>
        </dl>
    </li>
</ul>
<script src="/Public/jquery-3.3.1.min.js"></script>
<script src="/Public/layui/layui.js"></script>
<script src="/Public/jquery.cookie.js"></script>
<script src="/Application/Home/Public/js/publicOrder.js"></script>
</body>
</html>