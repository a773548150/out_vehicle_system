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
        if($this->isLogin()){
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/index");
        }
    }

    public function login() {
        session_start();
        $username = I('post.username');
        $m = D("Manager");
        $rs = $m->login();
        if ($rs == 1) {
            $_SESSION['logined'] = true;
            $_SESSION['username'] = $username;
            $this->ajaxReturn("登录成功");
        } else {
            $_SESSION['logined'] = false;
            $this->ajaxReturn("登录失败");
        }
    }

    public function loginOff() {
        session_destroy();
        $this->ajaxReturn("成功退出");
    }

//    public function signUp() {
//        $m = D("Manager");
//        $rs = $m->signUp();
//        echo $rs;
//    }

    public function isLogin() {
        if (isset($_SESSION['logined']) && $_SESSION['logined']) {
            return true;
        } else {
            $this->toLogin();
            return false;
        }
    }

    public function toLogin() {
        $this->display("/login");
    }

    public function toAlertPassword() {
        if($this->isLogin()) {
            $this->display("/alertPassword");
        }
    }

    public function alertPassword() {
        $m = D("Manager");
        $rs = $m->alertPassword();
        echo $rs;
    }

    public function toOrder() {
        if($this->isLogin()) {
            $goods = A("Order");
            $goods->goods();
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/order");
        }
    }

    public function toOrderManager() {
        if($this->isLogin()) {
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/orderManager");
        }
    }

    public function toDriver() {
        if($this->isLogin()) {
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/driver");
        }
    }

    public function toVehicle() {
        if($this->isLogin()) {
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/vehicle");
        }
    }

    public function toRole() {
        if($this->isLogin()){
            $Role = A("Role");
            $Role->role();
            $Role->user();
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/role");
        }
    }

    public function toGoods() {
        if($this->isLogin()) {
            $this->display("/goods");
        }
    }

    public function toUser() {
        if($this->isLogin()) {
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/addUser");
        }
    }

    public function toLogManage() {
        if($this->isLogin()) {
            $permissions = A("Role");
            $permissions->findPermissions();
            $this->display("/logManage");
        }
    }
}