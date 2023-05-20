<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="../js/frame.js"></script>
		<script type="text/javascript" src="../lib/layui/layui.js"></script>

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录</a>
									<a href="#" target="_top">免费注册</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="http://localhost:8080/vip/index" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="http://localhost:8080/vip/frame/index" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="http://localhost:8080/vip/shopcart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

					

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>

		
		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<c:forEach items="${address}" var="address">
							<c:if test="${address.isDefault==true}">
								<li class="user-addresslist defaultAddr">
									<span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
									<p class="new-tit new-p-re">
										<span class="new-txt">${address.name}</span>
										<span class="new-txt-rd2">${address.phone}</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">地址：</span>
											<span class="province">${address.provinceName}</span>
											<span class="city">${address.cityName}</span>
											<span class="dist">${address.areaName}</span>
											<span class="street">${address.streetName}</span>
									</div>
									<div class="new-addr-btn">
										<a href="#"><i class="am-icon-edit"></i>编辑</a>
										<span class="new-addr-bar">|</span>
										<a href="deleteAddress?id=${address.id}"><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
							</c:if>
							<c:if test="${address.isDefault==false}">
								<li class="user-addresslist">
									<span class="new-option-r" id="updataIsDefaultAddress"><i class="am-icon-check-circle"></i>设为默认</span>
									<input type="hidden" id="updataIsDefaultAddressId" value=${address.id}>
									<p class="new-tit new-p-re">

										<span class="new-txt">${address.name}</span>
										<span class="new-txt-rd2">${address.phone}</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">地址：</span>
											<span class="province">${address.provinceName}</span>
											<span class="city">${address.cityName}</span>
											<span class="dist">${address.areaName}</span>
											<span class="street">${address.streetName}</span>
									</div>
									<div class="new-addr-btn">
										<a href="#"><i class="am-icon-edit"></i>编辑</a>
										<span class="new-addr-bar">|</span>
										<a href="deleteAddress?id=${address.id}"><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
							</c:if>
						</c:forEach>

						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal" id="addressSave" method="post" action="http://localhost:8080/vip/frame/saveAddress">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" id="user-name" placeholder="收货人" name="name">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="user-phone" placeholder="手机号必填" type="email" name="phone">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<div class="am-form-content address">
												<select data-am-selected name="provinceName">
													<option value="山东省">山东省</option>
													<option value="贵州省" selected>贵州省</option>
												</select>
												<select data-am-selected name="cityName">
													<option value="青岛市">青岛市</option>
													<option value="遵义市" selected>遵义市</option>
												</select>
												<select data-am-selected name="areaName">
													<option value="城阳区">城阳区</option>
													<option value="正安县" selected>正安县</option>
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

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a class="am-btn am-btn-danger" id="saveAddress">保存</a>
												<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>
				<!--底部-->
				
			</div>

			
		</div>

	</body>

</html>