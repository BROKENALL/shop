<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/amazeui.css" />
    <link href="css/dlstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="lib/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="lib/layer/layer.js"></script>
    <script type="text/javascript">
        let error = "${error}";
        let id="${vipId}";
    </script>
    <script type="text/javascript" src="js/login.js"></script>
</head>

<body>

<div class="login-boxtitle">
    <a href="home.html"><img alt="logo" src="images/logobig.png" /></a>
</div>

<div class="login-banner">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="images/big.jpg" /></div>
        <div class="login-box">

            <h3 class="title">登录商城</h3>

            <div class="clear"></div>

            <div class="login-form">
                <form id="logining" action="vipLogin" method="post">
                    <div class="user-name">
                        <label for="username"><i class="am-icon-user"></i></label>
                        <input type="text" name="id" id="username" placeholder="请输入账号" >
                    </div>
                    <div class="user-pass">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name="password" id="password" placeholder="请输入密码">
                    </div>
                </form>
            </div>

            <div class="login-links">
                <label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
                <a href="javascript:void(0)" class="am-fr">忘记密码</a>
                <a href="http://localhost:8080/vip/register" class="zcnext am-fr am-btn-default">注册</a>
                <br />
            </div>
            <div class="am-cf">
                <input type="button" id="login-btn" value="登录">
            </div>
            <div class="partner">
                <h3>合作账号</h3>
                <div class="am-btn-group">
                    <li><a href="javascript:void(0)"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
                    <li><a href="javascript:void(0)"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
                    <li><a href="javascript:void(0)"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="footer ">
    <div class="footer-hd ">
        <p>
            <a href="javascript:void(0) ">恒望科技</a>
            <b>|</b>
            <a href="javascript:void(0) ">商城首页</a>
            <b>|</b>
            <a href="javascript:void(0) ">支付宝</a>
            <b>|</b>
            <a href="javascript:void(0) ">物流</a>
        </p>
    </div>
    <div class="footer-bd ">
        <p>
            <a href="javascript:void(0) ">关于恒望</a>
            <a href="javascript:void(0) ">合作伙伴</a>
            <a href="javascript:void(0) ">联系我们</a>
            <a href="javascript:void(0) ">网站地图</a>
        </p>
    </div>
</div>
</body>

</html>
