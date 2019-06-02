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
<title>用户列表</title>
<link rel="stylesheet" href="static/css/base.css">
<link rel="stylesheet" href="static/css/platform.css">
<link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="static/js/main.js"></script>
<script type="text/javascript" src="static/js/manage/index.js"></script>
</head>
<body>
<table id="dg"></table>
 <div id="tb" style="padding:0 30px;">
        纳税人识别号: <input class="easyui-textbox" type="text" name="payerCode" style="width:166px;height:35px;line-height:35px;"/>
        纳税人名称: <input class="easyui-textbox" type="text" name="payerName" style="width:166px;height:35px;line-height:35px;"/>
        <a href="javascript:void(0);" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
        <a href="javascript:void(0);" id="setBtn" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
        <a href="javascript:void(0);" id="addBtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加纳税人</a>
      </div>

<script type="text/javascript">
$("#dg").datagrid({
	url:"manage/taxpayer.do",
	queryParams:{action:"page",
		payerCode:$("input[name=payerCode]").val(),
		payerName:$("input[name=payerName]").val()},
 	toolbar:"#tb",//设置工具条
    striped:true,//将行的展示条纹化
    nowrap:false,//设置内容过多时是否换行，false是换行，true是不换行
    loadMsg:"正在加载，请稍等.....",//设置加载数据时的提示信息
    pagination:true,//设置显示分页工具条
    rownumbers:true,//设置是否显示行号
    singleSelect:true,//设置是否只能选中一行
    pageNumber:1,//设置起始页码
    pageSize:5,//设置每页展示的条数
    pageList:[5,10,15],//设置每页展示展示的条数的下拉列表
columns:[[
	//字段名。标题名。宽
	{field:"payerCode",title:"纳税人识别号",width:100},
	{field:"payername",title:"纳税人名称",width:140},
	{field:"organName",title:"所属税务机关",width:100},//taxOrganId
	{field:"industryName",title:"所属行业",width:140},//industryId
		{field:"legalperson",title:"法人代表",width:100},
	{field:"legalidcard",title:"法人身份证号码",width:160},
	{field:"finacename",title:"主管财务",width:100},
	{field:"finaceidcard",title:"财务身份证号码",width:160},
	{field:"taxername",title:"办税人员",width:100},
	{field:"recorddate",title:"录入日期",width:100},
	{field:"operation",title:"操作",width:100,
		formatter: function(value,row,index){
			return "<a href='javascript:edit("+row.payerCode+");'>修改</a>"+
			"&emsp;<a href='javascript:remove("+row.payerCode+");'>删除</a>"+
			"&emsp;<a href='javascript:addTask("+row.payerCode+");'>新增任务</a>";
			
	}}
]]
});
</script>
</body>
</html>