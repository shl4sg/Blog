<%@ page language="java" contentType="text/html" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=gbk">
		<title>帅哥博客</title>
		<meta name="viewport" content="initial-scale=1.0,user-scalable=no">
		<link rel="stylesheet" id="css-css" href="css/main.css"
			type="text/css" media="screen">
		<link rel="stylesheet" href="css/default.css" type="text/css">
		<script type="text/javascript" src="js/qtip.js"></script>

	</head>
	<body style="width: 1000px; margin: auto; background: url(images/bg.png) no-repeat">
	<c:set var="master" value="${sessionScope.callBlogMaster}"/>
	<c:set var="isSelf" value="${requestScope.isSelf}"/>
	<div id="userFlag" style="display:none">${isSelf}</div>
	    <jsp:include page="commonUserHeader.jsp"/>					
		
		<div id="m-container" class="container">
			<aside class="sidebar">
			<div class="cbl-logo">
				<div class="cbl-logo-info">
					<div style="font-size:20px">
						<a href="#">${master.userBlogName}</a>
					</div>
					<div class="cbl-logo-like">
						<a href="javascript:addFriend();" data-action="ding" data-id="676767"
							class="favorite"> <span class="c-like-text">加为好友</span></a>
					</div>
					<c:set var="countActicle" value="${sessionScope.countActicle}"/>
					<c:set var="countRev" value="${sessionScope.countRev}"/>
					<ul class="artist-data">
						<li>
							<strong>${countActicle}</strong>
							<span class="label">文章</span>
						</li>
						<li class="last">
							<strong>${countRev}</strong>
							<span class="label">评论</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="m-sidebar">
			
				<section class="topspaceinfo">
				<h1>
					个性签名:
				</h1>
				<p style="text-align: left;margin-left:50px">
					${master.userMotto}
				</p>
				
				</section>
				

				<c:set var="toplist" value="${sessionScope.toplist}"/>
				
				<div class="cbl-comment">
					<div class="cbl-head">
						博客排行榜
					</div>

					<c:if test="${!empty toplist}">
						<c:forEach var="topUser" items="${toplist}">
							<ul>
								<li>
									<a
										href="goBlogIndex?master=${topUser.id}"
										title="${topUser.userName}">
										<img alt=""
											src="images/ico/${topUser.userIco}"
											class="avatar avatar-40 photo" height="40" width="40">
											<span
										class="muted">${topUser.userName}</span> <span style="float:right">阅读：${topUser.userHitNum}次</span> </a>
								</li>
							</ul>
						</c:forEach>
					</c:if>
				</div>
			</div>
			</aside>
			
			<c:set var="articlelist" value="${requestScope.articlelist}"/>

			<style>
