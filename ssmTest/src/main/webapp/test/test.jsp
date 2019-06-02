<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html >
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<base href="<%=basePath%>"></base>
   	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<form id="form" action="task.do?action=upload" enctype="multipart/form-data" method="post" >
	<input type="file" name="file" accept="image/png,image/jpeg">
	<input type="file" name="file" accept="image/png,image/jpeg">
	<input type="submit" value="上传"> 
	</form>
	<img alt="" src=""><img alt="" src=""><img alt="" src=""><img alt="" src="">
	<p>点击提交</p>
</body>
<script type="text/javascript">
var a=1;
function b(){
	 a=2;
};b();
console.log("a="+a);
$("input").change(function(){
	$("form").submit();
});
	$("p").click(function(){
		$("form").submit();
	});
function num(){
	var num1=15;
	return function(){
		num1=13;
		return num1;
	}
}
var num2=num();
var num3=num2();
//alert(num3);
var imgA=[];
var img={
		name:"pic1.png",
		url:"1.png"
};
imgA[imgA.length]=img;
console.log(imgA[0].name);

</script>
</html>