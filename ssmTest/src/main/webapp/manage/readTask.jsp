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
 <title>任务录入</title>
    <link rel="stylesheet" type="text/css" href="static/css/base.css" >
   	<link rel="stylesheet" href="static/easyui/themes/default/easyui.css">
   	<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/css/edit.css">
    
   	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
	<script src="static/easyui/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
	img{
	width:100px;
	height:100px;
	display:none;
	}
	</style>
</head>
<body>
<div class="container">
    <div class="content">
        <div title="纳税人信息" data-options="closable:false" class="basic-info">
            <div class="column"><span class="current">纳税人基本信息</span></div>
     		 <form id="fm1" class="easyui-form">
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">纳税人识别号</td>
                    <td class="kv-content"><input type="text" name="payerCode" value="1001200102"
                                                  placeholder="请输入纳税人识别号，获取纳税人信息"></td>
                    <td class="kv-label">纳税人名称</td>
                    <td class="kv-content">
                    <input type="text" type="text" name="payername">
                    </td>
                    <td class="kv-label">生产经营地址</td>
                    <td class="kv-content">
                    	<input type="text" type="text" name="bizaddress">
					</td>
                </tr>
                <tr>
                    <td class="kv-label">所属税务机关</td>
                    <td class="kv-content">
                    	<select name="taxorganid" disabled >
                                
                            </select>
                    </td>
                    <td class="kv-label">行业</td>
                    <td class="kv-content">
                    <select name="industryid" disabled>
                                
                            </select>
                    </td>
                    <td class="kv-label">经营范围</td>
                    <td class="kv-content">
                    	 <input type="text" name="bizscope">
                    </td>
                </tr>
                <tr>
                    <td class="kv-label">票种核定</td>
                    <td class="kv-content">
                    <input type="text" name="invoicetype" >
                    </td>
                    <td class="kv-label">法人代表人</td>
                    <td class="kv-content"> <input type="text" name="legalperson"></td>
                    <td class="kv-label">法人身份证号</td>
                    <td class="kv-content"><input type="text" name="legalidcard"></td>
                </tr>
                <tr>
                    <td class="kv-label">主管财务</td>
                    <td class="kv-content"><input type="text" name="finacename" ></td>
                    <td class="kv-label">财务身份证号</td>
                    <td class="kv-content"><input type="text" name="finaceidcard" ></td>
                    <td class="kv-label">税收管理员</td>
                    <td class="kv-content">田壮壮</td>
                </tr>
                <tr>
                    <td class="kv-label">办税人员</td>
                    <td class="kv-content">
                    <input type="text" name="taxername">
                     </td>
                    <td class="kv-label">录入日期</td>
                    <td class="kv-content">
                    <input type="text" name=recorddate>
                    </td>
                    <td class="kv-label">录入人</td>
                    <td class="kv-content user">
                    
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
             <div class="column"><span class="current">任务信息</span></div>
            <form id="fm2">
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">任务名称</td>
                    <td class="kv-content"><input type="text" name="taskname" placeholder="请输入任务名称"></td>
                    <td class="kv-label">下达部门</td>
                    <td class="kv-content">
                    <select name="suborganid"></select>
                    </td>
                    <td class="kv-label">批准人</td>
                    <td class="kv-content">
                      <select name="approverid"></select>
                    </td>
                </tr>
                <tr>
                    <td class="kv-label">执行人</td>
                    <td class="kv-content">
                   <select name="executeid"></select>
                    </td>
                    <td class="kv-label">执行时间</td>
                    <td class="kv-content">
                       <input id="datebox" type="text"  name="executetime">
                    </td>
                    <td class="kv-label">风险登记</td>
                    <td class="kv-content">
                        <select name="risklevel">
                            <option value="0">请选择</option>
                            <option value="1">高</option>
                            <option value="2">中</option>
                            <option value="3">低</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="kv-label">任务执行情况</td>
                    <td class="kv-content">
                        <textarea name="taskstate" rows="3" style="width: 90%;"></textarea>
                    </td>
                    <td class="kv-label">调查结论和意见</td>
                    <td class="kv-content" colspan="3">
                        <textarea name="idea" rows="3" style="width: 90%;"></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
            <div class="column">
                <span class="current">图片信息</span>
            </div>
           
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">图片信息</td>
                    <td class="kv-content">
                     <form id="imgForm1" enctype="multipart/form-data" method="post"  data-options="novalidate:true" >                 
                       <input class="imgFile1" type="file" name="file" accept="image/png,image/jpeg"  title="支持png,jpg格式">
                        <img src="" alt="上传图片1">
                     </form>
                     
                    </td>
                    <td class="kv-label">图片说明</td>
                    <td class="kv-content" colspan="3">
                        <input type="text" name="imageNote" style="width:80%" placeholder="请输入图片描述信息">
                    
                    </td>
                </tr>
                <tr>
                    <td class="kv-label">图片信息</td>
                    <td class="kv-content">
                      <form id="imgForm2" enctype="multipart/form-data" method="post"  data-options="novalidate:true" >                 
                       <input class="imgFile2" type="file" name="file" accept="image/png,image/jpeg" title="支持png,jpg格式">
                        <img src="" alt="上传图片2">
                     </form>
                    </td>
                    <td class="kv-label">图片说明</td>
                    <td class="kv-content" colspan="3">
                        <input type="text" name="imageNote" style="width:80%" placeholder="请输入图片描述信息">
                       
                    </td>
                </tr>
                <tr>
                    <td class="kv-label">图片信息</td>
                    <td class="kv-content">
                        <form id="imgForm3" enctype="multipart/form-data" method="post"  data-options="novalidate:true" >                 
                       <input class="imgFile3" type="file" name="file" accept="image/png,image/jpeg"  title="支持png,jpg格式">
                        <img src="" alt="上传图片3">
                     </form>
                    </td>
                    <td class="kv-label">图片说明</td>
                    <td class="kv-content" colspan="3">
                        <input type="text" name="imageNote" style="width:80%" placeholder="请输入图片描述信息">
                       
                    </td>
                </tr>
                </tbody>
            </table>
            
            <div class="column">
                <span class="current">视频信息</span>
            </div>
            <form id="fm4">
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">视频信息</td>
                    <td class="kv-content">
                        <input type="file" name="vedio" accept="video/mp4">
                    </td>
                    <td class="kv-label">视频说明</td>
                    <td class="kv-content" colspan="3">
                        <input type="text" name="imageNote" style="width:80%" placeholder="请输入视频描述信息">
                    </td>
                </tr>
                <tr>
                    <td class="kv-label">视频信息</td>
                    <td class="kv-content">
                        <input type="file" name="vedio" accept="video/mp4">
                    </td>
                    <td class="kv-label">视频说明</td>
                    <td class="kv-content" colspan="3">
                        <input type="text" name="imageNote" style="width:80%" placeholder="请输入视频描述信息">
                    </td>
                </tr>
                <tr>
                    <td class="kv-label">视频信息</td>
                    <td class="kv-content">
                        <input type="file" name="vedio" accept="video/mp4">
                    </td>
                    <td class="kv-label">视频说明</td>
                    <td class="kv-content" colspan="3">
                        <input type="text" name="imageNote" style="width:80%" placeholder="请输入视频描述信息">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        </div>
        <div class="btn-selection">
            <a id="close" href="javascript:void(0);" class="easyui-linkbutton save-btn" data-options="selected:true">确定</a>
        </div>
    </div>
