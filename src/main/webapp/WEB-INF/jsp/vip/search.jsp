<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>搜索页面</title>

    <link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>

    <link href="basic/css/demo.css" rel="stylesheet" type="text/css"/>

    <link href="css/seastyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        let vipName = "${vipName}";
        let pageNum = parseInt("${pi.pageNum}");
        let pages = parseInt("${pi.pages}");
        let commodityNULL = "${commodityNULL}";
        let kind = "${commodityBean.kind}"
        let category = "${commodityBean.category}"
        let price = "${commodityBean.price}"
    </script>

    <script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="lib/layer/layer.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/search.js"></script>

</head>

<body>

<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
                <a href="javascript:void(0)" target="_top" class="h" id="please">${vipName},欢迎光临</a>
                <a href="vipLogin" target="_top" class="h" id="please1">亲，请登录</a>
                <a href="http://localhost:8080/vip/register" target="_top" id="please2">，免费注册</a>
            </div>
        </div>
    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="index" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="frame" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
            </div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="shopcart" target="_top"><i
                    class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum"
                                                                                             class="h">0</strong></a>
            </div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="collection" target="_top"><i
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
        <form>
            <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
            <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
        </form>
    </div>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="search">
    <div class="search-list">
        <div class="nav-table">
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
        </div>
        <form action="search" id="search-input" method="post">
            <input id="clearinput" name="clear" type="hidden">
            <input id="kindinput" name="kind" type="hidden">
            <input id="categoryinput" name="category" type="hidden">
            <input id="priceinput" name="price" type="hidden">
        </form>

        <div class="am-g am-g-fixed">
            <div class="am-u-sm-12 am-u-md-12">
                <div class="theme-popover">
                    <ul class="select">
                        <div class="clear"></div>
                        <li class="select-result">
                            <dl>
                                <dt>已选</dt>
                                <dd class="select-no"></dd>
                                <p class="eliminateCriteria">清除</p>
                            </dl>
                        </li>
                        <div class="clear"></div>
                        <li class="select-list">
                            <dl id="select1">
                                <dt class="am-badge am-round">分类</dt>
                                <div class="dd-conent" id="kind">
                                    <dd class="select-all selected"><a href="javascript:void(0)">全部</a></dd>
                                    <c:forEach items="${kd}" var="kd">
                                        <dd><a id="${kd.kindId}" href="javascript:void(0)">${kd.name}</a></dd>
                                        <script type="text/javascript">
                                            if (kind == "${kd.name}") {
                                                $("#${kd.kindId}").parent().parent().children(":first-child").removeAttr("class");
                                                $("#${kd.kindId}").parent().addClass("select-all selected");
                                                $("#kindinput").val(kind);

                                            }
                                        </script>
                                    </c:forEach>
                                </div>

                            </dl>
                        </li>
                        <li class="select-list">
                            <dl id="select2">
                                <dt class="am-badge am-round">种类</dt>
                                <div class="dd-conent" id="category">
                                    <dd class="select-all selected"><a href="javascript:void(0)">全部</a></dd>
                                    <c:forEach items="${cg}" var="cg">
                                        <c:forEach items="${cg.children}" var="cg1">
                                            <dd><a href="javascript:void(0)" id="${cg1.id}">${cg1.name}</a>
                                                <input id="${cg1.name}input" value="${cg1.id}" type="hidden">
                                                <script type="text/javascript">
                                                    if (category ==${cg1.id}) {
                                                        console.log("wewewe");
                                                        $("#${cg1.id}").parent().parent().children(":first-child").removeAttr("class");
                                                        $("#${cg1.id}").parent().addClass("select-all selected");
                                                        $("#categoryinput").val(${cg1.id});
                                                    }
                                                </script>
                                            </dd>
                                        </c:forEach>
                                    </c:forEach>

                                </div>
                            </dl>
                        </li>
                        <li class="select-list">
                            <dl id="select3">
                                <dt class="am-badge am-round">价格</dt>
                                <div class="dd-conent">
                                    <dd class="select-all selected" id="price0"><a href="javascript:void(0)">全部</a>
                                    </dd>
                                    <dd><a href="javascript:void(0)" id="price1">0--50</a></dd>
                                    <dd><a href="javascript:void(0)" id="price2">50--150</a></dd>
                                    <dd><a href="javascript:void(0)" id="price3">150--250</a></dd>
                                    <dd><a href="javascript:void(0)" id="price4">250以上</a></dd>
                                </div>
                            </dl>
                        </li>

                    </ul>
                    <div class="clear"></div>
                </div>
                <div class="search-content">
                    <div class="sort">
                        <li class="first"><a title="综合">综合排序</a></li>
                        <li><a title="销量">销量排序</a></li>
                        <li><a title="价格">价格优先</a></li>
                        <li class="big"><a title="评价" href="javascript:void(0)">评价为主</a></li>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">

                        <c:forEach items="${cm}" var="cm">
                            <li>
                                <div class="i-pic limit">

                                    <a href="introduction?commodityId=${cm.id}"><img src="${cm.photo}"/>
                                        <p class="title fl">${cm.name}</p>
                                        <p class="price fl">
                                            <b>¥</b>
                                            <strong>${cm.price}</strong>
                                        </p>
                                        <p class="number fl">
                                            销量<span>${cm.hot}</span>
                                        </p>
                                    </a>

                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="search-side">

                    <div class="side-title">
                        爆卖
                    </div>

                    <c:forEach items="${cm}" var="cm" begin="0" end="2">
                        <input value="${cm.id}" type="hidden"/>
                        <li id="shop">
                            <div class="i-pic check">
                                <img src="${cm.photo}"/>
                                <p class="check-title">${cm.name}</p>
                                <p class="price fl">
                                    <b>¥</b>
                                    <strong>${cm.price}</strong>
                                </p>
                                <p class="number fl">
                                    销量<span>${cm.hot}</span>
                                </p>
                            </div>
                        </li>
                    </c:forEach>


                </div>
                <div class="clear"></div>
                <!--分页 -->

                <ul id="sizeController" class="am-pagination am-pagination-right">
                    <li><a id="am-first" href="javascript:void(0)">&laquo;</a></li>
                    <c:forEach begin="${pi.navigateFirstPage}" end="${pi.navigateLastPage}" var="p">
                        <c:choose>
                            <c:when test="${p==pi.pageNum}">
                                <li class="am-active"><a href="javascript:void(0)">${p}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="p" href="javascript:void(0)">${p}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <li><a id="am-last" href="javascript:void(0)">&raquo;</a></li>
                </ul>

            </div>
        </div>
        <div class="footer">
            <div class="footer-hd">
                <p>
                    <a href="javascript:void(0)">恒望科技</a>
                    <b>|</b>
                    <a href="javascript:void(0)">商城首页</a>
                    <b>|</b>
                    <a href="javascript:void(0)">支付宝</a>
                    <b>|</b>
                    <a href="javascript:void(0)">物流</a>
                </p>
            </div>
            <div class="footer-bd">
                <p>
                    <a href="javascript:void(0)">关于恒望</a>
                    <a href="javascript:void(0)">合作伙伴</a>
                    <a href="javascript:void(0)">联系我们</a>
                    <a href="javascript:void(0)">网站地图</a>

                </p>
            </div>
        </div>
    </div>

