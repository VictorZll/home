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
<title>任务查询</title>
<link href="static/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
<link rel="stylesheet" href="static/css/providers1.css">
<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
<script src="static/easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!-- 
<thead>
                <tr>
                    <th field="taskName" width="110">任务名称</th>
                    <th field="payerCode" width="112">纳税人识别号</th>
                    <th field="payerName" width="226">纳税人名称</th>
                    <th field="industryName" width="170">行业</th>
                    <th field="bizScope" width="130">经营范围</th>
                    <th field="executeTime" width="136">执行时间</th>
                    <th field="recordTime" width="120">录入时间</th>
                    <th field="overDays" width="105">录入超时(天)</th>
                    <th field="operation" width="105">操作</th>
                </tr>
            </thead>
 -->
    <div class="container">
       <table id="dg"></table>
      <div id="tb" style="padding:0 30px;">
        <div class="conditions">
            <span class="con-span">纳税人识别号: </span><input class="easyui-textbox" type="text" name="payerCode" style="width:166px;height:35px;line-height:35px;">
            <span class="con-span">纳税人名称: </span><input class="easyui-textbox" type="text" name="payerName" style="width:166px;height:35px;line-height:35px;">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true" id="search">查询</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload" id="reset">重置</a>
            <a href="javascript:void(0);" class="easyui-linkbutton more" iconCls="icon-more">更多</a>
        </div>
        <div class="conditions hide">
            <span class="con-span">税务机关: </span><select class="change" name="taxorganid" style="width:166px;height:35px;line-height:35px;"></select>
            <span class="con-span">任务开始时间: </span><input class="easyui-datebox change" type="text" name="beginTime" style="width:166px;height:35px;line-height:35px;">
            <span class="con-span">任务结束时间: </span><input class="easyui-datebox change" type="text" name="endTime" style="width:166px;height:35px;line-height:35px;">
            <span class="con-span">行业: </span><select class="change" name="industryid" style="width:166px;height:35px;line-height:35px;"></select>
        </div>
      </div>
    </div>

    <script type="text/javascript">
  //填充所属税务机关下拉列表
    $.get("manage/taxOrgan.do",
    		{action:"list"},
    		function(data){
    			$("[name=taxorganid]").empty();
    			$("[name=taxorganid]").append($(" <option value=''>请选择所属税务机关</option>"));
    			$.each(data,function(index,taxOrgan){
    				$("[name=taxorganid]").append($(" <option value='"+taxOrgan.id+"'>"+taxOrgan.organname+"</option>"));
    			})
    		},
    		"json");
    //填充所属行业下拉列表		
    $.get("manage/industry.do",
    		{action:"list"},
    		function(data){
    			$("[name=industryid]").empty();
    			$("[name=industryid]").append($(" <option value=''>请选择所属行业</option>"));
    			$.each(data,function(index,industry){
    				$("[name=industryid]").append($(" <option value='"+industry.id+"'>"+industry.industryname+"</option>"));
    			})
    		},
    		"json");

    $("#search").on("click",function(){
    	loadData();
    });
    $("#reset").on("click",function(){
    	$("input").val("");
    	$("select option:contains('请选择')").prop("selected",true);
    	loadData();
    });
    $(".more").click(function(){
        $(this).closest(".conditions").siblings().toggleClass("hide");
    });
    function loadData(){
		$("#dg").datagrid({
			url:"manage/taxSource.do",
			queryParams:{action:"page",
				payerCode:$("input[name=payerCode]").val(),
				payerName:$("input[name=payerName]").val(),
				taxorganid:$("select[name=taxorganid] option:selected").val(),
				industryid:$("select[name=industryid] option:selected").val(),
				beginTime:$("input[name=beginTime]").val(),
				endTime:$("input[name=endTime]").val()},
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
				{field:"taskname",title:"任务名称",width:100},
				{field:"payercode",title:"纳税人识别号",width:100},
				{field:"payername",title:"纳税人名称",width:140},
				{field:"organname",title:"所属税务机关",width:100},
				{field:"industryname",title:"行业",width:140},
				{field:"bizscope",title:"经营范围",width:100},
				{field:"executetime",title:"执行时间",width:160},
				{field:"recordtaskdate",title:"录入时间",width:100},
				{field:"outtime",title:"录入超时(天)",width:120,
					formatter:function(value,row,index){
						return value>0?value:"没有超时";
					}},
				{field:"id",title:"操作",width:160,
					formatter: function(value,row,index){
					
						return '<a href="javascript:editTask('+row.id+','+row.payercode+')">修改</a>&emsp;<a href="javascript:readTask('+row.id+','+row.payercode+')">查看</a>&emsp;<a href="javascript:remove('+row.id+');">删除</a>';
					
				}}
			]]
		});
	 
    };
 
		loadData();
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
	  //修改任务
		function editTask(id,payercode){
			openTopWindow({
 				width:900,
 				height:600,
 				title:"修改任务",
 				url:"manage/editTask.jsp?payerCode="+payercode+"&id="+id
 			})
		};
		//查看任务
		function readTask(id,payercode){
			openTopWindow({
 				width:900,
 				height:600,
 				title:"查看任务",
 				url:"manage/readTask.jsp?payerCode="+payercode+"&id="+id
 			})
		};
		function remove(id){
			$.messager.confirm("对话框","确定要删除id为"+id+"的信息吗",function(r){
				if(r){
					$.post("manage/taxSource.do",
							{"action":"remove",
							"id":id},
							function(data){
								console.log(data.success);
								if(data.success){
									$.messager.show({
										title:"我的消息",
										msg:"操作成功",
										timeout:1000,
										showType:"slide"
									});
									loadData();
								}
							},
							"json"
							);
				}else{
					$.messager.show({
						title:"我的消息",
						msg:"你取消了操作",
						timeout:1000,
						showType:"slide"
					});
				}
			});
		
		};
		   $(".change").change(function(){
		    	loadData();
		    });
 
    </script>
</body> 
</html>
