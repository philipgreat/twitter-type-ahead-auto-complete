
<%
	response.setCharacterEncoding("UTF-8");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="/WEB-INF/shopizer-tags.tld" prefix="sm"%>
<%@page pageEncoding="UTF-8"%>
<script src="<c:url value="/resources/templates/bootstrap3/js/typeahead.bundle.min.js" />"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var winHei = $(window).height(); //窗口高度
		var footHei = $("#sort").height(); //分类高度
		var searHei = $("#sear").height(); //搜索框高度
		var introHei = $("#intro").height(); //提示高度
		var heig = winHei - 90;
		var dist = heig / 2 - footHei - 15 - searHei;
		dist = Math.round(dist);
		$("#sort").css("padding-top", dist + "px");


	//remove the code for autocomplete
/* 
		$("#searchInput").focus(function(e) {
			$("#search_prompt").show();
		}).blur(function(){
			window.setTimeout(function() {
				$("#search_prompt").hide();
			},500)
		})
*/
		var typeSuggests = new Bloodhound({
				datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name);},
				queryTokenizer: Bloodhound.tokenizers.whitespace,
				prefetch: '/sm-shop/services/public/search/default/zh/autocomplete.html?q=cck-8',
				remote: {
					url: '/sm-shop/services/public/search/default/zh/autocomplete.html?q=%QUERY',
					wildcard: '%QUERY'
				}
			});

			typeSuggests.initialize();

			$('#searchInput').typeahead({
						hint: false,
						highlight: true,
						minLength: 1
					},{
						name: 'students',
						displayKey: 'name',
						source: typeSuggests.ttAdapter(),
					});

		$("#search_prompt .search_item").click(function(e) {
			$("#searchInput").val('');
			$("#searchInput").val($(this).text());
			$("#search_prompt").hide();
		});
		
		$(".search-group li").click(function(){
			$(this).addClass('active').siblings().removeClass('active');
			$("#queryType").val($(this).index());
			$("#searchInput").attr("placeholder", $(this).data("prop"));
		})
		
		//初始化友情链接位置
		var linkT = $("#links").offset().top;
		$("#links").css("padding-top",winHei-linkT);
		
		/* $(window).resize(function(){
			var winH = $(window).height();
			var linkT = $("#links").offset().top;
			$("#links").css("padding-top",winH-linkT);
		}) */
		
		$('.listNav li:last a:first').remove();
	});

</script>
<style>

#land_left_foot li a {
	color: #fafafa !important;
}

#land_right_foot li a {
	color: #fafafa !important;
}

.listNav{
}

@media (min-width: 768px){
	.listNav {
	    float: none;
	}
}
.listNav > li >a {
	margin-right: 20px;
}

#search_prompt ul {
	list-style-type: none;
}

#search_prompt ul li {
	font-size: 14px;
	padding: 10px 0px 10px 30px;
	color: #4285f4;
	cursor:pointer;
}
#search_prompt ul li:hover {
    background-color: #f2f2f2;
} 

#search_prompt ul li:FIRST-CHILD {
	margin-top: 15px;
}
.heat{
 padding-left: 10px;
}
.search-group{
	text-align: left;
}
.search-group ul{
	list-style: none;
	margin-left: -40px;
}
.search-group li{
	float: left;
}
.search-group li a{
	padding: 6px 20px;
	font-size:16px;
	color: #4285f4;
	float: left;
}
.search-group li.active a{
	color: #fafafa;
	background-color: #4285f4;
}
#links{
	padding-bottom: 80px;
}
#links .link-title{
	color:#666666;font-size:28px;font-weight:300;margin:10px auto;padding:10px 0;width:190px;
	border-bottom: 8px solid #4285f4;
}
#links .link-table{
	width:100%;
    border-collapse: collapse;
}

