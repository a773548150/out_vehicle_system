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

    public function goods() {
        $m = D("Order");
        $res = $m->goods();
        $this->assign('goodsName', $res);
    }

    public function orderNumber() {
        $nowTime = date("Ymdhis");
        $sixRand = rand('100000', '999999');
        return $nowTime.$sixRand;
    }

    public function goodsNumber() {
        $nowTime = date("Ymdhis");
        return "goods".$nowTime;
    }

    public function makeOrder() {
        $m = D("Order");
        $res = $m->makeOrder();
        echo $res;
    }

//    public function searchType() {
//        $m = D("Order");
//        $res = $m->searchType();
//        $this->assign('orderMessage', $res);
//        $this->display("/orderManager");
//    }

    public function searchOrder() {
        $m = D("Order");
        $res = $m->searchOrder();

        $rs = json(0,'数据返回成功',1000,$res);
        echo $rs;
//        $this->assign('orderMessage', $res);
//        $this->display("/orderManager");
    }

    public function deleteOrder() {
        $m = D("Order");
        $res = $m->deleteOrder();
        echo $res;
    }

    public function editOrder() {
        $m = D("Order");
        $res = $m->editOrder();
        echo $res;
    }
}