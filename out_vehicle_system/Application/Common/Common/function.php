<?php
/**
 * Created by PhpStorm.
 * User: 77354
 * Date: 2018/4/18
 * Time: 22:09
 */

function json($code,$msg="",$count,$data=array()){
    $result=array(
        'code'=>$code,
        'msg'=>$msg,
        'count'=>$count,
        'data'=>$data
    );
    //输出json
    echo json_encode($result);
    exit;
}