<!--    </form> -->
</div>

</body>
<script>
//格式化fm1
$("input,textarea").prop("readOnly",true);
$("select,[type=file]").prop("disabled",true);
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
//显示用户名
$.get(
		"manage/index.do",
		{},
		function(data){
			$(".user").text(data.name);
		},
		"json"
		);
//填充录入人下拉框（默认是登陆的人，所以不写下拉框了）
// $.get("manage/user.do",
// 		{action:"list"},
// 		function(data){
// 			$("[name=userId]").empty();
// 			$("[name=userId]").append($(" <option value='-1'>请选择录入人</option>"));
// 			$.each(data,function(index,user){
// 				$("[name=userId]").append($(" <option value='"+user.id+"'>"+user.userName+"</option>"));
// 			})
// 		},
// 		"json");
//填充执行人下拉框
$.get("manage/taxer.do",
		{action:"list"},
		function(data){
			$("[name=executeid]").empty();
			$("[name=executeid]").append($(" <option value='-1'>请选择执行人</option>"));
			$.each(data,function(index,taxer){
				$("[name=executeid]").append($(" <option value='"+taxer.id+"'>"+taxer.clerk+"</option>"));
			})
		},
		"json");
//填充批准人下拉框
$.get("manage/taxer.do",
	{action:"list"},
	function(data){
		$("[name=approverid]").empty();
		$("[name=approverid]").append($(" <option value='-1'>请选择批准人</option>"));
		$.each(data,function(index,taxer){
			if(taxer.boss!="没有领导"){
				$("[name=approverid]").append($(" <option value='"+taxer.id+"'>"+taxer.boss+"</option>"));
			}else{
				$("[name=approverid]").append($(" <option value='"+taxer.id+"'>"+"章莉"+"</option>"));
			}
		})
	},
	"json");
//填充部门下拉框		
$.get("manage/taxOrgan.do",
	{action:"list"},
	function(data){
		$("[name=taxorganid],[name=suborganid]").empty();
		$("[name=taxorganid],[name=suborganid]").append($(" <option value='-1'>请选择部门</option>"));
		$.each(data,function(index,organ){
			$("[name=taxorganid],[name=suborganid]").append($(" <option value='"+organ.id+"'>"+organ.organname+"</option>"));
		})
	},
	"json");
//填充行业下拉框		
$.get("manage/industry.do",
	{action:"list"},
	function(data){
		$("[name=industryid]").empty();
		$("[name=industryid]").append($(" <option value='-1'>请选择部门</option>"));
		$.each(data,function(index,industry){
			$("[name=industryid]").append($(" <option value='"+industry.id+"'>"+industry.industryname+"</option>"));
		})
	},
	"json");
