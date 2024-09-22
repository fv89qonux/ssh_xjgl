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
<form id="myFormId" action="teacher_exUpdate.do" method="post">
<input type="hidden" name="id" value="${Obj.id}">
    <div class="if_tableview_fenge">
        <p>教师</p>
    </div>
   <!--  private Integer id;
	
	private String userName;
	
	private String passWrd;
	
	private String realName;
	
	private Xk xk; -->
    <table class="if_tableview_form" style=" ">
        <tr>
            <td width="90" align="right"><span class="star">*</span>登陆名称：</td>
            <td width="270">
                <input type="text" name="userName" value="${Obj.userName }"/></td>
        </tr>
        <tr>
            <td align="right">真实姓名：</td>
            <td ><input type="text" name="realName" value="${Obj.realName }"/></td>
        </tr>
         <tr>
            <td align="right">所教学科：</td>
            <td >
	            <select name="xk.id">
	               <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.xk.id == data.id }">
	                  <option value="${data.id }" selected="selected">${data.name}</option>
	                 </c:if>
	                <c:if test="${Obj.xk.id != data.id }">
	                  <option value="${data.id }" >${data.name}</option>
	                 </c:if>
	               </c:forEach>
	            </select>
            </td>
        </tr>
         <tr>
            <td align="right">所教班级：</td>
            <!-- private ClassRoom classRoom;
	
	private Integer isCheck; -->
            <td >
	               <c:forEach items="${ls}" var="data" varStatus="l">
		                   <c:if test="${data.isCheck == 1 }">
		                         <input type="checkbox" value="${data.classRoom.id }" name="bjs" checked="checked">${data.classRoom.nj }${data.classRoom.name }
		                    </c:if>
	               <c:if test="${data.isCheck != 1 }">
		                         <input type="checkbox" value="${data.classRoom.id }" name="bjs" >${data.classRoom.nj }${data.classRoom.name }
		                    </c:if>
	               </c:forEach>
            </td>
        </tr>
    </table>
</form>
</div>
 <div class="if_view_foot" style="position:absolute; left:0; bottom:0">
        <table align="center">
            <tr>
                   <td width="130">
                <input type="button" value="提交" onclick="$('#myFormId').submit()" class="if_submit_button"/>
            </td>
            <td width="100">
                <input type="button" value="关闭" onclick="top.Dialog.close()" class="if_close_button"/>
            </td>
            </tr>
        </table>
    </div>
</body>
<script>
//提交表单

</script>

</html>
