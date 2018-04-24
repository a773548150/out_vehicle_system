<?php
namespace Home\Controller;

class DriverController extends BaseController {

    public function uploadProfilePhoto() {
        $m = D("driver");
        $rs = $m->uploadProfilePhoto();
        echo $rs;
    }

    public function showDriverMessage() {
        $m = D("driver");
        $rs = $m->showDriverMessage();
        $this->assign('data', $rs);
    }
}