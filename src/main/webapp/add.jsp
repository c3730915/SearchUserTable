<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<script>
    var flag =0;
    window.onload = function () {
        document.getElementById("age").onblur = check_age;
        document.getElementById("qq").onblur = check_qq;
        document.getElementById("email").onblur = check_email;
        //注意函数后面不要带（）
        document.getElementById("submit").onclick = check_submit;
    }
    function check_age() {
        flag =true;
        var age_msg = document.getElementById("age_check");
        age_msg.innerHTML= "";
        var age = document.getElementById("age").value;
        var reg_age =/^(?:[1-9][0-9]?|1[01][0-9]|120)$/;
        //年龄的正则表达式，0到120
        flag = reg_age.test(age);
        if (flag != true){
           age_msg.innerHTML="年龄输入有误，请输入数字"
            var button_subbmit = document.getElementById("submit");
           // button_subbmit.setAttribute("disabled", true);

        }else {

            age_msg.innerHTML=""
            // button_subbmit.setAttribute("disabled", false);
        }
        return flag;
    }
    function  check_qq() {
        flag =true;
        var qq_msg = document.getElementById("qq_check");
        qq_msg.innerHTML=""
        var qq = document.getElementById("qq").value;
        var reg_qq =  /[1-9][0-9]{4,14}/;
        flag = reg_qq.test(qq);
       if (flag != true){
           qq_msg.innerHTML="qq号码输入有误！"
       }else {
           qq_msg.innerHTML=""
       }
        return flag;

    }
    function check_email() {
        flag =true;
        var email_msg = document.getElementById("email_check");
        email_msg.innerHTML=""
        var email = document.getElementById("email").value;
        var reg_email =  /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
        flag = reg_email.test(email);
        if (flag != true){
            email_msg.innerHTML="email码输入有误！"
        }else {
            email_msg.innerHTML=""
        }
        return flag;


    }
    function check_submit() {
        return check_age() && check_qq() && check_email();


    }
</script>
<body>
<div class="container">
    <center><h3>添加联系人页面</h3></center>
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="gender" value="男" checked="checked"/>男
            <input type="radio" name="gender" value="女"/>女
        </div>

        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄">
            <span style="color: red" id="age_check"></span>
        </div>

        <div class="form-group">
            <label for="address">籍贯：</label>
            <select name="address" class="form-control" id="address">
                <option value="陕西">陕西</option>
                <option value="北京">北京</option>
                <option value="上海">上海</option>
            </select>
        </div>

        <div class="form-group">
            <label for="qq">QQ：</label>
            <input type="text" class="form-control" id="qq" name="qq" placeholder="请输入QQ号码"/>
            <span style="color: red" id="qq_check"></span>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱地址"/>
            <span style="color: red" id="email_check"></span>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" id="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" value="返回" />
        </div>
    </form>
</div>
</body>
</html>