<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>河南省金税三期税源信息管理系统</title>
    <link type="text/css" rel="stylesheet" href="static/css/base.css" />
    <link href="static/css/login/login.css" rel="stylesheet">
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
   	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
   	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
</head>
<body>
	<div class="login-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="sys-name">xx省国税税源信息管理系统</span>
		</div>
	</div>
	<div class="login-bd">
		<div class="bd-inner">
			<div class="inner-wrap">
				<div class="lg-zone">
					<div class="lg-box">
						<div class="lg-label"><h4>用户登录</h4></div>
						<div class="alert alert-error">
			              <i class="iconfont">&#xe62e;</i>
			              <span>请输入用户名</span>
			            </div>
						<form>
							<div class="lg-username input-item clearfix">
								<i class="iconfont">&#xe60d;</i>
								<input type="text" name="username" placeholder="系统账号">
							</div>
							<div class="lg-password input-item clearfix">
								<i class="iconfont">&#xe634;</i>
								<input type="password" name="pwd" placeholder="系统密码">
							</div>
							<div class="lg-check clearfix">
								<div class="input-item">
									<i class="iconfont">&#xe633;</i>
									<input type="text" name="verifyCode" placeholder="验证码">
								</div>
								<img class="check-code verifyCode" style="width:114px;height:42px;border:1px solid" alt="" src="kcaptcha.jpg">
								<!-- <span class="check-code verifyCode">XD34F</span> -->
							</div>
							<div class="tips clearfix">
								<label><input type="checkbox" checked="checked">记住用户名密码(默认7天)</label>
								<a href="javascript:;" class="forget-pwd">忘记密码？</a>
							</div>
							<div class="enter">
								<a href="javascript:void(0);" class="supplier">登录</a>
								<a href="javascript:void(0);" class="purchaser">重置</a>
							</div>
						</form>
					</div>
				</div>
				<div class="lg-poster"></div>
			</div>
		</div>
	</div>
	<div class="login-ft">
		<div class="ft-inner">
			<div class="about-us">
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">法律声明</a>
				<a href="javascript:;">服务条款</a>
				<a href="javascript:;">联系方式</a>
			</div>
			<div class="address">地址：湖北省洪山区光谷国际广场B座24楼&nbsp;邮编：430070&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2017&nbsp;专注系统集成&nbsp;版权所有</div>
			<div class="other-info">建议使用IE8及以上版本浏览器&nbsp;京ICP备&nbsp;17003078号&nbsp;E-mail：service@zhidisoft.com</div>
		</div>
	</div>
	<div  id="dialog" style="padding:20px;line-height: 1.5em;"></div>
</body> 
    
<script type="text/javascript">
$("input").on("blur",function(){
	console.log($(this).val());
})
var isOK=false;
$(document).keypress(function(event){
	     var keycode = (event.keyCode ? event.keyCode : event.which);
	     	//alert(keycode);
	     if(keycode == '13'){
	    	 verifyCode();
	    	 $("input[name=verifyCode]").trigger("blur");
	    	 if(isOK){
	    			$(".supplier").trigger("click");
	    	 };
	     }
	     if(keycode == '122'){
	    	 $("input[name=username]").val("zhangsan");
	    	 $("input[name=pwd]").val("aaaaa");
	     }
	 });

		$("input[name=username]").val($.cookie('uname'));
		//记住用户名 
		 function setCookie(){
			 if($("input[type=checkbox]").prop("checked")){
					//设置cookie
					$.cookie('uname', $("input[name=username]").val(), { expires: 7, path: '/' });
				}else{
					$.cookie('uname',"", { expires: -1, path: '/' });
				}
		 }
		 //setCookie();
		//重置
		$(".purchaser").on("click",function(){
			$("input").val("");
			$(".alert").css("display","none");
			$("input[type=checkbox]").prop("checked",false);
		});

		//验证码点击换图片
			$("img").on("click",function(){
				$(this).attr("src","kcaptcha.jpg");
		});
		//验证码验证过程
		function verifyCode(){
			if($("input[name=verifyCode]").val()==""){
				$(".alert").css("display","block");
				$(".alert span").text("请输入验证码");
				$("input[name=verifyCode]").focus();
				return;
			}
			$.get(
				"validate.do", 
				{"kaptcha" : $("input[name=verifyCode]").val()}, 
			    function(data) {
					if (data.success) {
						//这里调用方法时不能加（小括号）
						isOK=true;
						$(".supplier").on("click",login);
						$("img").css("border","none");
						$(".supplier").css("cursor","pointer");
						$(".alert").css("display","none");
					} else {
						$(".supplier").css("cursor","not-allowed");
						$(".supplier").off("click",login);
						$(".alert").css("display","block");
						$(".alert span").text("验证码错误");
						$("img").trigger("click");
					}
				}, "json");
		};
		$("input[name=verifyCode]").on("blur",verifyCode);
		//点击登陆
		$(".supplier").on("click",login);
		function login(){
			setCookie();
			var uname=$("input[name=username]").val().trim();
			var pwd=$("input[name=pwd]").val().trim();
			var remember=$("input[type=checkbox]")[0].checked?"true":"false";
			//点击登陆前验证
			if(uname==""){
				$(".alert").css("display","block");
				$(".alert span").text("请输入用户名");
				$("input[name=username]").focus();
				return;
			}
			if(pwd==""){
				$(".alert").css("display","block");
				$(".alert span").text("请输入密码");
				$("input[name=pwd]").focus();
				return;
			}
			 verifyCode();
	    	 $("input[name=verifyCode]").trigger("blur");
			if(!isOK){
				$(".alert").css("display","block");
				$(".alert span").text("验证码验证失败");	
				
				return;
			}
			console.log("uname="+uname+",pwd="+pwd+",remember="+remember);
			$.post(
					"login.do",
					{"uname":uname,"pwd":pwd,"remember":remember},
					function(data){
						console.log(data);
						if(data){
							//登陆成功触发重置事件
							$(".purchaser").trigger("click");
							location.href="manage/index.jsp";
						}else{
							$(".alert").css("display","block");
							$(".alert span").text("用户名或密码错误");
						}
					},
					"json"
				);
		};


	//点击忘记密码时
	$(".forget-pwd").on("click",function(e){
		$("#dialog").dialog({
			width:400,
			height : 200,
			title : "友情提示",
			modal : true,
			content :  "亲爱的用户：<br>&nbsp;&nbsp;您好，如您忘记密码，请于本地系统管理员联系，重置用户密码!"
		}).dialog("open");
	});
</script>
</html>