</div>

<!--引导 -->
<div class="navCir">
    <li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="person/index.html"><i class="am-icon-user"></i>我的</a></li>
</div>

<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item">
                <a href="javascript:void(0)">
                    <span class="setting"></span>
                </a>
                <div class="ibar_login_box status_login">
                    <div class="avatar_box">
                        <p class="avatar_imgbox"><img src="images/no-img_mid_.jpg"/></p>
                        <ul class="user_info">
                            <li>用户名：sl1903</li>
                            <li>级&nbsp;别：普通会员</li>
                        </ul>
                    </div>
                    <div class="login_btnbox">
                        <a href="javascript:void(0)" class="login_order">我的订单</a>
                        <a href="javascript:void(0)" class="login_favorite">我的收藏</a>
                    </div>
                    <i class="icon_arrow_white"></i>
                </div>

            </div>
            <div id="shopCart" class="item">
                <a href="javascript:void(0)">
                    <span class="message"></span>
                </a>
                <p>
                    购物车
                </p>
                <p class="cart_num">0</p>
            </div>
            <div id="asset" class="item">
                <a href="javascript:void(0)">
                    <span class="view"></span>
                </a>
                <div class="mp_tooltip">
                    我的资产
                    <i class="icon_arrow_right_black"></i>
                </div>
            </div>

            <div id="foot" class="item">
                <a href="javascript:void(0)">
                    <span class="zuji"></span>
                </a>
                <div class="mp_tooltip">
                    我的足迹
                    <i class="icon_arrow_right_black"></i>
                </div>
            </div>

            <div id="brand" class="item">
                <a href="javascript:void(0)">
                    <span class="wdsc"><img src="images/wdsc.png"/></span>
                </a>
                <div class="mp_tooltip">
                    我的收藏
                    <i class="icon_arrow_right_black"></i>
                </div>
            </div>

            <div id="broadcast" class="item">
                <a href="javascript:void(0)">
                    <span class="chongzhi"><img src="images/chongzhi.png"/></span>
                </a>
                <div class="mp_tooltip">
                    我要充值
                    <i class="icon_arrow_right_black"></i>
                </div>
            </div>

            <div class="quick_toggle">
                <li class="qtitem">
                    <a href="javascript:void(0)"><span class="kfzx"></span></a>
                    <div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
                </li>
                <!--二维码 -->
                <li class="qtitem">
                    <a href="javascript:void(0)"><span class="mpbtn_qrcode"></span></a>
                    <div class="mp_qrcode" style="display:none;"><img src="images/weixin_code_145.png"/><i
                            class="icon_arrow_white"></i></div>
                </li>
                <li class="qtitem">
                    <a href="javascript:void(0)" class="return_top"><span class="top"></span></a>
                </li>
            </div>

            <!--回到顶部 -->
            <div id="quick_links_pop" class="quick_links_pop hide"></div>

        </div>

    </div>
    <div id="prof-content" class="nav-content">
        <div class="nav-con-close">
            <i class="am-icon-angle-right am-icon-fw"></i>
        </div>
        <div>
            我
        </div>
    </div>
    <div id="shopCart-content" class="nav-content">
        <div class="nav-con-close">
            <i class="am-icon-angle-right am-icon-fw"></i>
        </div>
        <div>
            购物车
        </div>
    </div>
    <div id="asset-content" class="nav-content">
        <div class="nav-con-close">
            <i class="am-icon-angle-right am-icon-fw"></i>
        </div>
        <div>
            资产
        </div>

        <div class="ia-head-list">
            <a href="javascript:void(0)" target="_blank" class="pl">
                <div class="num">0</div>
                <div class="text">优惠券</div>
            </a>
            <a href="javascript:void(0)" target="_blank" class="pl">
                <div class="num">0</div>
                <div class="text">红包</div>
            </a>
            <a href="javascript:void(0)" target="_blank" class="pl money">
                <div class="num">￥0</div>
                <div class="text">余额</div>
            </a>
        </div>

    </div>
    <div id="foot-content" class="nav-content">
        <div class="nav-con-close">
            <i class="am-icon-angle-right am-icon-fw"></i>
        </div>
        <div>
            足迹
        </div>
    </div>
    <div id="brand-content" class="nav-content">
        <div class="nav-con-close">
            <i class="am-icon-angle-right am-icon-fw"></i>
        </div>
        <div>
            收藏
        </div>
    </div>
    <div id="broadcast-content" class="nav-content">
        <div class="nav-con-close">
            <i class="am-icon-angle-right am-icon-fw"></i>
        </div>
        <div>
            充值
        </div>
    </div>
</div>
<script>
    window.jQuery || document.write('&lt;script src="basic/js/jquery-1.9.min.js">&lt;\/script>');
</script>
<script type="text/javascript" src="basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

</body>

</html>