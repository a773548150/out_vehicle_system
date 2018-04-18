<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/Public/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/Application/Admin/Public/css/index.css">
    <title>首页</title>
</head>
<body>
    <ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
        <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
        <li class="layui-nav-item layui-this">
            <a href="/Admin/Index/index">主页</a>
        </li>

        <li class="layui-nav-item">
            <a href="/Admin/Index/toOrder">新添订单</a>
        </li>
        <li class="layui-nav-item" >
            <a href="javascript:;">订单管理</a>
            <dl class="layui-nav-child">
                <dd><a href="/Admin/Index/toOrderManager">订单管理</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">司机信息</a>
            <dl class="layui-nav-child">

            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">车辆信息</a>
            <dl class="layui-nav-child">

            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">角色权限</a>
            <dl class="layui-nav-child">

            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">操作日记</a>
            <dl class="layui-nav-child">

            </dl>
        </li>
    </ul>
    <h2>欢迎使用后台管理</h2>
    <a href="Admin/Index/toAlertPassword" class="layui-btn" id="alert-password">修改密码</a>
    <script src="/Public/layui/layui.all.js"></script>
    <script src="/Public/jquery-3.3.1.min.js"></script>
    <script src="/Application/Admin/Public/js/index.js"></script>
</body>
</html>