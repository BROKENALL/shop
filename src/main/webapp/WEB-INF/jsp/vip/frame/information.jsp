<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人资料</title>

    <link href="http://localhost:8080/vip/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/vip/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="http://localhost:8080/vip/css/personal.css" rel="stylesheet" type="text/css">
    <link href="http://localhost:8080/vip/css/infstyle.css" rel="stylesheet" type="text/css">
    <script src="http://localhost:8080/vip/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="http://localhost:8080/vip/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="http://localhost:8080/vip/lib/jquery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="http://localhost:8080/vip/lib/layui/layui.js"></script>
</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header">
                <ul class="message-r">
                    <div class="topMessage home">
                        <div class="menu-hd"><a href="http://localhost:8080/vip/index" target="_top"
                                                class="h">商城首页</a></div>
                    </div>
                    <div class="topMessage my-shangcheng">
                        <div class="menu-hd MyShangcheng"><a href="http://localhost:8080/vip/frame/index" target="_top"><i
                                class="am-icon-user am-icon-fw"></i>个人中心</a></div>
                    </div>
                    <div class="topMessage mini-cart">
                        <div class="menu-hd"><a id="mc-menu-hd" href="http://localhost:8080/vip/shopcart" target="_top"><i
                                class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
                                id="J_MiniCartNum" class="h">0</strong></a></div>
                    </div>
                    <div class="topMessage favorite">
                        <div class="menu-hd"><a href="#" target="_top"><i
                                class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
                    </div>

                    <!--悬浮搜索框-->


                    <div class="clear"></div>
                </ul>
            </div>
        </div>
    </article>
</header>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
                    </div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">
                    <form action="information/updataPhoto" method="post" id="updata-photo"
                          enctype="multipart/form-data">
                        <div class="filePic">
                            <script>
                                function handleFiles(files) {
                                    $("#updata-photo").submit();
                                }
                            </script>
                            <input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
                                   name="file" onchange="handleFiles(this.files)">
                            <img class="am-circle am-img-thumbnail" src="http://localhost:8080/photo/${vip.photo}"
                                 alt=""/>
                        </div>
                    </form>
                    <p class="am-form-help">头像</p>

                    <div class="info-m">
                        <div><b>用户名：<i>${vip.nickName}</i></b></div>
                    </div>
                </div>

                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal" method="post" action="information/vipUpdata" id="vip-updata">
                        <input name="id" value="${vip.id}" type="hidden">
                        <div class="am-form-group">
                            <label for="user-name2" class="am-form-label">昵称</label>
                            <div class="am-form-content">
                                <input type="text" id="user-name" value="${vip.nickName}" name="nickName">
                                <small>昵称长度不能超过40个汉字</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">姓名</label>
                            <div class="am-form-content">
                                <input type="text" id="user-name2" value="${vip.name}" name="name">

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">性别</label>
                            <div class="am-form-content sex">
                                <c:if test="${vip.sex.equals(\"男\")}">
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="男" data-am-ucheck checked="checked">
                                        男
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="女" data-am-ucheck> 女
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="保密" data-am-ucheck> 保密
                                    </label>
                                </c:if>
                                <c:if test="${vip.sex.equals(\"女\")}">
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="男" data-am-ucheck> 男
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="女" data-am-ucheck checked="checked">
                                        女
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="保密" data-am-ucheck> 保密
                                    </label>
                                </c:if>
                                <c:if test="${empty vip.sex}">
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="男" data-am-ucheck> 男
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="女" data-am-ucheck> 女
                                    </label>
                                    <label class="am-radio-inline">
                                        <input type="radio" name="sex" value="保密" data-am-ucheck
                                               checked="checked"> 保密
                                    </label>
                                </c:if>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">生日</label>
                            <div class="am-form-content birth">
                                <input type="text" value="${vip.birthday}" placeholder="格式为yyyy-MM-dd" name="birthday">
                            </div>

                        </div>
                        <div class="am-form-group">
                            <label for="user-phone" class="am-form-label">电话</label>
                            <div class="am-form-content">
                                <input id="user-phone" value="${vip.phone}" type="tel" name="phone">

                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-email" class="am-form-label">电子邮件</label>
                            <div class="am-form-content">
                                <input id="user-email" value="${vip.email} " type="email" name="email">
                            </div>
                        </div>

                        <div class="info-btn">
                            <div class="am-btn am-btn-danger" id="save-vip">保存修改</div>
                        </div>
                        <script type="text/javascript">
                            $("#save-vip").click(function () {
                                $("#vip-updata").submit();
                            })
                        </script>

                    </form>
                </div>

            </div>

        </div>
        <!--底部-->
        <div class="footer">
            <div class="footer-hd">
                <p>
                    <a href="#">恒望科技</a>
                    <b>|</b>
                    <a href="#">商城首页</a>
                    <b>|</b>
                    <a href="#">支付宝</a>
                    <b>|</b>
                    <a href="#">物流</a>
                </p>
            </div>
            <div class="footer-bd">
                <p>
                    <a href="#">关于恒望</a>
                    <a href="#">合作伙伴</a>
                    <a href="#">联系我们</a>
                    <a href="#">网站地图</a>
                    <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank"
                                                                       title="模板之家">模板之家</a> - Collect from <a
                            href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
                </p>
            </div>
        </div>
    </div>


</div>

</body>

</html>