(function ($) {
    $.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
})(jQuery);

$(window).ready(function() {
    var startTime;
    var endTime;

    layui.use('element', function () {
        var element = layui.element;
        //一些事件监听
        element.on('tab(demo)', function (data) {
            console.log(data);
        });
    });

    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formSearch)', function (data) {
            var datas = data.field;
            startTime = datas.startTime;
            endTime = datas.endTime;
            var url = "/Admin/Log/searchLog?" + "startTime=" + startTime + "&endTime=" + endTime;
            layui.use('table', function() {
                var table = layui.table;
                table.reload('log', {
                    url: url
                });
            });
            return false;
        });
    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#time1', //指定元素
            format: 'yyyy-MM-dd HH:mm',
            type: 'datetime'
        });
    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#time2', //指定元素
            format: 'yyyy-MM-dd HH:mm',
            type: 'datetime'
        });
    });

    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#log'
            ,height: 515
            ,limit: 11
            ,url: '/Admin/Log/searchLog' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'type', title: '类型', width:190, sort: true, fixed: 'left'}
                ,{field: 'manager_name', title: '操作者', width:190, sort: true, fixed: 'left'}
                ,{field: 'table_name', title: '修改表名', width:160, edit: "text"}
                ,{field: 'number', title: '编号', width:200, sort: true, edit: "text"}
                ,{field: 'key', title: '修改字段', width: 177, edit: "text"}
                ,{field: 'value', title: '修改前的值', width: 80, sort: true, edit: "text"}
                ,{field: 'current_value', title: '修改后的值', width: 200, sort: true, edit: "text"}
                ,{field: 'alert_time', title: '修改时间', width: 200, sort: true, edit: "text"}
            ]]
        });
    });
});