(function ($) {
    $.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
})(jQuery);

$(window).ready(function() {
    //全局变量
    var url = "/Admin/Order/searchOrder?missionStatus=3";
    var editData = "";

    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
    });

    layui.use('form', function () {
        var form = layui.form;
        var selectDatas = {};
        selectDatas.missionStatus = 3;
        var  missionStatus = $.getUrlParam('missionStatus');
        if (missionStatus==="1") {
            $("select[name=orderStatus]").val("1");
            form.render('select');
        } else if (missionStatus==="0") {
            $("select[name=orderStatus]").val("0");
            form.render('select');
        } else if (missionStatus==="2") {
            $("select[name=orderStatus]").val("2");
            form.render('select');
        }

        //监听提交
        form.on('submit(formSearch)', function (data) {
            var datas = data.field;
            datas.orderStatus = selectDatas.missionStatus;
            url = url +"&orderNumber=" + datas.number;
            layui.use('table', function() {
                var table = layui.table;
                table.reload('order', {
                    url: url
                });
            });
            // $.ajax({
            //     url: "/Admin/Order/searchOrder",
            //     type: 'post',
            //     dataType: 'json',
            //     data: datas,
            //     success: function (data, status) {
            //         alert(data);
            //     },
            //     fail: function (err, status) {
            //         console.log(err)
            //     }
            // });
            return false;
        });

        form.on('select(selectStatus)', function(data){
            selectDatas.missionStatus = data.value;

            url = "/Admin/Order/searchOrder?missionStatus=" + selectDatas.missionStatus;
            layui.use('table', function() {
                var table = layui.table;
                table.reload('order', {
                    url: url
                });
            });
            // $.ajax({
            //     url: "/Admin/Order/searchType",
            //     type: 'post',
            //     dataType: 'json',
            //     data: selectDatas,
            //     success: function (data, status) {
            //         alert(data);
            //     },
            //     fail: function (err, status) {
            //         console.log(err)
            //     }
            // });
            return false;
        });
    });

    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#order'
            ,height: 515
            ,limit: 11
            ,url: '/Admin/Order/searchOrder' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'number', title: '订单号', width:190, sort: true, fixed: 'left'}
                ,{field: 'create_time', title: '出发时间', width:160, edit: "text"}
                ,{field: 'out_number', title: '出车车牌号', width:120, sort: true, edit: "text"}
                ,{field: 'out_destination', title: '目的地', width: 177, edit: "text"}
                ,{field: 'mission_status', title: '状态', width: 80, sort: true, edit: "text"}
                ,{field: 'order_driver_number', title: '司机编号', width: 80, sort: true, edit: "text"}
                ,{field: 'pick_up_order', title: '提货单号', width: 80, edit: "text"}
                ,{field: 'contract_number', title: '合同号', width: 120, sort: true, edit: "text"}
                ,{field: 'out_of_stock_message', title: '缺货信息', width: 120, sort: true, edit: "text"}
                ,{field: 'pick_up_quantity', title: '提货数量', width: 120, sort: true, edit: "text"}
                ,{field: 'pick_up_time', title: '提货时间', width: 120, sort: true, edit: "text"}
                ,{field: 'closing_unit', title: '结算单位', width: 120, sort: true, edit: "text"}
                ,{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'}
            ]]
        });

        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'del'){ //删除
                console.log(data);
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: "/Admin/Order/deleteOrder",
                        type: 'post',
                        dataType: 'json',
                        data: data,
                        success: function (data, status) {
                            console.log(data);
                        },
                        fail: function (err, status) {
                            console.log(err)
                        }
                    });
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                if(editData != ""){
                    if(editData.data.id === data.id) {
                        alert(editData.data.number);

                        $.ajax({
                            url: "/Admin/Order/editOrder",
                            type: 'post',
                            dataType: 'json',
                            data: {
                                "field" : editData.field,
                                "value" : editData.value,
                                "id"    : editData.data.id
                            },
                            success: function (data, status) {
                                console.log(data);
                            },
                            fail: function (err, status) {
                                console.log(err)
                            }
                        });
                    }
                }

            }
        });
        table.on('edit(test)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
            console.log(obj.value); //得到修改后的值
            console.log(obj.field); //当前编辑的字段名
            console.log(obj.data); //所在行的所有相关数据
            editData = obj;
        });

    });

});