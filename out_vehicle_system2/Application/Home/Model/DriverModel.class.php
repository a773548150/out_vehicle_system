<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 16:39
 */

namespace Home\Model;

class DriverModel extends BaseModel {

    public function login(){
        $m = M("driver");
        $data["mobile_number"] = trim(I('post.mobile_number'));
        $data["password"] = md5(trim(I('post.password')));
        $result = $m->where($data)->getField("head_path");
        return $result;
    }

    public function uploadProfilePhoto() {
        $m = M("driver");
        $file = $_FILES;
        $name = $_SESSION["username1"];
        $src = "Application/Common/img/".$name.'.png';
        $res = move_uploaded_file($_FILES['upFile']['tmp_name'], $src);
        var_dump($file);
        $data["head_path"] = $src;
        $result = $m->where(array('mobile_number'=>$name))->save($data);
//        return $result;
    }

    public function showDriverMessage() {
        $m = M("driver");
        $data["mobile_number"] = $_SESSION['username1'];
        $result = $m->where($data)->select();
        return $result;
    }
}