$(window).ready(function() {
    layui.use('element', function () {
        var element = layui.element;

        //…
    });

    $("#loginOff").click(function () {
        var username = $.cookie("username");
        $.ajax({
            url: "/Home/Index/loginOff",
            type: 'post',
            dataType: 'json',
            data: username,
            success: function (data, status) {
                alert(data);
                if (data == "成功退出") {
                    $.cookie("username");
                    window.location = "/Home/Index/toLogin";
                }
            },
            fail: function (err, status) {
                console.log(err)
            }
        });
    });
});