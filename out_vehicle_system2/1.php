<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 19:08
 */

var_dump($_POST['username']);
echo "<hr/>";
var_dump($_POST['password']);
echo "<hr/>";

echo "<pre>";
var_dump($_FILES['file']);
echo "</pre>";

echo "<hr/>";

setcookie("username", "hiaocong");
var_dump($_COOKIE['username']);

session_start();
$_SERVER['password'] = "123465";
var_dump($_SERVER['password']);

echo "<hr/>";

$a = "global";
global $a;

echo "<pre>";
var_dump($GLOBALS);
echo "</pre>";