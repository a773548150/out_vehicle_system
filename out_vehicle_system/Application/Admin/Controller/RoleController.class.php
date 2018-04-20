<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 11:09
 */

namespace Admin\Controller;

class RoleController extends BaseController {
    public function role() {
        $m = D("Role");
        $res = $m->role();
        $this->assign('roleName', $res);
    }

    public function user() {
        $m = D("Role");
        $res = $m->user();
        $this->assign('userName', $res);
    }
    public function addRole() {
        $m = D("Role");
        $res = $m->addRole();
        echo $res;
    }

    public function searchRole() {
        $m = D("Role");
        $res = $m->searchRole();

        $rs = json(0,'数据返回成功',1000,$res);
        echo $rs;
    }

    public function deleteRole() {
        $m = D("Role");
        $res = $m->deleteRole();
        echo $res;
    }

    public function editRole() {
        $m = D("Role");
        $res = $m->editRole();
        echo $res;
    }

    public function addUser() {
        $m = D("Role");
        $res = $m->addUser();
        echo $res;
    }

    public function searchUser() {
        $m = D("Role");
        $res = $m->searchUser();

        $rs = json(0,'数据返回成功',1000,$res);
        echo $rs;
    }
    public function deleteUser() {
        $m = D("Role");
        $res = $m->deleteUser();
        echo $res;
    }

    public function addPermissions() {
        $m = D("Role");
        $res = $m->addPermissions();
        echo $res;
    }
    public function searchPermissions() {
        $m = D("Role");
        $res = $m->searchPermissions();
        $rs = json(0,'数据返回成功',1000,$res);
        echo $rs;
    }
}