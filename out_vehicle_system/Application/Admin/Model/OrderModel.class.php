<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 17:05
 */

namespace Admin\Model;

class OrderModel extends BaseModel {

    public function goods() {
        $m = M("goods");
        $result = $m->getField("name", true);
        return $result;
    }


    public function makeOrder() {
        $m = M("order");
        $C = A("Order");
        $data['number'] = $C->orderNumber();
        $data['udid'] = $C->orderNumber();
        $data['out_destination'] = trim(I('post.destination'));
        $data['goods_name'] = trim(I('post.goodsName'));
        $data['out_number'] = trim(I('post.number'));
        $data['start_time'] = trim(I('post.startTime'));
        $data['create_time'] = date("Y-m-d h:i:s");
        $result = $m->data($data)->add();
        return $result;
    }

//    public function searchType() {
//        $m = M("order");
//
//    }

    public function searchOrder() {
        $m = M("order");

        $data['mission_status'] = I('get.missionStatus');
        $data['number'] = array('LIKE', "%".I('get.orderNumber')."%");
        $page = I('get.page');
        $limit = I('get.limit');
        if ($data['mission_status'] === "0" || $data['mission_status'] === "1" || $data['mission_status'] === "2") {
            $result = $m->where($data)->page($page, $limit)->select();
            return $result;
        } else if($data['mission_status'] === "3"){
            unset($data['mission_status']);
            $result = $m->where($data)->page($page, $limit)->select();
            return $result;
        } else {
            $result = $m->page($page, $limit)->select();
            return $result;
        }
    }

    public function deleteOrder() {
        $m = M("order");
        $m->delete(I('post.id'));
        echo "1";
    }

    public function editOrder() {
        $m = M("order");
        $field = I('post.field');
        $value = I('post.value');
        $lim["id"] = I('post.id');
        $data[$field] = $value;
        $res = $m->where($lim)->save($data);
        return $res;
    }
}