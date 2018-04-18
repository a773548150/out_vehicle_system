<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 17:05
 */

namespace Admin\Model;

class OrderModel extends BaseModel {

    public function orderNumber() {
        $nowTime = date("Ymdhis");
        $sixRand = rand('100000', '999999');
        return $nowTime.$sixRand;
    }

    public function goods() {
        $m = M("goods");
        $result = $m->getField("name", true);
        return $result;
    }

    public function makeOrder() {
        $m = M("order");
        $C = A("Order");
        $data['number'] = $C->orderNumber();
        $data['out_destination'] = I('post.destination');
        $data['goods_name'] = I('post.goodsName');
        $data['out_number'] = I('post.number');
        $data['start_time'] = I('post.startTime');
        $data['create_time'] = date("Y-m-d h:i:s");
        $result = $m->data($data)->add();
        return $result;
    }

    public function searchType() {
        $m = M("order");
        $data['mission_status'] = I('get.missionStatus');
        if ($data['mission_status'] === "0" || $data['mission_status'] === "1" || $data['mission_status'] === "2") {
            $result = $m->where($data)->select();
            return $result;
        } else {
            $result = $m->select();
            return $result;
        }
    }k

    public function searchOrder() {
        $m = M("order");
        $data['number'] = array('LIKE', "%".I('post.number')."%");
        $result = $m->where($data)->select();
        return $result;
    }
}