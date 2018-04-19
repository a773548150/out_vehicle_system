<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display("/index");
    }

    public function login() {
        $m = D("Driver");
        $rs = $m->login();
        if ($rs == 1) {
            $username = I('post.username');
            setcookie("username", $username, time() + 3600*24*7,"/");
            $this->ajaxReturn("登录成功");
        } else {
            $this->ajaxReturn("登录失败");
        }
    }

    public function toPublicOrder() {
        $this->display("/publicOrder");
    }
}