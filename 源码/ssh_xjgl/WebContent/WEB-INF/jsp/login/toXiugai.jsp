<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title></title>
    <!--框架必需start-->
    <script type="text/javascript" src="${ctx}/libs/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/libs/js/language/cn.js"></script>
    <script type="text/javascript" src="${ctx}/libs/js/framework.js"></script>
    <link href="${ctx}/libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" id="skin" prePath="${ctx}/" scrollerY="true"/>
    <link rel="stylesheet" type="text/css" id="customSkin"/>
    <!--框架必需end-->
    <script src="${ctx}/libs/js/form/validationRule.js" type="text/javascript"></script>
    <script src="${ctx}/libs/js/form/validation.js" type="text/javascript"></script>
    <!-- 日期选择框start -->
    <script type="text/javascript" src="${ctx}/libs/js/form/datePicker/WdatePicker.js"></script>
    <!-- 日期选择框end -->
 <!-- 表单验证start -->
    <script src="${ctx}/libs/js/form/validationRule.js" type="text/javascript"></script>
    <script src="${ctx}/libs/js/form/validation.js" type="text/javascript"></script>
    <!-- 表单验证end -->

    <!-- 表单异步提交start -->
    <script src="${ctx}/libs/js/form/form.js" type="text/javascript"></script>
    <!-- 表单异步提交end -->
    <link href="${ctx}/skin/skin2016/ifstyle.css" rel="stylesheet" type="text/css" />
    <!--数字分页start-->
    <script type="text/javascript" src="${ctx}/libs/js/nav/pageNumber.js"></script>
</head>

<body  style="background-color: white">
<div style="">
<form id="myFormId" action="" method="post">
    <div class="if_tableview_fenge">
        <p>学科</p>
    </div>
    <table class="if_tableview_form" style=" ">
        <tr>
            <td width="90" align="right"><span class="star">*</span>原始密码：</td>
            <td width="270">
                <input type="text" name=""  id="passWord"/></td>
        </tr>
        <tr>
            <td align="right">新密码：</td>
            <td ><input type="text" name="" id="newPass"/></td>
        </tr>
        <tr>
            <td align="right">重复密码：</td>
            <td ><input type="text" name="" id="newPass2"/></td>
        </tr>
        </tr>
    </table>
</form>
</div>
 <div class="if_view_foot" style="position:absolute; left:0; bottom:0">
        <table align="center">
            <tr>
                   <td width="130">
                <input type="button" value="提交" id="queryInfo" class="if_submit_button"/>
            </td>
            <td width="100">
            </td>
            </tr>
        </table>
    </div>
</body>
<script>
//提交表单

</script>
<script type="text/javascript">
$(function(){
	$("#queryInfo").click(function(){
		var passWord = $("#passWord").val();
		var newPass = $("#newPass").val();
		var newPass2 = $("#newPass2").val();
		
		if(passWord == null || passWord ==""){
			alert("原始密码不能为空");
			return;
		}
		if(newPass == null || newPass ==""){
			alert("新密码不能为空");
			return;
		}
		if(newPass2 == null || newPass2 ==""){
			alert("重复密码不能为空");
			return;
		}
		if(passWord == newPass){
			alert("新密码和原始密码不能一致");
			return;
		}
		if(newPass2 != newPass){
			alert("两次密码输入不一致");
			return;
		}
		$.ajax({  
		    type: "POST",  
		    url:"login_xiugai.do?passWord="+$("#passWord").val()+"&newPass="+$("#newPass").val(),  
		    dataType:"json",  
		    contentType : 'application/json;charset=utf-8', //设置请求头信息  
		    success: function(data){
		    	if(data.res == 1){
		    		alert("修改成功");
		    		window.top.location.href="login_tuichu.do";
		    	}else{
		    	   alert(data.mess);
		    	}
		    },  
		    error: function(res){  
		    }  
		}); 
	
});
});
</script>
</html>
