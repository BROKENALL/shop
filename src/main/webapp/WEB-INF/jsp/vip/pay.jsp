<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>

    <link href="http://localhost:8080/vip/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>

    <link href="http://localhost:8080/vip/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="http://localhost:8080/vip/css/cartstyle.css" rel="stylesheet" type="text/css"/>

    <link href="http://localhost:8080/vip/css/jsstyle.css" rel="stylesheet" type="text/css"/>


    <script type="text/javascript">
        var orderId = "${order.id}";
        let payType = "${order.payType}";
        let expressage = "${order.expressage}";
        var addressId = "${order.address}";
    </script>
    <script type="text/javascript" src="http://localhost:8080/vip/js/address.js"></script>
    <script type="text/javascript" src="http://localhost:8080/vip/js/pay.js"></script>
    <script type="text/javascript" src="http://localhost:8080/vip/lib/layui/layui.js"></script>
</head>

<body>

<!--顶部导航条 -->
<div class="am-container header" id="headfirst">
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="http://localhost:8080/vip/index" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="http://localhost:8080/vip/frame/index" target="_top"><i
                    class="am-icon-user am-icon-fw"></i>个人中心</a>
            </div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="http://localhost:8080/vip/shopcart" target="_top"><i
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
    <div class="clear"></div>
    <div class="concent">
        <!--地址 -->
        <div class="paycont">
            <div class="address">
                <h3>确认收货地址 </h3>
                <div class="control">
                    <div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
                </div>


                <ul>

                    <div class="clear"></div>

                    <c:forEach items="${address}" var="address">
                        <c:if test="${address.isDefault==true}">
                            <div class="per-border"></div>
                            <li class="user-addresslist defaultAddr">

                                <div class="address-left">
                                    <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">${address.name} </span>
										<span class="buy-phone">${address.phone}</span>
										</span>
                                    </div>
                                    <div class="default-address DefaultAddr">
                                        <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                        <span class="buy--address-detail">
								   <span class="province">${address.provinceName}</span>
										<span class="city">${address.cityName}</span>
										<span class="dist">${address.areaName}</span>
										<span class="street">${address.streetName}</span>
										</span>

                                        </span>
                                    </div>
                                    <ins class="deftip">默认地址</ins>
                                </div>
                                <div class="address-right">
                                    <a href="person/address.html">
                                        <span class="am-icon-angle-right am-icon-lg"></span></a>
                                </div>
                                <div class="clear"></div>

                                <div class="new-addr-btn">
                                    <a href="javascript:void(0);" class="hidden">设为默认</a>
                                    <span class="new-addr-bar hidden">|</span>
                                    <a href="#">编辑</a>
                                    <span class="new-addr-bar">|</span>
                                    <a href="javascript:void(0);" onclick="delClick(this);">删除</a>
                                    <script type="text/javascript">
                                        addressId =${address.id};
                                    </script>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${address.isDefault==false}">
                            <div class="per-border"></div>
                            <li class="user-addresslist">
                                <div class="address-left">
                                    <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">${address.name} </span>
										<span class="buy-phone">${address.phone}</span>
										</span>
                                    </div>
                                    <div class="default-address DefaultAddr">
                                        <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                        <span class="buy--address-detail">
								    <span class="province">${address.provinceName}</span>
										<span class="city">${address.cityName}</span>
										<span class="dist">${address.areaName}</span>
										<span class="street">${address.streetName}</span>
										</span>

                                        </span>
                                    </div>
                                    <ins class="deftip hidden">默认地址</ins>
                                </div>
                                <div class="address-right">
                                    <span class="am-icon-angle-right am-icon-lg"></span>
                                </div>
                                <div class="clear"></div>
                                <div class="new-addr-btn">
                                    <input type="hidden" id="updataIsDefaultAddressId" value=${address.id}>
                                    <a href="javascript:void(0);" id="updataIsDefaultAddress">设为默认</a>
                                </div>

                            </li>
                        </c:if>
                    </c:forEach>
                </ul>

                <div class="clear"></div>
            </div>
            <!--物流 -->
            <div class="logistics">
                <h3>选择物流方式</h3>
                <ul class="op_express_delivery_hot">
                    <li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right"
                                                                      style="background-position:0px -468px"></i>圆通<span></span>
                    </li>
                    <li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right"
                                                                      style="background-position:0px -1008px"></i>申通<span></span>
                    </li>
                    <li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right"
                                                                   style="background-position:0px -576px"></i>韵达<span></span>
                    </li>
                    <li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right"
                                                                                                   style="background-position:0px -324px"></i>中通<span></span>
                    </li>
                    <li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right"
                                                                                                    style="background-position:0px -180px"></i>顺丰<span></span>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
            <div class="clear"></div>

            <!--支付方式-->
            <div class="logistics">
                <h3>选择支付方式</h3>
                <ul class="pay-list">
                    <li class="pay card"><img src="images/wangyin.jpg"/>银联<span></span></li>
                    <li class="pay qq"><img src="images/weizhifu.jpg"/>微信<span></span></li>
                    <li class="pay taobao"><img src="images/zhifubao.jpg"/>支付宝<span></span></li>
                </ul>
            </div>
            <div class="clear"></div>

            <!--订单 -->
            <div class="concent">
                <div id="payTable">
                    <h3>确认订单信息</h3>
                    <div class="cart-table-th">
                        <div class="wp">

                            <div class="th th-item">
                                <div class="td-inner">商品信息</div>
                            </div>
                            <div class="th th-price">
                                <div class="td-inner">单价</div>
                            </div>
                            <div class="th th-amount">
                                <div class="td-inner">数量</div>
                            </div>
                            <div class="th th-sum">
                                <div class="td-inner">金额</div>
                            </div>
                            <div class="th th-oplist">
                                <div class="td-inner">配送方式</div>
                            </div>

                        </div>
                    </div>
                    <div class="clear"></div>
                    <c:forEach items="${order.orderItemList}" var="ods">
                        <tr class="item-list">
                            <div class="bundle  bundle-last">
                                <div class="bundle-main">
                                    <ul class="item-content clearfix">
                                        <div class="pay-phone">
                                            <li class="td td-item">
                                                <div class="item-pic">
                                                    <a href="#" class="J_MakePoint">
                                                        <img src="${ods.commodityPhoto}"
                                                             class="itempic J_ItemImg"></a>
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-basic-info">
                                                        <a href="#" class="item-title J_MakePoint"
                                                           data-point="tbcart.8.11">${ods.commodityName}</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="td td-price">
                                                <div class="item-price price-promo-promo">
                                                    <div class="price-content">
                                                        <em class="J_Price price-now">${ods.price}</em>
                                                    </div>
                                                </div>
                                            </li>
                                        </div>
                                        <li class="td td-amount">
                                            <div class="amount-wrapper ">
                                                <div class="item-amount ">
                                                    <span class="phone-title">购买数量</span>
                                                    <div class="sl">
                                                        <input class="min am-btn" name="" type="button" value="-"/>
                                                        <input class="text_box" name="" type="text"
                                                               value="${ods.number}"
                                                               style="width:30px;"/>
                                                        <input class="add am-btn" name="" type="button" value="+"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="td td-sum">
                                            <div class="td-inner">
                                                <em tabindex="0" class="J_ItemSum number">${ods.price*ods.number}</em>
                                            </div>
                                        </li>
                                        <li class="td td-oplist">
                                            <div class="td-inner">
                                                <span class="phone-title">配送方式</span>
                                                <div class="pay-logis">
                                                    包邮
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="clear"></div>

                                </div>
                            </div>
                        </tr>

                    </c:forEach>
                </div>
            </div>
            <div class="clear"></div>
            <div class="pay-total">
                <!--留言-->
                <div class="order-extra">
                    <div class="order-user-info">
                        <div id="holyshit257" class="memo">
                            <label>买家留言：</label>
                            <form action="pay/success" id="successSubmit" method="post">
                                <input id="id" value=${order.id} name="id" type="hidden">
                                <input id="addressId" value="" name="addressId" type="hidden">
                                <input id="payType" value="" name="payType" type="hidden">
                                <input id="expressage" value="" name="expressage" type="hidden">
                                <input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
                                       placeholder="选填,建议填写和卖家达成一致的说明"
                                       name="leaveMessage"
                                       class="memo-input J_MakePoint c2c-text-default memo-close">
                            </form>
                            <div class="msg hidden J-msg">
                                <p class="error">最多输入500个字符</p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <div class="clear"></div>
        </div>
        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price ">
                合计 <span>¥</span><em class="pay-sum">244.00</em>
            </p>
        </div>

        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box">
                    <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                        <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red "
                                                       id="J_ActualFee">${order.total}</em>
											</span>
                    </div>

                    <div id="holyshit268" class="pay-address">


                    </div>
                </div>

                <div id="holyshit269" class="submitOrder">

                    <div class="go-btn-wrap">
                        <a id="J_Go" class="btn-go" tabindex="0"
                           title="点击此按钮，提交订单">提交订单</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="clear"></div>
