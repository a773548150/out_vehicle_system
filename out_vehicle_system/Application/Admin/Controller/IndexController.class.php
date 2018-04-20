<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 16:42
 */

namespace Admin\Controller;

class IndexController extends BaseController {

    public function index() {
        if ($_COOKIE['username']) {
            $this->display("/success");
        } else {
            $this->display("/index");
        }
    }

    public function login() {
        $username = I('post.username');
        $m = D("Manager");
        $rs = $m->login();
        if ($rs == 1) {
            setcookie("username", $username, time() + 3600*24*7,"/");
            $this->ajaxReturn("登录成功");
        } else {
            $this->ajaxReturn("登录失败");
        }
    }

    public function loginOff() {
        setcookie("username", "");
        $this->ajaxReturn("成功退出");
    }

    public function signUp() {
        $m = D("Manager");
        $rs = $m->signUp();
        echo $rs;
    }

    public function isLogin() {
        if ($_COOKIE["username"]) {
            $this->ajaxReturn("已经登录");
        } else {
            $this->ajaxReturn("未登录");
        }
    }

    public function toLogin() {
        $this->display("/login");
    }

    public function toSignUp() {
        $this->display("/signUp");
    }

    public function toAlertPassword() {
        $this->display("/alertPassword");
    }

    public function alertPassword() {
        $m = D("Manager");
        $rs = $m->alertPassword();
        echo $rs;
    }

    public function toOrder() {
        $goods = A("Order");
        $goods->goods();
        $this->display("/order");
    }

    public function toOrderManager() {
        $this->display("/orderManager");
    }

    public function toDriver() {
        $this->display("/driver");
    }

    public function toVehicle() {
        $this->display("/vehicle");
    }

    public function toRole() {
        $Role = A("Role");
        $Role->role();
        $Role->user();
        $this->display("/role");
    }

    public function toGoods() {
        $this->display("/goods");
    }

    public function toUser() {
        $this->display("/addUser");
    }
}