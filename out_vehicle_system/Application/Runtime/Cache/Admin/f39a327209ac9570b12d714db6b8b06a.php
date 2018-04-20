<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="/Public/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/Application/Admin/Public/css/alertPassword.css">
    <title>修改密码</title>
</head>
<body>

<a href="javascript:history.go(-1)" class="layui-btn" id="alert-password">返回</a>

<h1>修改密码</h1>
<form class="layui-form" action="alertPassword" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" value="admin" disabled autocomplete="off" class="layui-input">
        </div>
        <!--<div class="layui-form-mid layui-word-aux">辅助文字</div>-->
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-inline">
            <input type="password" name="oldPassword" id="oldPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"  maxlength="15">
        </div>
        <!--<div class="layui-form-mid layui-word-aux">辅助文字</div>-->
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="password" name="newPassword" id="newPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input inputNewPssword"  maxlength="15">
            <!--<input type="text" class="layui-input inputNewPsswordHide" maxlength="20" id="" name="newPassword" placeholder="Password" />-->
        </div>
        <!--<i class="layui-icon" style="font-size: 20px;" id="eye">&#xe60f;</i>-->
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">再输入密码</label>
        <div class="layui-input-inline">
            <input type="password" name="newPassword2" id="newPassword2" required lay-verify="required" placeholder="请再输入密码" autocomplete="off" class="layui-input inputNewPssword"  maxlength="15">
            <!--<input type="text" class="layui-input inputNewPsswordHide" maxlength="20" id="" name="newPassword" placeholder="Password" />-->
        </div>
        <!--<i class="layui-icon" style="font-size: 20px;" id="eye">&#xe60f;</i>-->
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src="/Public/layui/layui.all.js"></script>
<script src="/Public/jquery-3.3.1.min.js"></script>
<script src="/Application/Admin/Public/js/alertPassword.js"></script>
</body>
</html>