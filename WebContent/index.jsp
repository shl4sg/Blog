<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<title>ITCLUB 博客</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/new.css" rel="stylesheet">

<script src="http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=407687">
</script>
<link rel="stylesheet" href="http://bdimg.share.baidu.com/static/api/css/share_style1_32.css">
<script type="text/javascript" src="js/jBox/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<link type="text/css" rel="stylesheet"href="js/jBox/Skins2/Yellow/jbox.css" />
<script type="text/javascript" src="js/toolTip/tooltip.js"></script>
<link type="text/css" rel="stylesheet" href="js/toolTip/tooltip.css" />

<!--[if lt IE 9]>  
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script> 
<script src="js/respond.js"></script> 
<![endif]-->

</head>

<body
	style="width: 1000px; margin: auto; background: url(images/bg.png) repeat-y">
	<c:set var="logoner" value="${sessionScope.logoner}" />
	<div id="logoner" style="display: none">${logoner}</div>
	<div id="blogNameIndex" style="display: none">
		${logoner.userBlogName}</div>
	<div id="userIdIndex" style="display: none">${logoner.id}</div>
	<header>
		<div id="logo">
			<a href="#"></a>
		</div>
		<nav class="topnav" id="topnav">
			<div id="logined" style="border: none; display: none" class="tooltip"
				onmouseover="tooltip.pop(this, '#textContent',{position:1, offsetX:-50,  effect:'slide'})">
				<a href="javascript:loginIndex();" id="topnav_current"><span
					id="userBlogName">你好，${logoner.userBlogName}（菜单）</span><span
					class="en"></span>
			</div>

			<div style="display: none">
				<div id="textContent" style="width: 75px; height: 75px;">
					<a id="blogUrl" href="goBlogIndex?master=${logoner.id}">进入博客</a> <br />
					<a id="blogUrl" href="javascript:logOff();">退出</a>
				</div>
			</div>

			<div id="unLogin" style="margin-left: 550px;">
				<a href="javascript:reg();"><span class="menuTitle">学习之路</span><span
					class="en"></span> </a> <a href="javascript:loginIndex();"
					id="topnav_current"><span class="menuTitle">登录</span><span
					class="en"></span> </a> <a href="javascript:reg();"
					style="color: #e15782"><span class="menuTitle">注册</span><span
					class="en"></span> </a>
			</div>


		</nav>
	</header>
	<div class="banner"></div>
	
	<article>
		<h1 class="t_nav"><a href="#" class="n1">精选博文</a></h1>
		<c:set var="mostArticlelist" value="${requestScope.mostArticlelist}" />
		<div class="bloglist left">			
			<c:if test="${!empty mostArticlelist}">
				<c:forEach var="article" items="${mostArticlelist}">
					<h3>
			<a href="goBlogContent?id=${article.id}&master=${article.artWhoId}">${article.artTitle}</a>
					</h3>
					<ul>					
					<p id="cssClip">${article.artContent}</p>
						<a href="goBlogContent?id=${article.id}&master=${article.artWhoId}"
						target="_blank" class="readmore">阅读全文&gt;&gt;</a>
					</ul>
					<p class="dateview">
					<span>${article.artPubTime}</span><span>作者：${article.userName}</span>
					</p>
				</c:forEach>
			</c:if>			
		</div>

		<aside class="right">
			<div class="news">
				<h3><p>最新 <span>博文</span></p>
				</h3>
				<c:set var="newArticlelist" value="${requestScope.newArticlelist}" />
				<ul class="rank">
				<c:if test="${!empty newArticlelist}">
					<c:forEach var="article" items="${newArticlelist}">
						<li><a href="goBlogContent?id=${article.id}&master=${article.artWhoId}"
								title="${article.artTitle}" target="_blank">${article.artTitle}</a>
						</li>
					</c:forEach>
				</c:if>
				</ul>
				<h3 class="ph"><p>博客 <span>排行</span></p></h3>
					<c:set var="toplist" value="${sessionScope.toplist}" />
				<ul class="paih">
				<c:if test="${!empty toplist}">
					<c:forEach var="topUser" items="${toplist}">
						<ul>
							<li>
								<a style="color: #5EA51B"
									href="goBlogIndex?master=${topUser.id}">${topUser.userName}</a>
								<span style="float: right">${topUser.userHitNum}次阅读</span>
							</li>
						</ul>
					</c:forEach>
				</c:if>
				</ul>

				
				<h3 class="links">
					<p><span>分享</span></p>
				</h3>

				<div class="bdsharebuttonbox bdshare-button-style1-32"
					data-bd-bind="1467678661338">
					<a href="#" class="bds_more" data-cmd="more"></a><a href="#"
						class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#"
						class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#"
						class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#"
						class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a
						href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
				</div>

			</div>
		</aside>
	</article>
	<footer>
		<p>
			<span style="color: white">技术支持</span> <a
				href="https://github.com/shl4sg" style="color: #FF7F50"
				target="_blank">石华龙</a>
		</p>
	</footer>
	<script type="text/javascript" src="js/loginHtml.js" charset="UtF-8"></script>
	<script>
		function loginIndex() {
			var html =loginHtml
			var content = {
				state1 : {
					content : html,
					buttons : {
						'取消' : 0
					},
					buttonsFocus : 0,
					submit : function(v, h, f) {
						if (v == 0) {
							return true; // close the window
				}
				return false;
			}
				}
			};
			$.jBox.open(content, '登录', 650, 550);
			
			var i=parseInt(10*Math.random());
			var j=parseInt(10*Math.random());
			var k=i+j;
			$("#hiddencode").val(k);
			$("#showspan").html(" "+i+"+"+j+"=?");			
		}
	</script>
	<script type="text/javascript" language="javascript">
			function getverifycodeChange(){
				var i =parseInt(10*Math.random());
				var j =parseInt(10*Math.random());
				var k=i+j;
				$("#hiddencode").val(k);
				$("#showspan").html(" "+i+"+"+j+"=?");
				$("#verifycode").focus();
				
			}
			
	</script>
	
	<script>
	function loginIn() {		
		if ($("#user").val() === "" || $("#ps").val() === "") {
			$.jBox.tip("账户或密码不能为空。", 'error');
			return;
		}
		if ($("#hiddencode").val()!=$("#verifycode").val()){
			$.jBox.tip($("#hiddencode").val(), 'error');
			return;
		}
		$.jBox.tip("正在提交...", 'loading');
		$.ajax( {
			url : "myLogon",
			type : "post",
			data : {				
				userName : $("#user").val(),
				userPswd : $("#ps").val()
			},
			success : function(data) {
				// 关闭加载条
			$.jBox.closeTip();
			arrData = eval("(" + data + ")");
			if (arrData.result == '1') {
				$.jBox.tip("账户或密码不正确。", 'error');
			} else {
				$.jBox.close();
				$.jBox.tip("登录成功！", 'success');
			}
		}
		});
	}

	</script>	
		
</body>
</html>