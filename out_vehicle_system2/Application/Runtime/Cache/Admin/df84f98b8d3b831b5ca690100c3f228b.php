<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/Public/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/Application/Admin/Common/css/index.css">
    <link rel="stylesheet" type="text/css" href="/Application/Admin/Public/css/addUser.css">
    <title>权限管理页面</title>
</head>
<body>
<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
    <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
    <li class="layui-nav-item">
        <a href="/Admin/Index/index">主页</a>
    </li>
    <?php if(in_array(($permissions[0][manage_order]), explode(',',"1"))): ?><li class="layui-nav-item" >
            <a href="javascript:;">订单管理</a>
            <dl class="layui-nav-child">
                <dd><a href="/Admin/Index/toOrderManager">订单管理</a></dd>
                <dd><a href="/Admin/Index/toOrder">新添订单</a></dd>
            </dl>
        </li><?php endif; ?>
    <?php if(in_array(($permissions[0][manage_driver]), explode(',',"1"))): ?><li class="layui-nav-item">
            <a href="javascript:;">司机信息</a>
            <dl class="layui-nav-child">
                <dd><a href="/Admin/Index/toDriver">司机管理</a></dd>
            </dl>
        </li><?php endif; ?>
    <?php if(in_array(($permissions[0][manage_vehicle]), explode(',',"1"))): ?><li class="layui-nav-item">
            <a href="javascript:;">车辆信息</a>
            <dl class="layui-nav-child">
                <dd><a href="/Admin/Index/toVehicle">车辆管理</a></dd>
            </dl>
        </li><?php endif; ?>
    <?php if(in_array(($permissions[0][manage_role]), explode(',',"1"))): ?><li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;">角色权限</a>
            <dl class="layui-nav-child">
                <dd><a href="/Admin/Index/toRole">权限管理</a></dd>
                <dd><a href="/Admin/Index/toUser"  class="layui-this">后台用户管理</a></dd>
            </dl>
        </li><?php endif; ?>
    <?php if(in_array(($permissions[0][manage_diary]), explode(',',"1"))): ?><li class="layui-nav-item">
            <a href="javascript:;">操作日记</a>
            <dl class="layui-nav-child">

            </dl>
        </li><?php endif; ?>
</ul>

<div class="allContent">
    <form class="layui-form" action="" method="post">
        <div class="layui-form-item toInline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" id="username" required lay-verify="required" autocomplete="off" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item toInline">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" id="password" required lay-verify="required" autocomplete="off" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item toInline">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">新增</button>
                <!--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
            </div>
        </div>
    </form>

    <table id="order" lay-filter="test"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>

<script src="/Public/layui/layui.js"></script>
<script src="/Public/jquery-3.3.1.min.js"></script>
<script src="/Application/Admin/Public/js/addUser.js"></script>
</body>
</html>