<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 11:09
 */

namespace Admin\Controller;

class OrderController extends BaseController {
    public function index() {
        $this->display("/order");
    }

    public function orderNumber() {
        $m = D("Order");
        $res = $m->orderNumber();
        return $res;
    }

    public function goods() {
        $m = D("Order");
        $res = $m->goods();
        $this->assign('goodsName', $res);
    }

    public function makeOrder() {
        $m = D("Order");
        $res = $m->makeOrder();
        echo $res;
    }

    public function searchType() {
        $m = D("Order");
        $res = $m->searchType();
        $this->assign('orderMessage', $res);
        $this->display("/orderManager");
    }

    public function searchOrder() {
        $m = D("Order");
        $res = $m->searchOrder();
        $this->assign('orderMessage', $res);
        $this->display("/orderManager");
    }
}