//上传文本
$("#fm2").form({
	url:"manage/taxSource.do",
	onSubmit:function(param){
		param.action="save";
		param.kind='text';
		//开始验证，不通过返回false
		if($("select[name=risklevel] option:checked").val()==0){
			alert("请选择风险类型");
			return false;
		}
		//阻止提交
		if(!($("img").attr("src")==""&&$("[name=imageNote]").val()=="")){
			$.messager.alert("警告","添加完整的图片信息");
			return false;
		}
	
		return $("#fm2").form('validate');
	},
	success:function(data){
		data =$.parseJSON(data);
		console.log("success="+data.success);
			if(data.success){
				$.messager.show({
					title:'提示信息',
					msg:'添加成功',
					showType:'show',
					timeout:500,
						style:{
 							right:'',
 							top:document.body.scrollTop+document.documentElement.scrollTop,
							bottom:''
						}
				});
			}else{
				$.messager.alert("警告","添加失败");
			}
			//表单提交完成，再执行图片信息的添加
			addImgInfo();
	}
});
            
//上传图片
//回显图片
var imgArrayUrl=new Array(3);
var imgArrayInfo=new Array(3);

function backImg(id){
		$(".imgFile"+id).change(function(){
			var form=document.getElementById("imgForm"+id);
			//必须用原生js获取
			var formData=new FormData(form);
			function getAjaxReturn(){
				$.ajax({
					url:"manage/upload.do?action=upload",
					data:formData,
					type:"POST",
					async:false,//同步
					contentType:false,
					processData:false,
					success:function(data){
						//console.log(data.name);
					//	console.log(data.url);
						//var img={
				//		name:data.name,
						//	url:data.url
						//};
						//向数组特定位置添加img对象
						//imgArray[id]=img;
						imgArrayUrl[id-1]=data.url;
						$(".imgFile"+id).next().attr("src","../"+data.url);
						$(".imgFile"+id).next().css("display","block");
						//console.log("imgArrayinner="+imgArray);
					}
				});
				//同步，有返回值以后，才会进行下面的操作
				return imgArrayUrl;
			}
			//获得ajax的返回值
			imgArrayUrl=getAjaxReturn();
			//console.log("imgArray="+imgArray[id].name);
		});
};
backImg(1);
backImg(2);
backImg(3);

$("input[name=imageNote]").blur(function(){
	imgArrayInfo[0]=$("input[name=imageNote]").eq(0).val();
	imgArrayInfo[1]=$("input[name=imageNote]").eq(1).val();
	imgArrayInfo[2]=$("input[name=imageNote]").eq(2).val();
});





//上传视频
$("#fm4").form({
	url:"",
	onSubmit:function(param){
		param.action="upload";
	},
	success:function(){
		
	}
});
//获得请求的参数
var payerCode="${param.payerCode}";
	$("input[name=payerCode]").val(payerCode);
//回填数据fm1
$("input[name=payerCode]").blur(function(){
	//判断合法性
	payerCode=$(this).val();
	$('#fm1').form('load','manage/taxpayer.do?action=edit&payerCode='+payerCode);
});
	if(payerCode){
		//easyui表单数据回填
		$('#fm1').form('load','manage/taxpayer.do?action=edit&payerCode='+payerCode);
	}
//回填数据fm2	
var id = "${param.id}";	
console.log("id="+id);
	if(id){
		console.log("fm2回填执行了");
		$("#fm2").form("load","manage/taxSource.do?action=get&id="+id);
	}
//添加图片信息的方法
	function addImgInfo(){
	//阻止提交
	if(!($("img").attr("src")!=""&&$("[name=imageNote]").val()!=null)){
		$.messager.alert("警告","添加完整的图片信息");
		return;
	}
		$.get(
				"manage/taxSource.do",
				{'url':imgArrayUrl.join('--'),'info':imgArrayInfo.join('--'),'action':'save','kind':'img'},
				function(data){
					if(data.success){
						$.messager.show({
							title:"提示",
							msg:"添加成功",
							showType:"slide",
							timeout:1000
						});
					}else{
						$.messager.show({
							title:"提示",
							msg:"添加失败",
							showType:"slide",
							timeout:1000
						});
					}
				},
				"json"
				);	
	}	
	$("input[name=payerCode]").on("blur",function(){
		loadData();
	});
//保存按钮的点击事件
	$("#close").on("click",function(){
		//$("#fm2").submit();
		//addImgInfo();
		
		//图片信息的添加在回调里调用
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
		isNumber: {
		        validator: function (value, param) {
		            return /^-?\d+\.?\d*$/.test(value);
		        },
		        message: '请输入正确的数字!'
		    },
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
		      name : {// 验证姓名，可以是中文或英文| /^\w+[\w\s]+\w+$/i.test(value)
		    	  validator : function(value) {
		    	  return /^[\u0391-\uFFE5]+$/i.test(value) ;
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
	

//     $("input[name=executeTime]").datebox({
//         formatter: easyUIFormater,
//         parser: easyUIparser
//     });
</script>
</html>


