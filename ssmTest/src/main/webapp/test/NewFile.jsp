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
</head>
<body>
修改密码
<form>
	<table>
		<caption>修改密码</caption>
		<tr>
			<td>原密码</td><td><input type="password"></td>
		</tr>
		<tr>
			<td>新密码</td><td><input type="password"></td>
		</tr>
		<tr>
			<td>重新输入新密码</td><td><input type="password"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="提交">	<input type="reset" value="重置">
			</td>
		</tr>
	</table>
</form>
</body>
</html>