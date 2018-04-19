$(window).ready(function(){
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            var datas = data.field;
            var action = data.form.action;
            $.ajax({
                url: "/Home/Index/login",
                type: 'post',
                dataType: 'json',
                data: datas,
                success: function (data, status) {
                    window.location = "/Home/Index/toPublicOrder";
                },
                fail: function (err, status) {
                    console.log(err)
                }
            });
            return false;
        });
    });
});