#cssClip {
	width: 600px;
	height: 28px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-overflow: ellipsis; /* IE/Safari */
	-ms-text-overflow: ellipsis;
	-o-text-overflow: ellipsis; /* Opera */
	-moz-binding: url("ellipsis.xml#ellipsis"); /*FireFox*/
}
</style>

			<div id="content" class="clearfix">
				<section id="primary">
				<div class="main" id="thumbs">
					
					<article id="addFlag"
						class="post-1432 page type-page status-publish hentry post post-article">
					<h2  class="title" style="padding:10px 40px 8px;">
						<a href="userArticleAdd.jsp" class="slow" style="color:#299982"  title="写博文">写博文</a>
					</h2>
					<ul class="text">
					</ul>
					</article>

					<c:if test="${empty articlelist}">

						<article 
							class="post-1422 post type-post status-publish format-standard hentry category-uncategorized post-article">
						<h2 class="title">
							<a class="slow" href="#" title="该博主还未发布文章">该博主还未发布文章。</a>
						</h2>
						<div class="textfoot">

						</div>
						</article>
					</c:if>

					<c:if test="${!empty articlelist}">
						<c:forEach var="article" items="${articlelist}">
							<article 
								class="post-1422 post type-post status-publish format-standard hentry category-uncategorized post-article">
							<h2 class="title">
								<a class="slow" href="goBlogContent?id=${article.id}&master=${master.id}"
									title="${article.artTitle}">${article.artTitle}</a>
							</h2>
							<span class="post-time"><a>${article.artPubTime}</a> </span>
							<ul id="cssClip" class="text">
								${article.artContent}
							</ul>
							<div class="textfoot">
								<a>${article.artCount}&nbsp;浏览  </a>
								<a
									href="#">${article.revCount}
									回复</a>
									<span style="margin-left:400px;color:#299982">
									<a class="editFlag" href="article?id=${article.id}&action=singleShow" style="color:#299982">修改  </a>
									<a class="delFlag" href="article?id=${article.id}&action=delete" style="color:#299982">&nbsp;删除  </a></span>
									
							</div>
							</article>
						</c:forEach>
						<jsp:include page="page.jsp"/>						
					</c:if>
				</div>
				</section>
			</div>
			
		</div>
		<div id="back-to-top" class="red" title="返回顶部" data-scroll="body">
			<svg id="point-up" version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32"
				viewBox="0 0 32 32">
			<path
				d="M23.588 17.637c-0.359-0.643-0.34-1.056-2.507-3.057 0.012-7.232-4.851-12.247-5.152-12.55 0-0.010 0-0.015 0-0.015s-0.003 0.003-0.007 0.007l-0.007-0.007c0 0 0 0.005 0 0.015-0.299 0.305-5.141 5.342-5.097 12.575-2.158 2.010-2.138 2.423-2.493 3.068-0.65 1.178-0.481 5.888 0.132 6.957 0.613 1.069 1.629 0.293 1.977-0.004 0.348-0.298 1.885-2.264 2.263-2.176 0 0 0.465-0.090 0.989 0.414 0.518 0.498 1.462 0.966 2.27 1.033 0 0.001 0 0.002-0 0.003 0.005-0.001 0.010-0.001 0.015-0.002 0.005 0 0.010 0.001 0.015 0.001 0-0.001-0-0.002 0-0.003 0.808-0.070 1.749-0.543 2.265-1.043 0.522-0.507 0.988-0.419 0.988-0.419 0.378-0.090 1.923 1.869 2.272 2.165 0.35 0.296 1.369 1.067 1.977-0.005 0.608-1.072 0.756-5.783 0.101-6.958v0 0zM15.95 14.86c-1.349 0.003-2.445-1.112-2.448-2.492-0.003-1.38 1.088-2.5 2.437-2.503 1.349-0.003 2.445 1.112 2.448 2.492 0.003 1.379-1.088 2.5-2.437 2.503v0 0zM17.76 24.876c-0.615 0.474-1.236 0.633-1.801 0.626-0.566 0.009-1.187-0.147-1.804-0.617-0.553-0.403-1.047-0.348-1.308 0.003-0.261 0.351-0.169 2.481 0.152 2.939 0.321 0.458 0.697-0.298 1.249-0.327 0.552-0.028 1.011 1.103 1.221 1.75 0.107 0.331 0.274 0.633 0.5 0.654 0.226-0.023 0.392-0.326 0.497-0.657 0.207-0.648 0.661-1.781 1.213-1.756 0.553 0.026 0.932 0.78 1.251 0.321 0.319-0.459 0.401-2.59 0.139-2.94-0.262-0.35-0.757-0.403-1.308 0.003v0 0z"
				fill="#CCCCCC"></path>
			</svg>
		</div>
		<footer id="m-footer">
		<div class="Copyright" style="color:#bdc3c7">
			<p>
				技术支持
				<a href="https://github.com/shl4sg" target="_blank" style="color:#7fffd4">石华龙</a>
			</p>
		</div>
		</footer>
		
		<!--浏览器样式调整 -->
		<script type="text/javascript">
		$(function() {
			
			var userFlag=$('#userFlag').html();
	
			if(userFlag==='1'){
				// 当前blog与登录用户为同一个用户
				$('.delFlag').show();
				$('#addFlag').show();
				$('.editFlag').show();
				
			}else{
				$('.delFlag').hide();
				$('#addFlag').hide();
				$('.editFlag').hide();
			
			}
		    
		});
		//<![CDATA[
	
function wptdb_isIE() {
	return /msie/i.test(navigator.userAgent)
			&& !/opera/i.test(navigator.userAgent);
}

function wptdb_getBrowserWidthHeight(w_or_h) {
	var intH = 0;
	var intW = 0;
	if (typeof window.innerWidth == 'number') {
		intH = window.innerHeight;
		intW = window.innerWidth;
	} else if (document.documentElement
			&& (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
		intH = document.documentElement.clientHeight;
		intW = document.documentElement.clientWidth;
	} else if (document.body
			&& (document.body.clientWidth || document.body.clientHeight)) {
		intH = document.body.clientHeight;
		intW = document.body.clientWidth;
	}
	if (w_or_h == 'w') {
		return parseInt(intW);
	}
	if (w_or_h == 'h') {
		return parseInt(intH);
	}
}

function wptdb_getScrollXY(x_or_y) {
  var scrOfX = 0, scrOfY = 0;
  if( typeof( window.pageYOffset ) == 'number' ) {
    //Netscape compliant
    scrOfY = window.pageYOffset;
    scrOfX = window.pageXOffset;
  } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
    //DOM compliant
    scrOfY = document.body.scrollTop;
    scrOfX = document.body.scrollLeft;
  } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
    //IE6 standards compliant mode
    scrOfY = document.documentElement.scrollTop;
    scrOfX = document.documentElement.scrollLeft;
  }
  if (x_or_y == 'x') {
  return scrOfX;
  }
  if (x_or_y == 'y') {
  return scrOfY;
  }
}

function wptdb_resize_demobar_forie() {
var myWidth = wptdb_getBrowserWidthHeight('w');
document.getElementById('wpthemedemobar').style.width = myWidth+'px';
}

function wptdb_close() {
document.getElementById('wpthemedemobar').style.display = 'none'
document.getElementsByTagName('html')[0].style.paddingTop = '0px';

}

//]]>
</script>
		

		<script type="text/javascript"
			src="js/functionall.js?ver=1.0">
</script>
		<script type="text/javascript"
			src="js/home.js?ver=1.0">
</script>
		<!--[if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->

		<div id="wptdb_qTip" style="left: 1525px; top: 881px;"></div>
	</body>
</html>