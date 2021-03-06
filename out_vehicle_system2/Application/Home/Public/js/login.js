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
                    if (data == "登录失败") {
                        alert("账号或密码错误");
                        window.location = "/Home/Index/index";
                    } else {
                        alert("登录成功");
                        $.cookie("username", datas.mobile_number, { path: "/"});
                        $.cookie('head', data, { path: "/"});
                        window.location = "/Home/Index/toPublicOrder";
                    }
                },
                fail: function (err, status) {
                    console.log(err)
                }
            });
            return false;
        });
    });
});
