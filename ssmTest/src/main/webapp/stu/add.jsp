<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>"></base>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
<style type="text/css">
	table{
	margin:40px auto;
	}
	td{
	padding:5px 20px;
	}
</style>
<script type="text/javascript">
$(function(){
	console.log($("[name=id]").val());
	var id=$("[name=id]").val();
	if(id!=null&&id!=""){
		$("[name=stuNo]").prop("readOnly",true);
		$.get(
		"getStuById",
		{"id":id},
		function(data){
			console.log(data);
			if(data.stuSex=="男"){
				$("[value='男']").prop("checked",true);
			}else{
				$("[value='女']").prop("checked",true);
			}
		},
		"json"
		);
	}
});
//$("#fm").form("load","getStuById?id=1");
$("[type=submit]").click(function(){
	$("#fm").preventDefault();
	alert(1);
});
</script>
</head>
<body>

	<form id="fm" action="">
		<table border="1" role="all" >
			<tr>
				<td>学号</td>
				<td>
<%-- 				${stu.stuNo} --%>
				<input type="text" name="stuNo"  value="${stu.stuNo}" >
				<input type="hidden" name="id"  value="${stu.id}" >
				</td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text" name="stuName" value="${stu.stuName}" ></td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
					<input type="radio" name="sex" value="男" id="man"  ><label for="man" >男</label> 
					<input type="radio" name="sex" value="女" id="woman"  ><label for="woman" >女</label> 
				</td>
			</tr>
			<tr>
				<td>年龄</td>
				<td><input type="text" name="stuAge"  value="${stu.stuAge}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" >&emsp;<input type="reset" ></td>
			</tr>
		</table>
	</form>
</body>
</html>