#links .link-table td{
    border: solid #d9d9d9;
    border-width: 1px 1px 1px 1px;
    padding:0px;
    width: 242px;
    height: 155px;
}
#links .link-table a{
    display: block;
    height: 100%;
}
#links a.link1{
    background: url(resources/img/links/1.png) no-repeat center;
}
#links a.link1:hover{
    background: url(resources/img/links/1_h.png) no-repeat center;
}
#links a.link2{
    background: url(resources/img/links/2.png) no-repeat center;
}
#links a.link2:hover{
    background: url(resources/img/links/2_h.png) no-repeat center;
}
#links a.link3{
    background: url(resources/img/links/3.png) no-repeat center;
}
#links a.link3:hover{
    background: url(resources/img/links/3_h.png) no-repeat center;
}
#links a.link4{
    background: url(resources/img/links/4.png) no-repeat center;
}
#links a.link4:hover{
    background: url(resources/img/links/4_h.png) no-repeat center;
}
#links a.link5{
    background: url(resources/img/links/5.png) no-repeat center;
}
#links a.link5:hover{
    background: url(resources/img/links/5_h.png) no-repeat center;
}
#links a.link6{
    background: url(resources/img/links/6.png) no-repeat center;
}
#links a.link6:hover{
    background: url(resources/img/links/6_h.png) no-repeat center;
}
#links a.link7{
    background: url(resources/img/links/7.png) no-repeat center;
}
#links a.link7:hover{
    background: url(resources/img/links/7_h.png) no-repeat center;
}
#links a.link8{
    background: url(resources/img/links/8.png) no-repeat center;
}
#links a.link8:hover{
    background: url(resources/img/links/8_h.png) no-repeat center;
}
#links a.link9{
    background: url(resources/img/links/9.png) no-repeat center;
}
#links a.link9:hover{
    background: url(resources/img/links/9_h.png) no-repeat center;
}
#links a.link10{
    background: url(resources/img/links/10.png) no-repeat center;
}
#links a.link10:hover{
    background: url(resources/img/links/10_h.png) no-repeat center;
}
#links a.link11{
    background: url(resources/img/links/11.png) no-repeat center;
}
#links a.link11:hover{
    background: url(resources/img/links/11_h.png) no-repeat center;
}
#links a.link12{
    background: url(resources/img/links/12.png) no-repeat center;
}
#links a.link12:hover{
    background: url(resources/img/links/12_h.png) no-repeat center;
}
#links a.link13{
    background: url(resources/img/links/13.png) no-repeat center;
}
#links a.link13:hover{
    background: url(resources/img/links/13_h.png) no-repeat center;
}
#links a.link14{
    background: url(resources/img/links/14.png) no-repeat center;
}
#links a.link14:hover{
    background: url(resources/img/links/14_h.png) no-repeat center;
}
#links a.link15{
    background: url(resources/img/links/15.png) no-repeat center;
}
#links a.link15:hover{
    background: url(resources/img/links/15_h.png) no-repeat center;
}
#links .link-table a:hover{
   background-color: blanchedalmond;
}
#links .link-nav{
	border-top: 1px solid #d9d9d9;
	border-left: 1px solid #d9d9d9;
	list-style: none;
	padding: 0;
	overflow: hidden;
}
#links .link-nav li{
	float: left;
}
#links .link-nav li a{
	display:block;
	width: 233.8px;
	height: 155px;
	border-right: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
}
</style>

<style>


.twitter-typeahead, .tt-hint, .tt-input, .tt-menu,.tt-dropdown-menu { width: 100%; }

</style>

