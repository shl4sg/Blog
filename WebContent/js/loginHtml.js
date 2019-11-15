var loginHtml ='<div id="loginHtml">'+
'<div class="Indexleft">' +
'<div id="respond"><form  method="post" id="commentform">'+											
'<div class="comment-login">微信号</div>'+
'<div class="comment-login" style="font-size:16px;margin-top:-50px">shl4sg</div>'+
'<div class="comment-login" style="margin-top:-50px">'+
'<img src="images/wechatnumber.jpg">'+
'</div>'+
'</form></div>'+
'</div>'+
'<div class="Indexright">' +
'<div id="respond" ><form  method="post" id="commentform">'+											
	'<div class="comment-login">请登录</div>'+
	'<div class="comment-login" style="font-size:16px;margin-top:-40px">'+
	'<ul style="margin-left:-100px">'+
	'<li class="form-inline">'+
	'<label>账号：</label>'+
	'<input type="text" name="user" id="user" value="" tabindex="1" aria-required="true">'+
	'</li>'+
	'<li class="form-inline">'+
	'<label>密码：</label>'+
	'<input type="password" name="ps" id="ps" value="" tabindex="2" aria-required="true">'+
	'</li>'+
	'<li class="form-inline" style="margin-left:80px">'+
	'<label>验证码：</label>'+
	'<input type="hidden" name="hiddencode" id="hiddencode"/>'+
	'<input class="wenbenkuang" style="width:100px" name="verifycode" id="verifycode" type="text" value="" maxLength=2 size="3"  onkeydown="keyLogin();">'+
	'<span id="showspan" name="showspan" style="border:5px;font-weight:bold;background:#131313;color:white"></span>'+
	'<a class="kanbuqing" href="javascript:void(0)" onClick="getverifycodeChange();">换一题</a>'+  												
	'</li>'+
	'</ul>'+
	'</div>'+
	'<div class="comment-login"><input name="submit" type="button" id="save" onclick="loginIn()"  class="submitButton" tabindex="5" value="登录">' +
	'<input name="submit" type="button" id="save" onclick="loginIn()"  class="submitButton" tabindex="5" value="忘记密码？">' +
	'</div>'+
	'</form></div>'+
	'</div>'+
	'<div class="Indexcenter"></div>'+
'</div>';