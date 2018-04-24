<?php
namespace Home\Controller;
class IndexController extends BaseController {
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
        $username = I('post.mobile_number');
        if ($rs) {
            $_SESSION['userLogined'] = true;
            $_SESSION['username1'] = $username;
            $this->ajaxReturn("/".$rs);
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
            $select = A("Order");
            $select->selectUnTaking();
            $select->selectUnFinish();
            $select->selectFinish();
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

    public function toOrderDetail() {
        if ($this->isLogin()) {
            $select = A("Order");
            $select->showOrderDetail();
            $this->display("/orderDetail");
        }
    }

    public function toPersonalOrder() {
        if ($this->isLogin()) {
            $select = A("Order");
            $select->selectPersonalUnFinish();
            $this->display("/personalOrder");
        }
    }

    public function toPersonalUnTakingOrder() {
        if ($this->isLogin()) {
            $select = A("Order");
            $select->selectUnTaking();
            $this->display("/personalUnTakingOrder");
        }
    }

    public function toPersonalOrderDetail() {
        if ($this->isLogin()) {
            $select = A("Order");
            $select->showPersonalOrderDetail();
            $this->display("/personalOrderDetail");
        }
    }

    public function toPersonalOrderManage() {
        if ($this->isLogin()) {
            $select = A("Order");
            $select->selectPersonalUnFinish();
            $select->selectPersonalFinish();
            $this->display("/personalOrderManage");
        }
    }

    public function toFinishOrderDetail() {
        if ($this->isLogin()) {
            $select = A("Order");
            $select->showFinishOrderDetail();
            $this->display("/finishOrderDetail");
        }
    }

    public function toPersonalMessage() {
        if ($this->isLogin()) {
            $select = A("Driver");
            $select->showDriverMessage();
            $this->display("/personalMessage");
        }
    }
}