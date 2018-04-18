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

    public function toMain() {
        $this->display("/main");
    }

    public function login() {
        $m = D("Manager");
        $rs = $m->login();
        if ($rs == 1) {
            $username = I('post.username');
            setcookie("username", $username, time() + 3600*24*7,"/");
            $this->ajaxReturn("登录成功");
            $this->display("/login");
        } else {
            $this->ajaxReturn("登录失败");
            $this->display("/login");
        }
    }

    public function signUp() {
        $m = D("Manager");
        $rs = $m->signUp();
        echo $rs;
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
        $type = A('Order');
//        $type->searchType();
      //  $type->searchOrder();
        $this->display("/orderManager");
    }

}