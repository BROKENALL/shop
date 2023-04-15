<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>首页</title>

    <link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>

    <link href="basic/css/demo.css" rel="stylesheet" type="text/css"/>

    <link href="css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="js/index.js"></script>
    <script type="text/javascript">
        let vipName = "${vipName}";
    </script>
</head>

<body>
<div class="hmtop">
    <!--顶部导航条 -->
    <div class="am-container header">
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <a href="${ctx}" target="_top" class="h" id="please">${vipName},欢迎光临</a>
                    <a href="http://localhost:8080/vip/vipLogin" target="_top" class="h" id="please1">亲，请登录</a>
                    <a href="http://localhost:8080/vip/register" target="_top" id="please2">，免费注册</a>
                </div>
            </div>
        </ul>
        <ul class="message-r">
            <div class="topMessage home">
                <div class="menu-hd"><a href="index" target="_top" class="h">商城首页</a></div>
            </div>
            <div class="topMessage my-shangcheng">
                <div class="menu-hd MyShangcheng"><a href="frame/index" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
                </div>
            </div>
            <div class="topMessage mini-cart" id="shopcart">
                <div class="menu-hd"><a href="shopcart" id="mc-menu-hd" target="_top"><i
                        class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum"
                                                                                                 class="h">${cartNum}</strong></a>
                </div>
            </div>
            <div class="topMessage favorite">
                <div class="menu-hd"><a href="frame/collection" target="_top"><i
                        class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
            </div>
        </ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo"><img src="images/logo.png"/></div>
        <div class="logoBig">
            <li><img src="images/logobig.png"/></li>
        </div>

        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="javascript:void(0)"></a>
            <form id="search-input" action="search" method="post">
                <input id="searchInput" name="name" type="text" placeholder="搜索" autocomplete="off">
                <button id="ai-topsearch" class="submit am-btn">搜索</button>
            </form>

            <%--            <-- <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">--%>

        </div>
    </div>

    <div class="clear"></div>
