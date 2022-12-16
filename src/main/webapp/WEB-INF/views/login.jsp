<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400');
        body, html {
            font-family: 'Source Sans Pro', sans-serif;
            background-color:antiquewhite;
            padding: 0;
            margin: 0;
        }
        #particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
        }
        .container{
            margin: 0;
            top: 50%;
            left: 50%;
            position: absolute;
            text-align: center;
            transform: translateX(-50%) translateY(-50%);
            background-color: rgb(255, 255, 255);
            border-radius: 9px;
            width: 400px;
            height: 250px;
            box-shadow: 5px 5px 30px 0px rgb(16, 16, 16);
        }
        .box h4 {
            font-family: 'Source Sans Pro', sans-serif;
            color: coral;
            font-size: 40pt;
            margin-top:90px;
            margin-bottom: -10px;
        }
        .box h4 span {
            color: #ff3737;
            font-weight: 1000;
            font-size: 40pt;
        }
        .box h5 {
            font-family: 'Source Sans Pro', sans-serif;
            font-size: 13px;
            color: #a1a4ad;
            letter-spacing: 1.5px;
        }
        .box input[type = "text"],.box input[type = "password"] {
            display: block;
            margin: 20px auto;
            background: #ffffff;
            border: 1px solid #d2d2d2;
            border-radius: 5px;
            padding: 14px 10px;
            width: 320px;
            outline: none;
            color: rgb(119, 119, 122);
            -webkit-transition: all .2s ease-out;
            -moz-transition: all .2s ease-out;
            -ms-transition: all .2s ease-out;
            -o-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }
        ::-webkit-input-placeholder {
            color: rgba(210, 210, 210, 0.83);
        }
        .box input[type = "text"]:focus,.box input[type = "password"]:focus {
            border: 1px solid rgba(255, 104, 47, 0.96);
        }
        a{
            color: #ff7e1d;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        <%--label input[type = "checkbox"] {
            display: none; /* hide the default checkbox */
        } --%>
        /* style the artificial checkbox */
        label span {
            height: 13px;
            width: 13px;
            border: 2px solid #464d64;
            border-radius: 2px;
            display: inline-block;
            position: relative;
            cursor: pointer;
            float: left;
            left: 7.5%;
        }
        .btn1 {
            border:0;
            background: rgb(125, 143, 105);
            color: #fafafa;
            border-radius: 100px;
            width: 340px;
            height: 49px;
            font-size: 16px;
            position: absolute;
            top: 67.5%;
            left: 8%;
            transition: 0.3s;
            cursor: pointer;
        }
        .btn1:hover {
            background: rgb(125, 143, 105);
        }
        .rmb {
            position: absolute;
            margin-left: -37%;
            margin-top: 0px;
            color: #ff7e1d;
            font-size: 13px;
        }
        .forgetpass {
            position: relative;
            float: right;
            right: 28px;
        }
        .dnthave{
            position: absolute;
            top: 92%;
            left: 24%;
        }
        [type=checkbox]:checked + span:before {/* <-- style its checked state */
            font-family: FontAwesome;
            font-size: 16px;
            content: "\f00c";
            position: absolute;
            top: -4px;
            color: #896cec;
            left: -1px;
            width: 13px;
        }
        .typcn {
            position: absolute;
            left: 339px;
            top: 282px;
            color: #3b476b;
            font-size: 22px;
            cursor: pointer;
        }
        .typcn.active {
            color: #7f60eb;
        }
        .error {
            background: #ff3333;
            text-align: center;
            width: 337px;
            height: 20px;
            padding: 2px;
            border: 0;
            border-radius: 5px;
            margin: 10px auto 10px;
            position: absolute;
            top: 31%;
            left: 7.2%;
            color: white;
            display: none;
        }
    </style>
    <script>
        function login_fail(id) {
            if(id===0){
                var a = confirm("로그인 실패");
            }
        }
    </script>
</head>
<body id="particles-js"></body>
<div class="animated bounceInDown">
    <div class="container">
        <script>login_fail(${login_f})</script>
        <span class="error animated tada" id="msg"></span>
        <form name="form1" class="box" method="post" action="loginOk">
            <input type="text" name="userid" placeholder="userid" autocomplete="off">
            <i class="typcn typcn-eye" id="eye"></i>
            <input type="password" name="password" placeholder="passsword" id="pwd" autocomplete="off">

            <input type="submit" value="Sign in" class="btn1">
        </form>
    </div>
</div>
</html>

