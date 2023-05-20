<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>
        	<link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link href="assets/css/codemirror.css" rel="stylesheet">
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
        		<!--[if !IE]> -->
		<script src="assets/js/jquery.min.js"></script>        
		<!-- <![endif]-->
           	<script src="assets/dist/echarts.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>            
       <title></title>
       </head>		
<body>
<div class="page-content clearfix">
 
 <div class="state-overview clearfix">
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                      <a href="#" title="商城会员">
                          <div class="symbol terques">
                             <i class="icon-user"></i>
                          </div>
                          <div class="value">
                              <h1>${admin.vipNum}</h1>
                              <p>商城用户</p>
                          </div>
                          </a>
                      </section>
                  </div>

                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol yellow">
                              <i class="icon-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <h1>${admin.orderNum}</h1>
                              <p>商城订单</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol blue">
                              <i class="icon-bar-chart"></i>
                          </div>
                          <div class="value">
                              <h1>￥${admin.total}</h1>
                              <p>交易记录</p>
                          </div>
                      </section>
                  </div>
              </div>
             <!--实时交易记录-->
             <div class="clearfix">
              <div class="Order_Statistics ">
          <div class="title_name">订单统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">未处理订单：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
           <tr><td class="name">待发货订单：</td><td class="munber"><a href="#">2</a>&nbsp;个</td></tr>
           <tr><td class="name">待结算订单：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
           <tr><td class="name">已成交订单数：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
           <tr><td class="name">交易失败：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
           </tbody>
          </table>
         </div> 
         <div class="Order_Statistics">
          <div class="title_name">商品统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">商品总数：</td><td class="munber"><a href="#">26</a>&nbsp;个</td></tr>
           <tr><td class="name">回收站商品：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
           <tr><td class="name">上架商品：</td><td class="munber"><a href="#">26</a>&nbsp;个</td></tr>
           <tr><td class="name">下架商品：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
          

           </tbody>
          </table>
         </div> 
         
             <!--<div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div> -->
         <div class="news_style">
          <div class="title_name">最新消息</div>
          <ul class="list">
           <li><i class="icon-bell red"></i><a href="#">testtesttesttesttest。</a></li>
           <li><i class="icon-bell red"></i><a href="#">testtesttesttesttest</a></li>
           <li><i class="icon-bell red"></i><a href="#">testtesttesttesttest。</a></li>
           <li><i class="icon-bell red"></i><a href="#">testtesttesttesttest。</a></li>
           <li><i class="icon-bell red"></i><a href="#">testtesttesttesttest。</a></li>
          </ul>
         </div> 
         </div>
 <!--记录-->
 <div class="clearfix">
  <div class="home_btn">
     <div>
     <a href="picture-add.html"  title="添加商品" class="btn  btn-info btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-addp.png" /></i>
     <h5 class="margin-top">添加商品</h5>
     </a>
     <a href="admin_info.html"  title="个人信息" class="btn  btn-success btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-grxx.png" /></i>
     <h5 class="margin-top">个人信息</h5>
     </a>
     <a href="Order_handling.html"  title="商品订单" class="btn  btn-purple btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-gwcc.png" /></i>
     <h5 class="margin-top">商品订单</h5>
     </a>
 
     </div>
  </div>
 
 </div>
   
     </div>
</body>
</html>
<script type="text/javascript">
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.no-radius').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-640);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-640);
		});
 });
	 
	 
 </script>   