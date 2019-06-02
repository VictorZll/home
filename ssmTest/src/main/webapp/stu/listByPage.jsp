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
<title>分页展示</title>
<link rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function update(id){
	location.href="update?id="+id;
// 	$.post(
// 		"update",
// 		{"id":id},
// 		function(data){
// 			if(data){
				
// 			}
// 		},
// 		"json"
// 	);
	//alert(1);
}
function remove(id){
	$.get(
	"remove",
	{id:id-0},
	function(data){
		alert(data);
		loadData();
	}
	);
}
function loadData(){
	$("#dg").datagrid({
		url:"listByPage",
		pagination:true,//设置显示分页工具条
		rownumbers:true,//设置是否显示行号
		pageNumber:1,//设置起始页码
		pageSize:10,//设置每页展示的条数
		singleSelect:true,
		pageList:[5,10,15],//设置每页展示展示的条数的下拉列表
		columns:[[
			{field:"stuNo",title:"学号",width:100},
			{field:"stuName",title:"姓名",width:100},
			{field:"stuSex",title:"性别",width:100},
			{field:"stuAge",title:"年龄",width:100},
			{field:"id",title:"操作",width:100,formatter:function(value,row,index){
				return "<a href='javascript:void(0);update("+value+")'>修改</a>&emsp;<a href='javascript:void(0);remove("+value+")'>删除</a>";
			}}
		]]
	});	
}
$(function(){
	loadData();
});
</script>
</head>
<body>
	<a href="stu/add.jsp" >去添加</a>
	<table id="dg"></table>
</body>
</html>