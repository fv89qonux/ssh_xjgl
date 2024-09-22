<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <link href="${ctx}/resource/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/resource/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx}/resource/static/h-ui/js/H-ui.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<head>
<style>
#doc-topbar-collapse-3 a{
font-weight: bold;
font-size: 14px;
}
.headers{
height: 30px;width: 200px;
z-index:999;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台登陆</title>
</head>

<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="headers"></div>
<div ></div>
<div class="loginWraper">
  <div style="height: 50px;width: 400px;margin: 50px auto">
     <span style="color: white;font-size: 40px">学籍信息管理系统</span>
  </div>
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input  name="userName" type="text" placeholder="账户" value="35" id="userName" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input  name="passWord" type="password" placeholder="密码" value="111111" id="passWord" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">角色</i></label>
        <div class="formControls col-xs-8">
          <select style="width: 200px;height: 30px;" id="role">
			  <option value ="">请选择角色</option>
			  <option value ="1">管理员</option>
			  <option value="2">教师</option>
			  <option value="3">学生</option>
			</select>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="button" id="queryInfo" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 管理系统</div>

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
$(function(){
	$("#queryInfo").click(function(){
		$.ajax({  
		    type: "POST",  
		    url:"login_toLogin.do?userName="+$("#userName").val()+"&passWord="+$("#passWord").val()+"&role="+$("#role").val(),  
		    dataType:"json",  
		    contentType : 'application/json;charset=utf-8', //设置请求头信息  
		    success: function(data){
		    	if(data.res == 1){
		    		window.location.href="login_main.do";
		    	}else{
		    	   alert("用户名或密码错误");
		    	}
		    },  
		    error: function(res){  
		    }  
		}); 
	
});
});
</script>
</body>
</html>
