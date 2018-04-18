$(window).ready(function() {
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
        //监听提交
        form.on('submit(formSearch)', function (data) {
            var datas = data.field;
            datas.orderStatus = selectDatas.missionStatus;
            $.ajax({
                url: "/Admin/Order/searchOrder",
                type: 'post',
                dataType: 'json',
                data: datas,
                success: function (data, status) {
                    alert(data);
                },
                fail: function (err, status) {
                    console.log(err)
                }
            });
            return false;
        });

        form.on('select(selectStatus)', function(data){
            selectDatas.missionStatus = data.value;

            window.location = "toOrderManager?missionStaus=" + selectDatas.missionStatus;
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
});