</div>
<b class="line"></b>
<div class="shopNav">
    <div class="slideall" style="height: auto;">

        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="javascript:void(0)">首页</a></li>
                <li class="qc"><a href="javascript:void(0)">闪购</a></li>
                <li class="qc"><a href="javascript:void(0)">限时抢</a></li>
                <li class="qc"><a href="javascript:void(0)">团购</a></li>
                <li class="qc last"><a href="javascript:void(0)">大包装</a></li>
            </ul>
            <div class="nav-extra">
                <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
                <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
            </div>
        </div>

        <div class="bannerTwo">
            <!--轮播 -->
            <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
                <ul class="am-slides">
                    <li class="banner1"><a href="introduction.html"><img src="images/ad5.jpg"/></a></li>
                    <li class="banner2"><a><img src="images/ad6.jpg"/></a></li>
                    <li class="banner3"><a><img src="images/ad7.jpg"/></a></li>
                    <li class="banner4"><a><img src="images/ad8.jpg"/></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>

        <!--侧边导航 -->
        <div id="nav" class="navfull" style="position: static;">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">

                    <div class="category" style="box-shadow:none ;margin-top: 2px;">
                        <ul class="category-list navTwo" id="js_climit_li">
                            <c:forEach items="${cg}" var="c1">
                                <li>
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name"><i><img src="${c1.icon}"></i><a
                                                class="ml-22" title="${c1.name}">${c1.name}</a></h3>
                                        <em>&gt;</em></div>
                                    <div class="menu-item menu-in top">
                                        <div class="area-in">
                                            <div class="area-bg">
                                                <div class="menu-srot">
                                                    <div class="sort-side">
                                                        <c:forEach items="${c1.children}" var="c2">
                                                            <dl class="dl-sort">
                                                                <dt><span title="${c2.name}">${c2.name}</span></dt>
                                                                <c:forEach items="${c2.children}" var="c3">
                                                                    <dd><a title="${c3.name}"
                                                                           href="search?parentId=${c3.id}"><span>${c3.name}</span></a></dd>
                                                                </c:forEach>

                                                            </dl>

                                                        </c:forEach>

                                                    </div>
                                                    <div class="brand-side">
                                                        <dl class="dl-sort">
                                                            <dt><span>实力商家</span></dt>
                                                            <dd><a rel="nofollow" title="YYKCLOT" target="_blank"
                                                                   href="javascript:void(0)"
                                                                   rel="nofollow"><span class="red">YYKCLOT</span></a>
                                                            </dd>
                                                            <dd><a rel="nofollow" title="池氏品牌男装" target="_blank"
                                                                   href="javascript:void(0)" rel="nofollow"><span
                                                                    class="red">池氏品牌男装</span></a></dd>
                                                            <dd><a rel="nofollow" title="男装日志" target="_blank"
                                                                   href="javascript:void(0)"
                                                                   rel="nofollow"><span>男装日志</span></a></dd>
                                                            <dd><a rel="nofollow" title="索比诺官方旗舰店"
                                                                   target="_blank"
                                                                   href="javascript:void(0)" rel="nofollow"><span>索比诺官方旗舰店</span></a>
                                                            </dd>
                                                            <dd><a rel="nofollow" title="onTTno傲徒" target="_blank"
                                                                   href="javascript:void(0)" rel="nofollow"><span
                                                                    class="red">onTTno傲徒</span></a></dd>
                                                            <dd><a rel="nofollow" title="玛狮路男装旗舰店"
                                                                   target="_blank"
                                                                   href="javascript:void(0)" rel="nofollow"><span>玛狮路男装旗舰店</span></a>
                                                            </dd>
                                                            <dd><a rel="nofollow" title="劳威特品牌男装" target="_blank"
                                                                   href="javascript:void(0)"
                                                                   rel="nofollow"><span>劳威特品牌男装</span></a>
                                                            </dd>
                                                            <dd><a rel="nofollow" title="卡斯郎世家批发城"
                                                                   target="_blank"
                                                                   href="javascript:void(0)" rel="nofollow"><span
                                                                    class="red">卡斯郎世家批发城</span></a></dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <b class="arrow"></b>
                                </li>
                            </c:forEach>


                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <!--导航 -->
        <script type="text/javascript">
            (function () {
                $('.am-slider').flexslider();
            });
            $(document).ready(function () {
                $("li").hover(function () {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function () {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>


        <!--小导航 -->
        <div class="am-g am-g-fixed smallnav">
            <div class="am-u-sm-3">
                <a href="sort.html"><img src="images/navsmall.jpg"/>
                    <div class="title">商品分类</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="javascript:void(0)"><img src="images/huismall.jpg"/>
                    <div class="title">大聚惠</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="javascript:void(0)"><img src="images/mansmall.jpg"/>
                    <div class="title">个人中心</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="javascript:void(0)"><img src="images/moneysmall.jpg"/>
                    <div class="title">投资理财</div>
                </a>
            </div>
        </div>


        <!--各类活动-->
        <div class="row">
            <li><a><img src="images/row1.jpg"/></a></li>
            <li><a><img src="images/row2.jpg"/></a></li>
            <li><a><img src="images/row3.jpg"/></a></li>
            <li><a><img src="images/row4.jpg"/></a></li>
        </div>
        <div class="clear"></div>
        <!--走马灯 -->

        <div class="marqueenTwo">
            <span class="marqueen-title"><i class="am-icon-volume-up am-icon-fw"></i>商城头条<em
                    class="am-icon-angle-double-right"></em></span>
            <div class="demo">

                <ul>
                    <li class="title-first"><a target="_blank" href="javascript:void(0)">
                        <img src="images/TJ2.jpg"></img>
                        <span>[特惠]</span>洋河年末大促，低至两件五折
                    </a></li>
                    <li class="title-first"><a target="_blank" href="javascript:void(0)">
                        <span>[公告]</span>商城与广州市签署战略合作协议
                        <img src="images/TJ.jpg"></img>
                        <p>XXXXXXXXXXXXXXXXXX</p>
                    </a></li>
                    <li><a target="_blank" href="javascript:void(0)"><span>[特惠]</span>女生节商城爆品1分秒 </a></li>
                    <li><a target="_blank" href="javascript:void(0)"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
                    <li><a target="_blank" href="javascript:void(0)"><span>[特惠]</span>家电狂欢千亿礼券 买1送1！</a></li>
                    <li><a target="_blank" href="javascript:void(0)"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
                    <li><a target="_blank" href="javascript:void(0)"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>

                </ul>

            </div>
        </div>
        <div class="clear"></div>

    </div>


    <script type="text/javascript">
        if (640 > $(window).width()) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function () {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }

            $(function () {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">

        <!--热门活动 -->

        <div class="am-container">

            <div class="sale-mt">
                <i></i>
                <em class="sale-title">限时秒杀</em>
                <div class="s-time" id="countdown">
                    <span class="hh">01</span>
                    <span class="mm">20</span>
                    <span class="ss">59</span>
                </div>
            </div>
            <div class="am-g am-g-fixed sale">

                <c:forEach items="${cd}" var="cd1">
                    <c:if test="${cd1.state!=null}">
                        <div class="am-u-sm-3 sale-item">
                            <div class="s-img">
                                <a href="introduction?id=${cd1.id}"><img src="${cd1.photo}"/></a>
                            </div>
                            <div class="s-info">
                                <a href="introduction?id=${cd1.id}"><p class="s-title">${cd1.name}</p></a>
                                <div class="s-price">￥<b>${cd1.price}</b>
                                    <a class="s-buy" href="introduction?id=${cd1.id}">${cd1.state}</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="clear "></div>
        <div class="f1">
            <!--甜点-->
            <c:forEach items="${cg}" var="c1">
            <div class="am-container ">
                <div class="shopTitle ">
                    <h4 class="floor-title">${c1.name}</h4>
                    <div class="floor-subtitle"><em class="am-icon-caret-left"></em>
                        <h3>每一道甜品都有一个故事</h3></div>

                    <div class="today-brands " style="right:0px ;top:13px;">
                        <c:forEach items="${c1.children}" var="c2">
                            <a href="javascript:void(0) ">${c2.name}</a>
                        </c:forEach>
                    </div>


                </div>
            </div>

            <div class="am-g am-g-fixed floodSix ">
                <div class="am-u-sm-5 am-u-md-3 text-one list">
                    <div class="word">
                        <c:forEach items="${c1.children}" var="c21">
                            <c:forEach items="${c21.children}" var="c31">
                                <a class="outer" href="javascript:void(0)"><span class="inner"><b class="text">${c31.name}</b></span></a>
                            </c:forEach>
                        </c:forEach>
                    </div>


                    <c:forEach items="${c1.children}" var="c21">
                    <c:forEach items="${c21.children}" var="c31">
                    <c:forEach items="${c31.commodities}" var="cc" varStatus="status">
                    <c:if test="${status.count==1}">
                        <a href="javascript:void(0) ">
                            <img src="${cc.photo}"/>
                            <div class="outer-con ">
                                <div class="title ">
                                    零食大礼包开抢啦
                                </div>
                                <div class="sub-title ">
                                    当小鱼儿恋上软豆腐
                                </div>
                            </div>
                        </a>
                    </c:if>

                    <c:if test="${status.count==2}">
                    <div class="triangle-topright"></div>
                </div>

                <div class="am-u-sm-7 am-u-md-5 am-u-lg-2 text-two big">

                    <div class="outer-con ">
                        <div class="title ">
                            ${cc.name}
                        </div>
                        <div class="sub-title ">
                            ¥${cc.price}
                        </div>

                    </div>
                    <a href="introduction?commodityId=${cc.id}"><img src="${cc.photo}"/></a>
                </div>
                </c:if>
                
                <c:if test="${status.count==3}">
                    <li>
                        <div class="am-u-md-2 am-u-lg-2 text-three">
                            <div class="boxLi"></div>
                            <div class="outer-con ">
                                <div class="title ">
                                    ${cc.name}
                                </div>
                                <div class="sub-title ">
                                    ¥${cc.price}
                                </div>

                            </div>
                            <a href="javascript:void(0) "><img src="${cc.photo}"/></a>
                        </div>
                    </li>
                </c:if>

                <c:if test="${status.count==4}">
                    <li>
                        <div class="am-u-md-2 am-u-lg-2 text-three sug">
                            <div class="boxLi"></div>
                            <div class="outer-con ">
                                <div class="title ">
                                        ${cc.name}
                                </div>
                                <div class="sub-title ">
                                    ¥${cc.price}
                                </div>

                            </div>
                            <a href="javascript:void(0) "><img src="${cc.photo}"/></a>
                        </div>
                    </li>
                </c:if>

                <c:if test="${status.count==5}">
                    <li>
                        <div class="am-u-sm-4 am-u-md-5 am-u-lg-4 text-five">
                            <div class="boxLi"></div>
                            <div class="outer-con ">
                                <div class="title ">
                                        ${cc.name}
                                </div>
                                <div class="sub-title ">
                                    ¥${cc.price}
                                </div>

                            </div>
                            <a href="javascript:void(0) "><img src="${cc.photo}"/></a>
                        </div>
                    </li>
                </c:if>


                <c:if test="${status.count==6}">
                    <li>
                        <div class="am-u-sm-4 am-u-md-2 am-u-lg-2 text-six">
                            <div class="boxLi"></div>
                            <div class="outer-con ">
                                <div class="title ">
                                        ${cc.name}
                                </div>
                                <div class="sub-title ">
                                    ¥${cc.price}
                                </div>

                            </div>
                            <a href="javascript:void(0) "><img src="${cc.photo}"/></a>
                        </div>
                    </li>
                </c:if>

                <c:if test="${status.count==8}">
                    <li>
                        <div class="am-u-sm-4 am-u-md-2 am-u-lg-2 text-six">
                            <div class="boxLi"></div>
                            <div class="outer-con ">
                                <div class="title ">
                                        ${cc.name}
                                </div>
                                <div class="sub-title ">
                                    ¥${cc.price}
                                </div>

                            </div>
                            <a href="javascript:void(0) "><img src="${cc.photo}"/></a>
                        </div>
                    </li>
                </c:if>



                </c:forEach>
                </c:forEach>
                </c:forEach>

            </div>

            <div class="clear "></div>
        </div>
        </c:forEach>


        <div class="f2">
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
        </div>
    </div>
</div>
</div>

<!--引导 -->
<div class="navCir">
    <li class="active"><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="person/index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="javascript:void(0) ">
                    <span class="setting "></span>
                </a>
                <div class="ibar_login_box status_login ">
                    <div class="avatar_box ">
                        <p class="avatar_imgbox "><img src="images/no-img_mid_.jpg "/></p>
                        <ul class="user_info ">
                            <li>用户名：sl1903</li>
                            <li>级&nbsp;别：普通会员</li>
                        </ul>
                    </div>
                    <div class="login_btnbox ">
                        <a href="javascript:void(0) " class="login_order ">我的订单</a>
                        <a href="javascript:void(0) " class="login_favorite ">我的收藏</a>
                    </div>
                    <i class="icon_arrow_white "></i>
                </div>

            </div>
            <div id="shopCartNo" class="item ">
                <a href="shopcart">
                    <span class="message "></span>
                </a>
                <p>
                    购物车
                </p>
                <p class="cart_num ">${cartNum}</p>
            </div>
            <div id="asset " class="item ">
                <a href="javascript:void(0) ">
                    <span class="view "></span>
                </a>
                <div class="mp_tooltip ">
                    我的资产
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="foot " class="item ">
                <a href="javascript:void(0) ">
                    <span class="zuji "></span>
                </a>
                <div class="mp_tooltip ">
                    我的足迹
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="brand " class="item ">
                <a href="javascript:void(0)">
                    <span class="wdsc "><img src="images/wdsc.png "/></span>
                </a>
                <div class="mp_tooltip ">
                    我的收藏
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="broadcast " class="item ">
                <a href="javascript:void(0) ">
                    <span class="chongzhi "><img src="images/chongzhi.png "/></span>
                </a>
                <div class="mp_tooltip ">
                    我要充值
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div class="quick_toggle ">
                <li class="qtitem ">
                    <a href="javascript:void(0) "><span class="kfzx "></span></a>
                    <div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
                </li>
                <!--二维码 -->
                <li class="qtitem ">
                    <a href="#none "><span class="mpbtn_qrcode "></span></a>
                    <div class="mp_qrcode " style="display:none; "><img src="images/weixin_code_145.png "/><i
                            class="icon_arrow_white "></i></div>
                </li>
                <li class="qtitem ">
                    <a href="#top " class="return_top "><span class="top "></span></a>
                </li>
            </div>

            <!--回到顶部 -->
            <div id="quick_links_pop " class="quick_links_pop hide "></div>

        </div>

    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            我
        </div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            购物车
        </div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            资产
        </div>

        <div class="ia-head-list ">
            <a href="javascript:void(0) " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">优惠券</div>
            </a>
            <a href="javascript:void(0) " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">红包</div>
            </a>
            <a href="javascript:void(0) " target="_blank " class="pl money ">
                <div class="num ">￥0</div>
                <div class="text ">余额</div>
            </a>
        </div>

    </div>
    <div id="foot-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            足迹
        </div>
    </div>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            收藏
        </div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            充值
        </div>
    </div>
</div>
<script>
    window.jQuery || document.write('&lt;script src="basic/js/jquery.min.js">&lt;\/script>');
</script>
<script type="text/javascript " src="basic/js/quick_links.js "></script>
</body>

</html>