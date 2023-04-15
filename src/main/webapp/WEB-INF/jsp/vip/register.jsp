<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <base href="${ctx }/">
    <meta charset="utf-8" />
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="vip/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
    <link href="vip/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="vip/lib/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="vip/lib/layer/layer.js"></script>
    <script type="text/javascript">
        let error = "${error}";
        let success="${success}";
    </script>
    <script type="text/javascript" src="vip/js/register.js"></script>
<body>

<div class="login-boxtitle">
    <a href="home/demo.html"><img alt="" src="vip/mages/logobig.png" /></a>
</div>

<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="vip/images/big.jpg" /></div>
        <div class="login-box">

            <div class="am-tabs" id="doc-my-tabs">
                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li class="am-active"><a href="">账号注册</a></li>

                </ul>

                <div class="am-tabs-bd">
                    <div class="am-tab-panel am-active">
                        <form method="post" action="vip/register" id="logining" >

                            <div class="user-email">
                                <label for="email"><i class="am-icon-envelope-o"></i></label>
                                <input type="email" name="id" id="email" placeholder="请输入账号">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="passwordRepeat" placeholder="确认密码">
                            </div>

                        </form>

                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="button" id="login-btn" value="注册">
                        </div>

                    </div>

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