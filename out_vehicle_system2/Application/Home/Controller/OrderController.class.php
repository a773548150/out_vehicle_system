<?php
namespace Home\Controller;

class OrderController extends BaseController {

    public function selectUnTaking() {
        $m = D("Order");
        $rs = $m->selectUnTaking();
        $this->assign('unTakingData', $rs);
    }

    public function selectUnFinish() {
        $m = D("Order");
        $rs = $m->selectUnFinish();
        $this->assign('unFinishData', $rs);
    }

    public function selectFinish() {
        $m = D("Order");
        $rs = $m->selectFinish();
        $this->assign('finishData', $rs);
    }

    public function showOrderDetail() {
        $m = D("Order");
        $rs = $m->showOrderDetail();
        $this->assign('data', $rs);
    }

    public function makeOrder() {
        $m = D("Order");
        $rs = $m->makeOrder();
        echo $rs;
    }
}