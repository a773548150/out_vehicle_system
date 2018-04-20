<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display("/index");
    }

    public function login($username = "") {
        $m = D("Driver");
        $rs = $m->login();
        if ($rs == 1) {
            setcookie($username, $username);
            $this->ajaxReturn("登录成功");
        } else {
            $this->ajaxReturn("登录失败");
        }
    }

    public function isLogin() {
        $username = I('post.username');
        if ($_COOKIE[$username]) {
            $this->ajaxReturn("已经登录");
        } else {
            $this->login($username);
        }
    }

    public function toPublicOrder() {
        $this->display("/publicOrder");
    }

    public function loginOff() {
        $username = I('post.username');
        setcookie($username, "");
        $this->ajaxReturn("成功退出");
    }

    public function toAlertPassword() {
        $this->display("/alertPassword");
    }
    public function alertPassword() {
        $m = D("Driver");
        $rs = $m->alertPassword();
        echo $rs;
    }
}