<c:set var="req" value="${request}" />
<div class="container-fluid">
	<div id="sort" class="navbar" style="padding-left:272px;text-align:center;">
		<ul class="nav navbar-nav listNav">
			<li><a href='<c:url value="/shop/category/category/1.html"/>'>
					<div>
						<img src="<c:url value="/resources/img/shiji.png" />">
					</div>
					<div style="color:#000000;padding-top:12px;">
						<s:message code="label.bettbio.reagent" text="Reagent" />
					</div>
			</a></li>
			<li style="padding-left:12px;"><a
				href='<c:url value="/shop/category/category/2.html"/>'>
					<div>
						<img src="<c:url value="/resources/img/haocai.png" />">
					</div>
					<div style="color:#000000;padding-top:10px;">
						<s:message code="label.bettbio.consumer" text="Consumer" />
					</div>
			</a></li>
			<li style="padding-left:12px;"><a
				href='<c:url value="/shop/category/category/3.html"/>'>
					<div>
						<img src="<c:url value="/resources/img/yiq.png" />">
					</div>
					<div style="color:#000000;padding-top:10px;">
						<s:message code="label.bettbio.instrument" text="Instrument" />
					</div>
			</a></li>
			<li style="padding-left:12px;padding-top:10px;"><a
				href='<c:url value="/shop/category/category/4.html"/>'>
					<div>
						<img src="<c:url value="/resources/img/fuwu.png" />">
					</div>
					<div style="color:#000000;padding-top:14px;">
						<s:message code="label.bettbio.server" text="Server" />
					</div>
			</a></li>
			<li style="padding-left:12px;"><a
				style="height:117px;padding-top:28px;margin-top:-11px;"
				href='<c:url value="/shop/activity.html"/>'> <img
					style="margin-bottom:6px;margin-top:-22px;width:30px;height:15px;margin-left:37px;"
					src="<c:url value="/resources/img/new.png" />">
					<div>
						<img src="<c:url value="/resources/img/huodong.png" />">
					</div>
					<div style="color:#000000;padding-top:18px;">
						<s:message code="label.bettbio.action" text="Action" />
					</div>
			</a></li>
			<li style="padding-left:12px;"><a
				href='<c:url value="/shop/news/list.html"/>'>
					<div>
						<img src="<c:url value="/resources/img/zixun.png" />">
					</div>
					<div style="color:#000000;padding-top:16px;">
						<s:message code="label.bettbio.info" text="Info" />
					</div
			</a></li>
			<li style="padding-left:12px;"><a
				href='<c:url value="/shop/marketpoints/list.html"/>'>
					<div>
						<img src="<c:url value="/resources/img/jinfeng.png" />">
					</div>
					<div style="color:#000000;padding-top:14px;">
						<s:message code="label.bettbio.point" text="Point" />
					</div>
			</a></li>
		</ul>
	</div>
	<div id="sear" class="row" style="padding-top:20px;padding-left:140px;">

		<div class="pull-left" style="padding:30px 40px 0px 0px;">
			<img style="height:56px;"
				src="<c:url value="/resources/img/biglogo.png" />">
		</div>
		<form id="searchForm" method="post"	action="<c:url value="/shop/search/search.html"/>">
			<div class="input-group search-group">
				<ul>
					<li class="active" data-prop="请输入产品中（英）文名称"><a href="javascript:;">产品</a></li>
				 	<li data-prop="请输入商家名称"><a href="javascript:;">商家</a></li>
					<li data-prop="请输入产品货号"><a href="javascript:;">货号</a></li>
				</ul>
				<input id="queryType" type="hidden" name="queryType" value="0">
			</div>
			<div class="input-group " style="width:750px;position: relative;">
				<input id="searchInput" name="q" type="text" class="form-control"
					style="border: 1px solid #4285f4;font-size:16px;border-radius:0px;padding:16px 0px 16px 30px;height: 52px"
					placeholder="请输入产品中（英）文名称"
					autocomplete="off" spellcheck="false" dir="auto"
					value="<c:out value="${q}"/>" /> <span class="input-group-btn">
					<button class="btn btn-default"
						style="border: 1px solid #3c78d8;font-size:16px;background-color: #4285f4;border-radius:0px;height:52px;width:100px;color:#ffffff;"
						type="button" onClick="doEzybioSearch()">
						<s:message code="label.bettbio.search" text="Search" />
					</button>
				</span>
				<div id="search_prompt"
					style="position:absolute;width: 650px;top:52px;left:0px;display: none;z-index: 10;padding-bottom: 40px;">
					<ul style="background-color: #ffffff;border: 1px solid #d9d9d9;padding:0">
						<li class="search_item">PCR试剂<img class="heat" src="<c:url value="/resources/img/heat.png"/>"/></li>
						<li class="search_item">TAQ酶<img class="heat" src="<c:url value="/resources/img/heat.png"/>"/></li>
						<li class="search_item">LIPO 2000<img class="heat" src="<c:url value="/resources/img/heat.png"/>"/></li>
						<li class="search_item">蛋白 Maker<img class="heat" src="<c:url value="/resources/img/heat.png"/>"/></li>
						<li class="search_item">质粒 抽提<img class="heat" src="<c:url value="/resources/img/heat.png"/>"/></li>
						<li class="search_item">核酸 內切酶<img class="heat" src="<c:url value="/resources/img/heat.png"/>"/></li>
						<li class="search_item">細胞凋亡试剂盒<img class="heat" src="<c:url value="/resources/img/heat.png"/>"/></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<!-- <div id="intro" class="row" style="padding-top:40px;margin:0 auto;text-align:center;">The Most Trusted Platform For Life Science Research</div> -->
	<div id="links">
		<h2 class="link-title" >百图的合作伙伴</h2>
		<table class="link-table">
			<tr>
				<td><a class="link1"  href="http://www.sinobio.net/"></a></td>
				<td><a class="link2"  href="http://www.selleck.cn/"></a></td>
				<td><a class="link3"  href="http://www.tiandz.com/"></a></td>
				<td><a class="link4"  href="http://www.blarc.com.cn/list-34-1.html"></a></td>
				<td><a class="link5"  href="http://www.hxbio.net/"></a></td>
			</tr>
			<tr>
				<td><a class="link6"  href="http://www.boster.com.cn/"></a></td>
				<td><a class="link7"  href="http://www.lanhaobio.com/"></a></td>
				<td><a class="link8"  href="http://www.biomodel.com.cn/"></a></td>
				<td><a class="link9"  href="http://www.rainbio.com/"></a></td>
				<td><a class="link10" href="http://www.ge-bio.com.cn/"></a></td>
			</tr>
			<tr>
				<td><a class="link11"  href="http://www.hanbio.net/cn/about"></a></td>
				<td><a class="link12"  href="http://www.yeasen.com/"></a></td>
				<td><a class="link13"  href="http://www.cloud-clone.cn/"></a></td>
				<td><a class="link14"  href="http://www.bioss.com.cn/"></a></td>
				<td><a class="link15"  href="http://acrobiosystems.bioon.com.cn/"></a></td>
			</tr>
		</table>
	</div>
	<nav class="navbar-inverse navbar-fixed-bottom "
		style="margin-bottom:-7px;padding-top:0px;">
		<div style="width:1200px;margin-left: auto;margin-right: auto;">

			<div class="pull-left " style="text-align:center;">
				<ul id="land_left_foot" class="nav navbar-nav">
					<li><a class="foot-li"
						href='<c:url value="/shop/customer/protocol.html"/>'><s:message
								code="label.content.userprotocol" text="protocol" /></a></li>
					<li><a class="foot-li"
						href='http://v.youku.com/v_show/id_XMTUyNTM5NzE2NA==.html?from=y1.7-1.2 '
						target="_blank"><s:message code="label.bettbio.buyer"
								text="buyer" /></a></li>
					<li><a class="foot-li"
						href='http://v.youku.com/v_show/id_XMTU1MjM2MjkxNg==.html?from=y1.7-1.2'
						target="_blank"><s:message code="label.bettbio.justbuy"
								text="just buy" /></a></li>
					<li><a class="foot-li"
						href='<c:url value="/shop/quality.html"/>'><s:message
								code="label.bettbio.buy.title2" text="Contact" /></a></li>
					<li><a class="foot-li"
						href='<c:url value="/shop/detectService.html"/>'><s:message
								code="label.bettbio.buy.title3" text="Contact" /></a></li>
					<li><a class="foot-li"
						href='<c:url value="/shop/marketpoints/list.html"/>'><s:message
								code="label.bettbio.buy.shop1" text="Contact" /></a></li>
					<li><a class="foot-li"
						href='<c:url value="/shop/pointChange.html"/>'><s:message
								code="label.bettbio.buy.shop2" text="Contact" /></a></li>
					<li><a class="foot-li"
						href='<c:url value="/shop/aboutUS.html"/>'><s:message
								code="label.bettbio.buy.about" text="Contact" /></a></li>
					<li><a class="foot-li"
						href='<c:url value="/shop/store/contactus.html"/>'><s:message
								code="label.customer.contactus" text="Contact" /></a></li>
					<li><a class="foot-li" href="http://www.zqxzbio.com/"
						target="_blank">中乔新舟</a></li>
					<li><a class="foot-li" href="http://www.kuaidi.com/"
						target="_blank"><s:message code="label.product.delivery.link"
								text="Contact" /></a></li>
				</ul>
			</div>
			<div class="pull-right " style="text-align:center;">
				<ul id="land_right_foot" class="nav navbar-nav">
					<li><a class="foot-li" href="<c:url value="/"/>"><s:message
								code="label.bettbio.baknum" text="Bak Num" /></a></li>
				</ul>
			</div>
		</div>
	</nav>
