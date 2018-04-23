<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 16:39
 */

namespace Home\Model;

class DriverModel extends BaseModel {
    public function login() {
//        $up['username'] = $_POST['username'];
//        $up['password'] = $_POST['password'];
        $up['mobile_number'] = I('post.mobile_number');
        $up['password'] = md5(I('post.password'));
        $m = M("driver");
        $result = $m->where($up)->count();
        return $result;
    }

    public function alertPassword() {
        $m = M("driver");
        $data['mobile_number'] = I('post.mobile_number');
        $data['password'] = md5(I('post.oldPassword'));
        $result = $m->where($data)->getField('id');

        if ($result) {
            $data2['password'] = md5(I('post.newPassword'));
            $result2 = $m->where(array('id'=>$result))->save($data2);
            if ($result2 === 1) {
                return 1;
            }
        } else {
            return 2; //密码错误
        }
    }
}