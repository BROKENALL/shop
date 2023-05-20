<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>订单管理</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/orstyle.css" rel="stylesheet" type="text/css">

    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript">
        const CREATED = "CREATED";
    </script>

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
                        <div class="menu-hd"><a href="http://localhost:8080/vip/index" target="_top" class="h">商城首页</a></div>
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

<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-order">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> /
                        <small>Order</small></div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">所有订单</a></li>
                        <li><a href="#tab2">待付款</a></li>
                        <li><a href="#tab3">待发货</a></li>
                        <li><a href="#tab4">待收货</a></li>
                        <li><a href="#tab5">待评价</a></li>
                    </ul>

                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>


                            <div class="order-main">
                                <div class="order-list">
                                    <c:forEach items="${order}" var="orderlist">

                                        <!--交易成功-->
                                        <div class="order-status5">
                                            <div class="order-title">
                                                <div class="order-title">
                                                    <div class="dd-num">订单编号：<a
                                                            href="javascript:;">${orderlist.orderCode}</a></div>
                                                    <span>成交时间：${orderlist.orderTime}</span>
                                                    <!--    <em>店铺：小桔灯</em>-->
                                                </div>
                                                <!--    <em>店铺：小桔灯</em>-->
                                            </div>

                                            <div class="order-content">
                                                <div class="order-left">
                                                    <c:forEach items="${orderlist.orderItemList}" var="order">
                                                        <ul class="item-list">

                                                            <li class="td td-item">
                                                                <div class="item-pic">
                                                                    <a href="#" class="J_MakePoint">
                                                                        <img src="../${order.commodityPhoto}"
                                                                             class="itempic J_ItemImg">
                                                                    </a>
                                                                </div>
                                                                <div class="item-info">
                                                                    <div class="item-basic-info">
                                                                        <a href="#">
                                                                            <p>${order.commodityName}</p>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="td td-price">
                                                                <div class="item-price">
                                                                        ${order.price}
                                                                </div>
                                                            </li>
                                                            <li class="td td-number">
                                                                <div class="item-number">
                                                                    <span>×</span>${order.number}
                                                                </div>
                                                            </li>
                                                            <li class="td td-operation">
                                                                <div class="item-operation">

                                                                </div>
                                                            </li>

                                                        </ul>
                                                    </c:forEach>
                                                </div>

                                                <div class="order-right">
                                                    <li class="td td-amount">
                                                        <div class="item-amount">
                                                            合计：${orderlist.total}
                                                        </div>
                                                    </li>
                                                    <div class="move-right">
                                                        <li class="td td-status">
                                                            <div class="item-status">
                                                                <p class="Mystatus">${orderlist.orderState}</p>
                                                                <p class="order-info"><a
                                                                        href="orderinfo.html">订单详情</a>
                                                                </p>
                                                                <p class="order-info"><a
                                                                        href="logistics.html">查看物流</a>
                                                                </p>
                                                            </div>
                                                        </li>
                                                        <li class="td td-change">
                                                            <div class="am-btn am-btn-danger anniu">
                                                                删除订单
                                                            </div>
                                                        </li>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>


                        <div class="am-tab-panel am-fade am-in am-active" id="tab2">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>


                            <div class="order-main">
                                <div class="order-list">
                                    <c:forEach items="${order}" var="orderlist">
                                        <c:if test="${orderlist.orderState.equals(\"待付款\")}">
                                            <div class="order-status5">
                                                <div class="order-title">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${orderlist.orderCode}</a></div>
                                                        <span>成交时间：${orderlist.orderTime}</span>
                                                        <!--    <em>店铺：小桔灯</em>-->
                                                    </div>
                                                    <!--    <em>店铺：小桔灯</em>-->
                                                </div>

                                                <div class="order-content">
                                                    <div class="order-left">
                                                        <c:forEach items="${orderlist.orderItemList}" var="order">
                                                            <ul class="item-list">

                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="../${order.commodityPhoto}"
                                                                                 class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${order.commodityName}</p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${order.price}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${order.number}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">

                                                                    </div>
                                                                </li>

                                                            </ul>
                                                        </c:forEach>
                                                    </div>

                                                    <div class="order-right">
                                                        <li class="td td-amount">
                                                            <div class="item-amount">
                                                                合计：${orderlist.total}
                                                            </div>
                                                        </li>
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus"></p>
                                                                    <p class="order-info"><a
                                                                            href="orderinfo.html">订单详情</a>
                                                                    </p>
                                                                    <p class="order-info"><a
                                                                            href="logistics.html">查看物流</a>
                                                                    </p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    删除订单
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <!--交易成功-->

                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab3">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>

                            <div class="order-main">
                                <div class="order-list">
                                    <c:forEach items="${order}" var="orderlist">
                                        <c:if test="${orderlist.orderState.equals(\"待发货\")}">
                                            <div class="order-status5">
                                                <div class="order-title">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${orderlist.orderCode}</a></div>
                                                        <span>成交时间：${orderlist.orderTime}</span>
                                                        <!--    <em>店铺：小桔灯</em>-->
                                                    </div>
                                                    <!--    <em>店铺：小桔灯</em>-->
                                                </div>

                                                <div class="order-content">
                                                    <div class="order-left">
                                                        <c:forEach items="${orderlist.orderItemList}" var="order">
                                                            <ul class="item-list">

                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="../${order.commodityPhoto}"
                                                                                 class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${order.commodityName}</p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${order.price}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${order.number}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">

                                                                    </div>
                                                                </li>

                                                            </ul>
                                                        </c:forEach>
                                                    </div>

                                                    <div class="order-right">
                                                        <li class="td td-amount">
                                                            <div class="item-amount">
                                                                合计：${orderlist.total}
                                                            </div>
                                                        </li>
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus"></p>
                                                                    <p class="order-info"><a
                                                                            href="orderinfo.html">订单详情</a>
                                                                    </p>
                                                                    <p class="order-info"><a
                                                                            href="logistics.html">查看物流</a>
                                                                    </p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    删除订单
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab4">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>

                            <div class="order-main">
                                <div class="order-list">
                                    <c:forEach items="${order}" var="orderlist">
                                        <c:if test="${orderlist.orderState.equals(\"待收货\")}">
                                            <div class="order-status5">
                                                <div class="order-title">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${orderlist.orderCode}</a></div>
                                                        <span>成交时间：${orderlist.orderTime}</span>
                                                        <!--    <em>店铺：小桔灯</em>-->
                                                    </div>
                                                    <!--    <em>店铺：小桔灯</em>-->
                                                </div>

                                                <div class="order-content">
                                                    <div class="order-left">
                                                        <c:forEach items="${orderlist.orderItemList}" var="order">
                                                            <ul class="item-list">

                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="../${order.commodityPhoto}"
                                                                                 class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${order.commodityName}</p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${order.price}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${order.number}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">

                                                                    </div>
                                                                </li>

                                                            </ul>
                                                        </c:forEach>
                                                    </div>

                                                    <div class="order-right">
                                                        <li class="td td-amount">
                                                            <div class="item-amount">
                                                                合计：${orderlist.total}
                                                            </div>
                                                        </li>
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus"></p>
                                                                    <p class="order-info"><a
                                                                            href="orderinfo.html">订单详情</a>
                                                                    </p>
                                                                    <p class="order-info"><a
                                                                            href="logistics.html">查看物流</a>
                                                                    </p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    删除订单
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="am-tab-panel am-fade" id="tab5">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>

                            <div class="order-main">
                                <div class="order-list">
                                    <!--不同状态的订单	-->
                                    <c:forEach items="${order}" var="orderlist">
                                        <c:if test="${orderlist.orderState.equals(\"待评价\")}">
                                            <div class="order-status5">
                                                <div class="order-title">
                                                    <div class="order-title">
                                                        <div class="dd-num">订单编号：<a
                                                                href="javascript:;">${orderlist.orderCode}</a></div>
                                                        <span>成交时间：${orderlist.orderTime}</span>
                                                        <!--    <em>店铺：小桔灯</em>-->
                                                    </div>
                                                    <!--    <em>店铺：小桔灯</em>-->
                                                </div>

                                                <div class="order-content">
                                                    <div class="order-left">
                                                        <c:forEach items="${orderlist.orderItemList}" var="order">
                                                            <ul class="item-list">

                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="../${order.commodityPhoto}"
                                                                                 class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${order.commodityName}</p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${order.price}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${order.number}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">

                                                                    </div>
                                                                </li>

                                                            </ul>
                                                        </c:forEach>
                                                    </div>

                                                    <div class="order-right">
                                                        <li class="td td-amount">
                                                            <div class="item-amount">
                                                                合计：${orderlist.total}
                                                            </div>
                                                        </li>
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus"></p>
                                                                    <p class="order-info"><a
                                                                            href="orderinfo.html">订单详情</a>
                                                                    </p>
                                                                    <p class="order-info"><a
                                                                            href="logistics.html">查看物流</a>
                                                                    </p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    删除订单
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>

            </div>
        </div>

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
<aside class="menu">
    <ul>
        <li class="person active">
            <a href="index.html"><i class="am-icon-user"></i>个人中心</a>
        </li>
        <li class="person">
            <p><i class="am-icon-newspaper-o"></i>个人资料</p>
            <ul>
                <li><a href="information.html">个人信息</a></li>
                <li><a href="safety.html">安全设置</a></li>
                <li><a href="address.jsp">地址管理</a></li>
                <li><a href="cardlist.html">快捷支付</a></li>
            </ul>
        </li>
        <li class="person">
            <p><i class="am-icon-balance-scale"></i>我的交易</p>
            <ul>
                <li><a href="order.html">订单管理</a></li>
                <li><a href="change.html">退款售后</a></li>
                <li><a href="comment.html">评价商品</a></li>
            </ul>
        </li>
        <li class="person">
            <p><i class="am-icon-dollar"></i>我的资产</p>
            <ul>
                <li><a href="points.html">我的积分</a></li>
                <li><a href="coupon.html">优惠券 </a></li>
                <li><a href="bonus.html">红包</a></li>
                <li><a href="walletlist.html">账户余额</a></li>
                <li><a href="bill.html">账单明细</a></li>
            </ul>
        </li>

        <li class="person">
            <p><i class="am-icon-tags"></i>我的收藏</p>
            <ul>
                <li><a href="collection.html">收藏</a></li>
                <li><a href="foot.html">足迹</a></li>
            </ul>
        </li>

        <li class="person">
            <p><i class="am-icon-qq"></i>在线客服</p>
            <ul>
                <li><a href="consultation.html">商品咨询</a></li>
                <li><a href="suggest.html">意见反馈</a></li>

                <li><a href="news.html">我的消息</a></li>
            </ul>
        </li>
    </ul>

</aside>
</div>

</body>

</html>