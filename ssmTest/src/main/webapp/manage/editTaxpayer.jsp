<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!-- <!DOCTYPE html> -->
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>"></base>
 <title>修改纳税人</title>
    <link href="static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
   	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <link href="static/css/edit.css" rel="stylesheet">
    
   	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	<script src="static/easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
    <div class="container">
        <div class="content">
            <div title="纳税人信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">修改纳税人信息</span></div>
                <form id="form1">
                <table class="kv-table">
                    <tbody>
                    <tr>
                        <td class="kv-label">纳税人识别号</td>
                        <td class="kv-content"><input type="text" name="payerCode" placeholder="纳税人识别号" class="easyui-validatebox" title="不可修改" readOnly data-options="validType:['isNumber','minLength[4]']" ></td>
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
<script >
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
//回填数据		
var payerCode="${param.payerCode}";
// console.log(payerCode);
if(payerCode!=null){
	//easyui表单数据回填
	$('#form1').form('load','manage/taxpayer.do?action=edit&payerCode='+payerCode);
}
// $.get("manage/taxpayer.do",
// 		{'action':'edit','payerCode':payerCode},
// 		function(data){
// 			console.log(data);
// 			var taxpayer = data.taxPayer;
// 			console.log(taxpayer.payerCode);
// 			$("input[name=payerCode]").val(taxpayer.payerCode);
// 			$("input[name=payerName]").val(taxpayer.payerName);
// 			$("input[name=bizAddress]").val(taxpayer.bizAddress);
// 			$("input[name=bizAddressPhone]").val(taxpayer.bizAddressPhone);
// 			$("select[name=taxOrganId]").find("option[value='"+taxpayer.taxOrganId+"']").attr("selected",true);//
// 			$("select[name=industryId]").find("option[value='"+taxpayer.industryId+"']").attr("selected",true);//
// 			$("input[name=bizScope]").val(taxpayer.bizScope);
// 			$("select[name=invoiceType]").find("option[value='"+taxpayer.invoiceType+"']").attr("selected",true);//
// 			$("input[name=legalPerson]").val(taxpayer.legalPerson);
// 			$("input[name=legalIdCard]").val(taxpayer.legalIdCard);
// 			$("input[name=finaceName]").val(taxpayer.finaceName);
// 			$("input[name=finaceIdCard]").val(taxpayer.finaceIdCard);
// 			$("select[name=taxerName]").find("option[value='"+taxpayer.taxerName+"']").attr("selected",true);;//
// 			$("#datebox").datebox('setValue',taxpayer.recordDate);
// 		},'json');		
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
			console.log("data$="+data);
			if(data.success){
				parent.$("#topWindow").window("close");
				
			}else{
				$.messager.alert("警告","修改失败");
			}
			//$.messager.progress('close');	// hide progress bar while submit successfully
		}
});	
};

		
	
	

// 	function save(){
// 		$('#form1').form('submit', {
// 		    url:"",
// 		    success:function(data){
// 				alert(data)
// 		    }
// 		}); 
// 	}
	
	
	
    $("input[name=executeTime]").datebox({
        //formatter: easyUIFormater,
        //parser: easyUIparser
    });
	

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
							flage=!data.isRepeat;
							//从外部获取flage值
						if(value==payerCode){
							flage=true;
						}	
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

