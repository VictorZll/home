<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html >
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>"></base>
 <title>未调查企业统计</title>

    <link href="static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
   	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
   	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="static/css/taxpayer.css">
</head> 
<body>
  <div id="tb" style="padding:0 30px;">
        纳税人识别号: <input class="easyui-textbox" type="text" name="payerCode" style="width:166px;height:35px;line-height:35px;"/>
        纳税人名称: <input class="easyui-textbox" type="text" name="payerName" style="width:166px;height:35px;line-height:35px;"/>
        <a href="javascript:void(0);" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
        <a href="javascript:void(0);" id="setBtn" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
        <a href="javascript:void(0);" id="addBtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加纳税人</a>
      </div>
<table id="dg"></table>
<script>
// $("input").on('input propertychange',function(){
// 	loadData();
// });
		//查询单条记录
		$("#searchBtn").on("click",function(){
         	loadData();
         		})
		//添加按钮
		 $("#addBtn").on("click",function(e){
              openTopWindow({
                  width : 750,
                  height : 600,
                  title : "新增纳税人",
                  url : "manage/addTaxpayer.jsp"
              });
           });
		//重置按钮
		$("#setBtn").on("click",function(){
			$("input").val("");
			loadData();
		});
		  /**
          *打开在父窗口中打开window
          */
         function openTopWindow(options){
             options = !options ? {} :options;
             options.width = !options.width ? 500 : options.width;
             
             options.height = !options.height ? 400 : options.height;
           //  console.log(options.height);
             options.url = !options.url ? "404.html" : options.url;
             options.title = !options.title ? "" : options.title;

             parent.$("#topWindow").window({
                 title : options.title,
                 width: options.width,
                 height: options.height,
                 content : "<iframe name=\"iframe\" scrolling='yes' frameborder='0' border='0' height='100%' width='100%' src='"+options.url+"'></iframe>",
                 modal:true,
                 resizable:false,
                 collapsible:false,
                 onClose:function(){
                	 loadData();
                	 $.messager.show({
                		 title:'我的消息',
                			msg:'操作成功',
                			timeout:500,
                			showType:'slide'
                	 });
                 }
             });
         }
	
		function loadData(){
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
			    pageSize:10,//设置每页展示的条数
			    pageList:[5,10,15],//设置每页展示展示的条数的下拉列表
			columns:[[
				//字段名。标题名。宽
				{field:"payerCode",title:"纳税人识别号",width:100},
				{field:"payername",title:"纳税人名称",width:140},
				{field:"organName",title:"所属税务机关",width:100},//taxOrganId
				{field:"industryName",title:"所属行业",width:140},//industryId
				{field:"bizscope",title:"经营范围",width:140},
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
		};
		loadData();
		//新增任务
		function addTask(payerCode){
			//location.href="manage/addTask.jsp?payerCode="+payerCode;
			openTopWindow({
 				width:900,
 				height:600,
 				title:"新增任务",
 				url:"manage/addTask.jsp?payerCode="+payerCode
 			})
		};
		//修改方法
			function edit(payerCode){
    			openTopWindow({
     				width:900,
     				height:600,
     				title:"修改纳税人",
     				url:"manage/editTaxpayer.jsp?payerCode="+payerCode
     			});
    		}
		function abort(){
			$.messager.show({
				title:'提示信息',
				msg:'您取消了操作！',
				timeout:1000,
				showType:'slide'	
			});
		}
		//删除方法
		function remove(payerCode){
			$.messager.confirm("提示信息","确定要删除纳税人识别号为"+payerCode+"的信息吗",function(r){
				if(r){
					$.post(
							"manage/taxpayer.do",
							{"payerCode":payerCode,"action":"remove"},
							function(data){
								if(data.success){
									$("#dg").datagrid("reload");
									$.messager.show({
										title:'提示信息',
										msg:'删除成功！',
										timeout:1000,
										showType:'slide'	
									});
								}else{
									$.messager.alert("执行结果","删除失败！","error");
								}
							},
							"json");
				}else{
					abort();
				}
			});
		
		};

</script>
</body>
</html>