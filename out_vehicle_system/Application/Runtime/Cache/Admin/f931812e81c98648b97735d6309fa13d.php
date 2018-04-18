<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/Public/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/Application/Admin/Common/css/index.css">
    <link rel="stylesheet" type="text/css" href="/Application/Admin/Public/css/orderManager.css">
    <title>订单管理页面</title>
</head>
<body>
<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
    <li class="layui-nav-item">
        <a href="/Admin/Index/index">主页</a>
    </li>
    <li class="layui-nav-item">
        <a href="/Admin/Index/toOrder">新添订单</a>
    </li>
    <li class="layui-nav-item layui-nav-itemed" >
        <a href="javascript:;">订单管理</a>
        <dl class="layui-nav-child">
            <dd><a href="/Admin/Index/toOrderManager" class="layui-this">订单管理</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">司机信息</a>
        <dl class="layui-nav-child">

        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">车辆信息</a>
        <dl class="layui-nav-child">

        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">角色权限</a>
        <dl class="layui-nav-child">

        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">操作日记</a>
        <dl class="layui-nav-child">

        </dl>
    </li>
</ul>

<div class="allContent">
    <form class="layui-form" action="">
        <div class="layui-form-item toInline">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block">
                <select name="orderStatus" lay-verify="required" lay-filter="selectStatus">
                    <option value="3" id="orderStauts">全部</option>
                    <option value="0" id="orderStauts0">未接</option>
                    <option value="1" id="orderStauts1">已接</option>
                    <option value="2" id="orderStauts2">已完成</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item toInline">
            <label class="layui-form-label">订单号</label>
            <div class="layui-input-block">
                <input type="text" name="number" required  lay-verify="required" placeholder="请输入订单号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item  toInline">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formSearch" id="search">搜索</button>
            </div>
        </div>
    </form>

    <table class="layui-table">
        <colgroup>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>
            <tr>
                <th>订单号</th>
                <th>出发时间</th>
                <th>出车车牌号</th>
                <th>目的地</th>
                <th>状态</th>
                <th>司机编号</th>
                <th>提货单号</th>
                <th>合同号</th>
                <th>缺货信息</th>
                <th>提货数量</th>
                <th>提货时间</th>
                <th>结算单位</th>
            </tr>
        </thead>
        <tbody>

            <?php if(is_array($orderMessage)): foreach($orderMessage as $key=>$vo): ?><tr>
                    <td><?php echo ($vo["number"]); ?></td>
                    <td><?php echo ($vo["create_time"]); ?></td>
                    <td><?php echo ($vo["out_number"]); ?></td>
                    <td><?php echo ($vo["out_destination"]); ?></td>
                    <td><?php echo ($vo["mission_status"]); ?></td>
                    <td><?php echo ($vo["order_driver_number"]); ?></td>
                    <td><?php echo ($vo["pick_up_order"]); ?></td>
                    <td><?php echo ($vo["contract_number"]); ?></td>
                    <td><?php echo ($vo["out_of_stock_message"]); ?></td>
                    <td><?php echo ($vo["pick_up_quantity"]); ?></td>
                    <td><?php echo ($vo["pick_up_time"]); ?></td>
                    <td><?php echo ($vo["closing_unit"]); ?></td>
                </tr><?php endforeach; endif; ?>

        </tbody>
    </table>


</div>

<script src="/Public/layui/layui.js"></script>
<script src="/Public/jquery-3.3.1.min.js"></script>
<script src="/Application/Admin/Public/js/orderManager.js"></script>
</body>
</html>