</div>
</div>
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
        </p>
    </div>
</div>
</div>
<div class="theme-popover-mask"></div>
<div class="theme-popover">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
            address</small></div>
    </div>
    <hr/>

    <div class="am-u-md-12">
        <form class="am-form am-form-horizontal" id="post-address" action="http://localhost:8080/vip/pay/saveAddress" method="post">
            <input name="orderId" value="${order.id}" type="hidden">
            <div class="am-form-group">
                <label for="user-name" class="am-form-label">收货人</label>
                <div class="am-form-content">
                    <input type="text" name="name" id="user-name" placeholder="收货人">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">手机号码</label>
                <div class="am-form-content">
                    <input id="user-phone" name="phone" placeholder="手机号必填" type="email">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">所在地</label>
                <div class="am-form-content address">
                    <select data-am-selected name="provinceName">
                        <option value="浙江省">浙江省</option>
                        <option value="湖北省">湖北省</option>
                    </select>
                    <select data-am-selected name="cityName">
                        <option value="温州市">温州市</option>
                        <option value="武汉市">武汉市</option>
                    </select>
                    <select data-am-selected name="areaName">
                        <option value="瑞安区">瑞安区</option>
                        <option value="洪山区">洪山区</option>
                    </select>
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-intro" class="am-form-label">详细地址</label>
                <div class="am-form-content">
                    <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址" name="streetName"></textarea>
                    <small>100字以内写出你的详细地址...</small>
                </div>
            </div>

            <div class="am-form-group theme-poptit">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <div class="am-btn am-btn-danger" id="saveAddress">保存</div>
                    <div class="am-btn am-btn-danger close">取消</div>
                </div>
            </div>
        </form>
    </div>

</div>

<div class="clear"></div>
</body>

</html>