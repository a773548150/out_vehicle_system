<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en" style="font-size: 12px;">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/out_vehicle_system/Public/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/out_vehicle_system/Application/Admin/View/index.css">
    <title>首页</title>
</head>
<body>
    <ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
        <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
        <li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;">订单信息</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:;">新添订单</a></dd>
                <dd><a href="javascript:;">订单管理</a></dd>
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

    <script src="/out_vehicle_system/Public/layui/layui.all.js"></script>
    <script src="/out_vehicle_system/Public/jquery-3.3.1.min.js"></script>

</body>
</html>