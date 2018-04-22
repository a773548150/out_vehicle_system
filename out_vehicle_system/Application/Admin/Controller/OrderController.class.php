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

    public function timeSelect() {
        $m = D("Order");
        $res = $m->timeSelect();
        $rs = json(0,'数据返回成功',1000,$res);
        echo $rs;
    }

    public function exportExcel($expTitle,$expCellName,$expTableData){
        $xlsTitle = iconv('utf-8', 'gb2312', $expTitle);//文件名称
        $fileName = $_SESSION['account'].date('_YmdHis');//or $xlsTitle 文件名称可根据自己情况设定
        $cellNum = count($expCellName);
        $dataNum = count($expTableData);
        vendor("PHPExcel.PHPExcel");

        $objPHPExcel = new \PHPExcel();
        $cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');

        $objPHPExcel->getActiveSheet(0)->mergeCells('A1:'.$cellName[$cellNum-1].'1');//合并单元格
        // $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $expTitle.'  Export time:'.date('Y-m-d H:i:s'));
        for($i=0;$i<$cellNum;$i++){
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'2', $expCellName[$i][1]);
        }
        // Miscellaneous glyphs, UTF-8
        for($i=0;$i<$dataNum;$i++){
            for($j=0;$j<$cellNum;$j++){
                $objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+3), $expTableData[$i][$expCellName[$j][0]]);
            }
        }

        header('pragma:public');
        header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
        header("Content-Disposition:attachment;filename=$fileName.xls");//attachment新窗口打印inline本窗口打印
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
        exit;
    }
    /**
     *
     * 导出Excel
     */
    function expUser(){//导出Excel
        $xlsName  = "Order";
        $xlsCell  = array(
            array('id','id'),
            array('number','订单号'),
            array('udid','订单编号'),
            array('create_time','出发时间'),
            array('out_number','出车车牌号'),
            array('out_destination','目的地'),
            array('mission_status','状态'),
            array('order_driver_number','司机编号'),
            array('pick_up_order','提货单号'),
            array('contract_number','合同号'),
            array('out_of_stock_message','缺货信息'),
            array('goods_name','商品名'),
            array('pick_up_quantity','提货数量'),
            array('pick_up_time','提货时间'),
            array('closing_unit','结算单位')
        );
        $xlsModel = M('Order');
        $driver = M("driver");
        $vehicle = M("vehicle");
        $goods = M("goods");

        if (I("get.startTime") && I("get.endTime")) {
            $startTime = I("get.startTime");
            $endTime = I("get.endTime");
            $data["start_time"] = array(array('gt', $startTime), array('lt', $endTime));
            $xlsData  = $xlsModel->where($data)->order('id desc')->Field('id,number,udid,create_time,vehicle_id,out_destination,mission_status,driver_id,pick_up_order,contract_number,out_of_stock_message,goods_id,pick_up_quantity,pick_up_time,closing_unit')->select();
        } else {
            $xlsData  = $xlsModel->order('id desc')->Field('id,number,udid,create_time,vehicle_id,out_destination,mission_status,driver_id,pick_up_order,contract_number,out_of_stock_message,goods_id,pick_up_quantity,pick_up_time,closing_unit')->select();
        }

        foreach ($xlsData as $k => $v)
        {
            $value1 = $v['vehicle_id'];
            $result1 = $vehicle->where(array("id"=>$value1))->getField("license_plate");
            $xlsData[$k]['out_number'] = $result1;

            $value2 = $v['goods_id'];
            $result2 = $goods->where(array("id"=>$value2))->getField("name");
            $xlsData[$k]['goods_name'] = $result2;

            $value3 = $v['driver_id'];
            $result3 = $driver->where(array("id"=>$value3))->getField("number");
            $xlsData[$k]['order_driver_number'] = $result3;
        }

        foreach ($xlsData as $k => $v)
        {
            if ($v['mission_status']==0){
                $xlsData[$k]['mission_status'] = "未接";
            } else if ($v['mission_status']==1) {
                $xlsData[$k]['mission_status'] = "已接";
            } else if ($v['mission_status']==2) {
                $xlsData[$k]['mission_status'] = "已完成";
            }
        }
        $this->exportExcel($xlsName,$xlsCell,$xlsData);

    }
}