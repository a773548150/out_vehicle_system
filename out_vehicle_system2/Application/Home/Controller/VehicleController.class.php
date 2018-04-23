<?php
namespace Home\Controller;

class VehicleController extends BaseController {

    public function selectLicense() {
        $m = D("Vehicle");
        $rs = $m->selectLicense();
        echo json_encode($rs);
    }
}