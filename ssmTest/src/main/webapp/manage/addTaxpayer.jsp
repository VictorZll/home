<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>

<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>"></base>
<title>添加纳税人</title>
    <link rel="stylesheet" type="text/css" href="static/css/base.css" >
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
   	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
   	<link rel="stylesheet" type="text/css" href="static/css/edit.css">
   	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	<script src="static/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="static/js/validate.js"></script>
    
</head>
<body>
    <div class="container">
        <div class="content">
            <div title="纳税人信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">添加纳税人信息</span></div>
                <form id="form1" method="post">
                <table class="kv-table">
                    <tbody>
                    <tr>
                        <td class="kv-label">纳税人识别号</td>
                        <td class="kv-content"><input type="text" name="payerCode" placeholder="纳税人识别号" class="easyui-validatebox" title="不可重复" data-options="required:true,validType:['isNumber','unique','minLength[4]']" ></td>
                        <td class="kv-label">纳税人名称</td>
                        <td class="kv-content"><input type="text" name="payername" placeholder="纳税人名称" class="easyui-validatebox" data-options="required:true,validType:['CHS','minLength[2]']"></td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产经营地址</td>
                        <td class="kv-content"><input type="text" name="bizaddress" placeholder="生产经营地址"  class="easyui-validatebox" data-options="required:true,validate:['CHS','minLength[5]']"  ></td>
                        <td class="kv-label">生成经营地电话</td>
                        <td class="kv-content"><input type="text" name="bizaddressphone" placeholder="生产经营地电话"  class="easyui-validatebox" data-options="validType:'tel'" ></td>
                    </tr>
                    <tr>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content">
                            <select name="taxorganid">
<!--                                 <option value="-1">请选择所属税务机关</option> -->
<!--                                 <option value="1">中国国税局</option> -->
<!--                                 <option value="2">北京市国税局</option> -->
<!--                                 <option value="3">天津市国税局</option> -->
<!--                                 <option value="4">上海市国税局</option> -->
<!--                                 <option value="5">深圳市国税局</option> -->
<!--                                 <option value="6">武汉市国税局</option> -->
<!--                                 <option value="7">杭州市国税局</option> -->
                            </select>
                        </td>
                        <td class="kv-label">行业</td>
                        <td class="kv-content">
                            <select name="industryid">
<!--                                 <option value="-1">请选择纳税人行业</option> -->
<!--                                 <option value="1">计算机应用相关</option> -->
<!--                                 <option value="2">房地产</option> -->
<!--                                 <option value="3">生物医药</option> -->
<!--                                 <option value="4">金融</option> -->
<!--                                 <option value="5">汽车工业</option> -->
<!--                                 <option value="6">通讯工程</option> -->
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产经营范围</td>
                        <td class="kv-content">
                            <input type="text" name="bizscope" placeholder="生产经营范围"   class="easyui-validatebox" data-options="validType:['CHS','minLength[3]']">
                        </td>
                        <td class="kv-label">票种核定</td>
                        <td class="kv-content">
                            <select name="invoicetype">
                               <option value="-1">请选择发票种类</option>
                                <option value="增值税普通发票">增值税普通发票</option>
                                <option value="增值税专用发票">增值税专用发票</option> 
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">法人代表人</td>
                        <td class="kv-content">
                            <input type="text" name="legalperson" placeholder="法人姓名"  class="easyui-validatebox" data-options="validType:['name','minLength[2]']" >
                        </td>
                        <td class="kv-label">法人身份证号</td>
                        <td class="kv-content">
                            <input type="text" name="legalidcard" placeholder="法人代表身份证号码"  class="easyui-validatebox" data-options="validType:'idCode'"  >
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">主管财务</td>
                        <td class="kv-content">
                            <input type="text" name="finacename" placeholder="主管财务" class="easyui-validatebox" data-options="validType:['name','minLength[2]']" >
                        </td>
                        <td class="kv-label">财务身份证号</td>
                        <td class="kv-content">
                            <input type="text" name="finaceidcard" placeholder="财务身份证号" class="easyui-validatebox" data-options="validType:'idCode'"  >
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">办税专员</td>
                        <td class="kv-content">
                            <select name="taxername">
                           <!-- <option value="-1">请选择办税专员</option>
                                <option value="张晓天">张晓天</option>
                                <option value="樊明明">樊明明</option>
                                <option value="李飞">李飞</option>
                                <option value="刘东">刘东</option> -->
                            </select>
                        </td>
                        <td class="kv-label">录入日期</td>
                        <td class="kv-content">       <input id="datebox" type="text"  name="recorddate"></td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
            <div class="btn-selection">
                <a id="save"  onclick="submitForm()" href="javascript:void(0);" class="easyui-linkbutton save-btn" data-options="selected:true">保存</a>
                <a id="reset"  onclick="clearForm()" href="javascript:void(0);" class="easyui-linkbutton reset-btn" data-options="selected:true">重置</a>
            </div>
        </div>
    </div>
  
