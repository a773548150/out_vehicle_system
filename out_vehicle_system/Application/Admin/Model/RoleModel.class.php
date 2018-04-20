<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/29
 * Time: 17:05
 */

namespace Admin\Model;

class RoleModel extends BaseModel {
    public function role() {
        $m = M("role");
        $result = $m->getField("name", true);
        return $result;
    }
    public function user() {
        $m = M("manager");
        $data['create_time'] = array('neq', 0);
        $result = $m->where($data)->getField("username", true);
        return $result;
    }
    public function addRole() {
        $m = M("Role");
        $data['name'] = trim(I('post.name'));
        $data['manage_order'] = I('post.manage_order') == "on" ? "1" : "0";
        $data['manage_driver'] = I('post.manage_driver') == "on" ? "1" : "0";
        $data['manage_vehicle'] = I('post.manage_vehicle') == "on" ? "1" : "0";
        $data['manage_role'] = I('post.manage_role') == "on" ? "1" : "0";
        $data['manage_diary'] = I('post.manage_diary') == "on" ? "1" : "0";
        $result = $m->data($data)->add();
        return $result;
    }

    public function searchRole() {
        $m = M("Role");
        $page = I('get.page');
        $limit = I('get.limit');
        $result = $m->order('id desc')->page($page, $limit)->select();
        return $result;
    }

    public function deleteRole() {
        $m = M("Role");
        $m->delete(I('post.id'));
        echo "1";
    }

    public function editRole() {
        $m = M("Role");
        $field = I('post.field');
        $value = I('post.value');
        $lim["id"] = I('post.id');
        $data[$field] = $value;
        $res = $m->where($lim)->save($data);
        return $res;
    }

    public function addUser() {
        $m = M("manager");
        $data['username'] = trim(I('post.username'));
        $data['password'] = md5(trim(I('post.password')));
        $data['create_time'] = date("Y-m-d h:i:s");
        $result = $m->data($data)->add();
        return $result;
    }

    public function searchUser() {
        $m = M("Manager");
        $page = I('get.page');
        $limit = I('get.limit');
        $data['create_time'] = array('neq', 0);
        $result = $m->where($data)->order('id desc')->page($page, $limit)->select();
        return $result;
    }

    public function deleteUser() {
        $m = M("Manager");
        $m->delete(I('post.id'));
        echo "1";
    }


    public function searchPermissions() {
        $m = M("Manager");
        $R = M("Role");
        $page = I('get.page');
        $limit = I('get.limit');
        $data['create_time'] = array('neq', 0);
        $result = $m->where($data)->order('id desc')->page($page, $limit)->select();

        foreach ($result as $key => $value) {
            foreach ($value as $key2 => $value2) {
                if ($key2 == "role_id" && $key2 != null) {
                    $result[$key]["role_name"] = $R->where(array("id" => $value2))->getField("name");
                }
            }
        }
        return $result;
    }
//????
    public function addPermissions() {
        $m = M("manager");
        $data['username'] = trim(I('post.username'));
        $data['password'] = md5(trim(I('post.password')));
        $data['create_time'] = date("Y-m-d h:i:s");
        $result = $m->data($data)->add();
        return $result;
    }
}