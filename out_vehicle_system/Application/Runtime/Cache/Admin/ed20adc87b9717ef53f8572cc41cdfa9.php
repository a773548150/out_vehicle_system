<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台主页</title>
</head>
<body>
    <h3>登录</h3>
    <form action="login" method="post">
        <div>
            <lable for="username">用户名</lable>
            <input id="username" name="username" type="text"/>
        </div>

        <div>
            <lable for="password">密码</lable>
            <input id="password" name="password" type="password"/>
        </div>

        <div>
            <input type="submit" value="确定"/>
        </div>
    </form>
</body>
</html>