</body>
<script type="text/javascript">
//初始化录入日期，日期框
$("#datebox").datebox({
	formatter:function(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+"-"+m+"-"+d;
	}
});
//设置默认日期
    var da = new Date();
    var year = da.getFullYear();
    var month = da.getMonth()+1;
    var date = da.getDate();
	var now=[year,month,date].join('-');
$('#datebox').datebox('setValue',now);
//填充所属税务机关下拉列表
$.get("manage/taxOrgan.do",
		{action:"list"},
		function(data){
			$("[name=taxorganid]").empty();
			$("[name=taxorganid]").append($(" <option value='-1'>请选择所属税务机关</option>"));
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
			$("[name=industryid]").append($(" <option value='-1'>请选择所属行业</option>"));
			$.each(data,function(index,industry){
				$("[name=industryid]").append($(" <option value='"+industry.id+"'>"+industry.industryname+"</option>"));
			})
		},
		"json");
//填充票种核定下拉列表	
//填充办税专员下拉列表
$.get("manage/taxer.do",
		{action:"list"},
		function(data){
			$("[name=taxername]").empty();
			$("[name=taxername]").append($(" <option value='-1'>请选择办税专员</option>"));
			$.each(data,function(index,taxer){
				$("[name=taxername]").append($(" <option value='"+taxer.taxername+"'>"+taxer.taxername+"</option>"));
			})
		},
		"json");
//点击保存的事件
// $("#save").on("click",function(){
	
// 	$('#form1').submit();
// 	$.messager.progress();	// display the progress bar
// });
function clearForm(){
	$("#form1").form("clear");
}

//让表单（form）成为 ajax 提交的表单（form）
function submitForm(){
	$('#form1').form('submit', {
		url: "manage/taxpayer.do",
		onSubmit: function(param){
			var payerCode = "${param.payerCode}";
			if(payerCode){
				param.action='update';
			}else{
				param.action='save';
			}
			//做验证
			var isValid = $(this).form('validate');
			console.log(isValid);
			if (isValid){
				if($("[name=taxOrganId]").val()=="-1"){
					$.messager.alert("警告","请选择所属税务机关");
					$.messager.progress('close');	
					return false ;
				}
				if($("[name=industryId]").val()=="-1"){
					$.messager.alert("警告","请选择所属行业");
					$.messager.progress('close');	
					return false ;
				}
				if($("[name=invoiceType]").val()=="-1"){
					$.messager.alert("警告","请选择发票类型");
					$.messager.progress('close');	
					return false ;
				}
				if($("[name=taxerName]").val()=="-1"){
					$.messager.alert("警告","请选择办税专员");
					$.messager.progress('close');	
					return false ;
				}
				if($("[name=finaceIdCard]").val()==$("[name=legalIdCard]").val()){
					if($("[name=legalPerson]").val() != $("[name=finaceName]").val()){
						$.messager.alert("警告","两人的身份证号相同，姓名必须相同");
						return false ;
					}
				}
			}
			//验证成功，开始提交
			//return false;
 			return $("#form1").form('validate');	// return false will stop the form submission
		},
		//提交成功以后的操作
		success: function(data){
			console.log(data);
			data =$.parseJSON(data);
			console.log("data$="+data.success);
			if(data.success){
				$.messager.alert("提示","添加成功");
				parent.$("#topWindow").window("close");
			}else{
				$.messager.alert("警告","添加失败");
			}
			//$.messager.progress('close');	// hide progress bar while submit successfully
		}
});	
};

$.extend($.fn.validatebox.defaults.rules, {
isNumber: {
        validator: function (value, param) {
            return /^-?\d+\.?\d*$/.test(value);
        },
        message: '请输入正确的数字!'
    },
unique:{
	validator:function(value){
		//验证payerCode唯一性
		var flage;
	    function getAjaxReturn(){
	    	$.ajax({
				async:false,//设置同步(有返回值以后，才会进行下面的操作)
				url:"manage/taxpayer.do",
				data:{"payerCode":value,"action":"get"},
				type:"post",
				success:function(data){
					//如果重复，返回的是false
						flage=data.isRepeat;
						//从外部获取flage值
				},
				dataType:"json"
			});
	    	return flage;
	    }
		return getAjaxReturn();//获得ajax返回值
	},
	message:"编号重复"
} ,  
minLength:{
	validator:function(value,param){
		return value.length>=param[0];
	},
	message:"最少输入位{0}字符"
},
CHS: {
    validator: function (value, param) {
      return /^[\u0391-\uFFE5]+$/.test(value);
    },
    message: '请输入汉字'
  },
  tel : {
	    validator : function(value) {
	    var reg = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	    return value.length == 11 && reg.test(value);},
	    message : "请正确填写您的手机号码."
	   },
      name : {// 验证姓名，可以是中文或英文
    	  validator : function(value) {
    	  return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
    	  },
    	  message : '请输入姓名'
    	  },
    idCode:{
              validator:function(value,param){
                return /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value);
              },
              message: '请输入正确的身份证号'
            }
     
          
}
);
</script>
</html>

