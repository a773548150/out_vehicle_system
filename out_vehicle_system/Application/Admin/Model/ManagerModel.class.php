<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 17:05
 */

namespace Admin\Model;

class ManagerModel extends BaseModel {
    public function login() {
//        $up['username'] = $_POST['username'];
//        $up['password'] = $_POST['password'];

        $up['username'] = I('post.username');
        $up['password'] = md5(I('post.password'));
        $m = M("manager");
        $result = $m->where($up)->count();
        return $result;
    }

    public function signUp() {
        $m = M("manager");
        $up['username'] = I('post.username');
        $up['password'] = md5(I('post.password'));
        $result = $m->data($up)->add();
        return $result;
    }
}