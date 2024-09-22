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
    <script type="text/javascript" src="${ctx}/libs/js/form/datePicker/WdatePicker.js"></script>
    
    <!--数字分页start-->
    <script type="text/javascript" src="${ctx}/libs/js/nav/pageNumber.js"></script>
</head>

<body>
<div style="padding: 15px 25px 15px 15px; width: 60%;margin: 0 auto" >
    <form id="myFormId" action="kb_exUpdate.do" method="post" enctype="multipart/form-data">
          <input type="hidden" name="cid" value="${cid }">
           <input type="hidden" name="xq" value="${xq}">
        <div class="if_tableview_fenge">
            <p>周一</p>
          
        </div>
        <table width="100%" class="if_tableview">
             
             <tr>
                <td width="10%" bgcolor="#EBEBEB">第一节：</td>
                <td width="">
	                <select name="name1">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name1 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name1 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第二节：</td>
                <td>
                 <select name="name2">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name2 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name2 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第三节：</td>
                <td width="">
	                <select name="name3">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name3 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name3 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第四节：</td>
                <td>
                 <select name="name4">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name4 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name4 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第五节：</td>
                <td width="">
	                <select name="name5">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name5 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name5 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第六节：</td>
                <td>
                 <select name="name6">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name6 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name6 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第七节：</td>
                <td width="">
	                <select name="name7">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name7 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name7 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第八节：</td>
                <td>
                 <select name="name8">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name8 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name8 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            </table>
            
            
             <div class="if_tableview_fenge">
            <p>周二</p>
          
        </div>
        <table width="100%" class="if_tableview">
             
             <tr>
                <td width="10%" bgcolor="#EBEBEB">第一节：</td>
                <td width="">
	                <select name="name9">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name9 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name9 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第二节：</td>
                <td>
                 <select name="name10">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name10 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name10 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第三节：</td>
                <td width="">
	                <select name="name11">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name11 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name11 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第四节：</td>
                <td>
                 <select name="name12">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name12 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name12 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第五节：</td>
                <td width="">
	                <select name="name13">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name13 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name13 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第六节：</td>
                <td>
                 <select name="name14">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name14 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name14 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第七节：</td>
                <td width="">
	                <select name="name15">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name15 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name15 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第八节：</td>
                <td>
                 <select name="name16">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name16 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name16 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            </table>
            
            
            
             <div class="if_tableview_fenge">
            <p>周三</p>
          
        </div>
        <table width="100%" class="if_tableview">
             
             <tr>
                <td width="10%" bgcolor="#EBEBEB">第一节：</td>
                <td width="">
	                <select name="name17">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name17 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name17 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第二节：</td>
                <td>
                 <select name="name18">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name18 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name18 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第三节：</td>
                <td width="">
	                <select name="name19">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name19 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name19 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第四节：</td>
                <td>
                 <select name="name20">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name20 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name20 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第五节：</td>
                <td width="">
	                <select name="name21">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name21 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name21 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第六节：</td>
                <td>
                 <select name="name22">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name22 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name22 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第七节：</td>
                <td width="">
	                <select name="name23">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name23 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name23 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第八节：</td>
                <td>
                 <select name="name24">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name24 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name24 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            </table>
            
            
             <div class="if_tableview_fenge">
            <p>周四</p>
          
        </div>
        <table width="100%" class="if_tableview">
             
             <tr>
                <td width="10%" bgcolor="#EBEBEB">第一节：</td>
                <td width="">
	                <select name="name25">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name25 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name25 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第二节：</td>
                <td>
                 <select name="name26">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name26 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name26 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第三节：</td>
                <td width="">
	                <select name="name27">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name27 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name27 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第四节：</td>
                <td>
                 <select name="name28">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name28 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name28 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第五节：</td>
                <td width="">
	                <select name="name29">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name29 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name29 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第六节：</td>
                <td>
                 <select name="name30">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name30 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name30 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第七节：</td>
                <td width="">
	                <select name="name31">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name31 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name31 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第八节：</td>
                <td>
                 <select name="name32">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name32 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name32 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            </table>
            
            
             <div class="if_tableview_fenge">
            <p>周五</p>
          
        </div>
        <table width="100%" class="if_tableview">
             
             <tr>
                <td width="10%" bgcolor="#EBEBEB">第一节：</td>
                <td width="">
	                <select name="name33">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name33 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name33 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第二节：</td>
                <td>
                 <select name="name34">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name34 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name34 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第三节：</td>
                <td width="">
	                <select name="name35">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name35 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name35 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第四节：</td>
                <td>
                 <select name="name36">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name36 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name36 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第五节：</td>
                <td width="">
	                <select name="name37">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name37 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name37 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第六节：</td>
                <td>
                 <select name="name38">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name38 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name38 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="10%" bgcolor="#EBEBEB">第七节：</td>
                <td width="">
	                <select name="name39">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name39 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name39 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">第八节：</td>
                <td>
                 <select name="name40">
		               <c:forEach items="${xkList}" var="data" varStatus="l">
		                 <c:if test="${Obj.name40 == data.id }">
		                  <option value="${data.id }" selected="selected">${data.name}</option>
		                 </c:if>
		                <c:if test="${Obj.name40 != data.id }">
		                  <option value="${data.id }">${data.name}</option>
		                 </c:if>
		               </c:forEach>
		            </select>
                </td>
            </tr>
            </table>
</div>
<div class="if_view_foot">
    <table align="center">
        <tr>
            <td width="130">
                <input type="button" value="提交" onclick="$('#myFormId').submit()" class="if_submit_button"/>
            </td>
<!--             <td width="100">
                <input type="button" value="关闭" onclick="top.Dialog.close()" class="if_close_button"/>
            </td>
 -->        </tr>
    </table>
</div>
</form>

<!-- 异步提交start -->
<script type="text/javascript">
    function initComplete() {
        //表单提交
     /*    $('#myFormId').submit(function () {
            //判断表单的客户端验证是否通过
            var valid = $('#myFormId').validationEngine({returnIsValid: true});
            if (valid) {
                $(this).ajaxSubmit({
                    //表单提交成功后的回调
                    success: function (responseText, statusText, xhr, $form) {
                        top.Dialog.alert(responseText.message, function () {
                            closeWin();
                        })
                    }
                });
            }
            //阻止表单默认提交事件
            return false;
        }); */
    }

  /*   //重置
    function closeWin() {
        //刷新数据
        top.frmright.refresh();
        //关闭窗口
        top.Dialog.close();
    }

	  function onHandle(rowid) {
        top.Dialog.open({
            Module: 'dxgd',
            URL: "ajhf/ryHandle.html",
            Title: "办理", Width: 1100, Height: 510, Top:"52%",Left:"51%", ID: 'workOrder_' + rowid
        });
    } */
</script>
<!-- 异步提交end -->
</body>

</html>
