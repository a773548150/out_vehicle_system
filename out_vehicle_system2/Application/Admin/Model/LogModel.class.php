<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 17:05
 */

namespace Admin\Model;

class LogModel extends BaseModel {

    public function insert($insertData) {
        $L = M("log");
        $M = M("manager");

        $username["username"] = $_SESSION['username'];
        $manager_id = $M->where($username)->getField("id");

        $data["manager_id"] = $manager_id;
        $data["table_id"] = $insertData["table_id"];
        $data["table_name"] = $insertData["table_name"];
        $data["type"] = "1";
        $data["alert_time"] = date("Y-m-d h:i:s");
//        $data["key"] = $insertData["key"];
//        $data["value"] = $insertData.value;
//        $data["current_value"] = $insertData.current_value;

        $res = $L->data($data)->add();
        return $res;
    }

    public function update($updateData) {
        $L = M("log");
        $M = M("manager");

        $username["username"] = $_SESSION['username'];
        $manager_id = $M->where($username)->getField("id");

        $data["manager_id"] = $manager_id;
        $data["table_id"] = $updateData["table_id"];
        $data["table_name"] = $updateData["table_name"];
        $data["type"] = "2";
        $data["alert_time"] = date("Y-m-d h:i:s");
        $data["key"] = $updateData["key"];
        $data["value"] = $updateData["value"];
        $data["current_value"] = $updateData["current_value"];

        $res = $L->data($data)->add();
        return $res;
    }

    public function delete($deleteData) {
        $L = M("log");
        $M = M("manager");

        $username["username"] = $_SESSION['username'];
        $manager_id = $M->where($username)->getField("id");

        $data["manager_id"] = $manager_id;
        $data["table_id"] = $deleteData["table_id"];
        $data["table_name"] = $deleteData["table_name"];
        $data["type"] = "3";
        $data["alert_time"] = date("Y-m-d h:i:s");

        $res = $L->data($data)->add();
        return $res;
    }

    public function searchLog() {
        $m = M("log");

        $startTime = I("get.startTime");
        $endTime = I("get.endTime");
        if ($startTime && $endTime) {
            $data["alert_time"] = array(array('egt', $startTime), array('elt', $endTime));
        }
        $page = I('get.page');
        $limit = I('get.limit');

        $result = $m->where($data)->order('id desc')->page($page, $limit)->select();
        $result = $this->findForeign($result);
        return $result;
    }

    public function findForeign($result){
        $M = M("manager");
        $O = M("order");
        //通过订单id外键查找到订单编号
        foreach ($result as $key => $value) {
            foreach ($value as $key2 => $value2){
                if ($key2 == "table_name" && $key2 != null && $value2 == "order") {
                    $result[$key]["number"] = $O->where(array("id"=>$result[$key]["table_id"]))->getField("number");
                }
            }
        }

        foreach ($result as $key => $value) {
            foreach ($value as $key2 => $value2){
                if ($key2 == "type" && $key2 != null && $value2 == "1") {
                    $result[$key]["type"] = "新添";
                } elseif($key2 == "type" && $key2 != null && $value2 == "2") {
                    $result[$key]["type"] = "删除";
                } elseif($key2 == "type" && $key2 != null && $value2 == "3") {
                    $result[$key]["type"] = "修改";
                }
            }
        }

        //通过管理员id外键查找到管理员名字
        foreach ($result as $key => $value) {
            foreach ($value as $key2 => $value2){
                if ($key2 == "manager_id" && $key2 != null) {
                    $result[$key]["manager_name"] = $M->where(array("id"=>$value2))->getField("username");
                }
            }
        }
        return $result;
    }
}