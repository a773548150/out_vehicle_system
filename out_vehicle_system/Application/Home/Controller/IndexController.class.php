<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        if ($this->isLogin()) {
            $this->display("/publicOrder");
        }
    }

    public function toLogin() {
        $this->display("/login");
    }

    public function login() {
        session_start();
        $m = D("Driver");
        $rs = $m->login();
        $username = I('post.username');
        if ($rs == 1) {
            $_SESSION['userLogined'] = true;
            $_SESSION['username1'] = $username;
            $this->ajaxReturn("登录成功");
        } else {
            $_SESSION['userLogined'] = false;
            $this->ajaxReturn("登录失败");
        }
    }

    public function isLogin() {
        if (isset($_SESSION['userLogined']) && $_SESSION['userLogined']) {
            return true;
        } else {
            $this->toLogin();
            return false;
        }
    }

    public function toPublicOrder() {
        if ($this->isLogin()) {
            $this->display("/publicOrder");
        }
    }

    public function loginOff() {
        session_destroy();
        $this->ajaxReturn("成功退出");
    }

    public function toAlertPassword() {
        if ($this->isLogin()) {
            $this->display("/alertPassword");
        }
    }
    public function alertPassword() {
        $m = D("Driver");
        $rs = $m->alertPassword();
        echo $rs;
    }
}