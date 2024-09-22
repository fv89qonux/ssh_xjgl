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
<div style="padding: 15px 25px 15px 15px; width: 90%;margin: 0 auto" >
    <form id="myFormId" action="kb_exUpdate.do" method="post" enctype="multipart/form-data">
         <div class="if_tableview_fenge"><p>课表信息</p></div>
      <table width="100%" class="if_table_list">
            <tr>
                <th width="130">${Obj.classRoom.nj }${Obj.classRoom.name }</th>
                <th width="90">节次</th>
                <th width="110">周一</th>
                <th>周二</th>
                <th>周三</th>
                <th>周四</th>
                <th>周五</th>
            </tr>
             <tr class="if_table_center">
                <td rowspan="4">上午</td>
                <td>第一节</td>
                <td>
                
                <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name1 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name1 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                </td>
                 <td>
                   <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name9 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name9 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
                 <td>
                   <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name17 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name17 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
                 <td>
                 
                   <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name25 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name25 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
                 <td>
                   <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name33 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name33 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
            </tr>
            <tr class="if_table_center">
                <td>第二节</td>
                <td>
                 <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name2 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name2 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                
                </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name10 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name10 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name18 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name18 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name26 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name26 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name34 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name34 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
            </tr>
            <tr class="if_table_center">
                <td>第三节</td>
                <td>
                 <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name3 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name3 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name11 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name11 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name19 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name19 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name27 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name27 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name35 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name35 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
            </tr>
            <tr class="if_table_center">
                <td>第四节</td>
                <td>
                 <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name4 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name4 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                
                </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name12 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name12 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name20 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name20 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name28 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name28 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name36 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name36 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
            </tr>
             <tr class="if_table_center">
                <td colspan="7">中午休息</td>
            </tr>
            <tr class="if_table_center">
                <td rowspan="4">下午</td>
                <td>第五节</td>
                <td>
                 <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name5 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name5 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                </td>
                <td>
                 <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name13 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name13 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                
                </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name21 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name21 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 
                 </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name29 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name29 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                 </td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name37 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name37 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
            </tr>
            <tr class="if_table_center">
                <td>第六节</td>
                <td>
                 <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name6 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name6 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 -->
                
                </td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name14 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name14 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td>
                  <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name22 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name22 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name30 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name30 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name38 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name38 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
            </tr>
            <tr class="if_table_center">
                <td>第七节</td>
                <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name7 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name7 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name15 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name15 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name23 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name23 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name31 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name31 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name39 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name39 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
            </tr>
             <tr class="if_table_center">
                <td>第八节</td>
                <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name8 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name8 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name16 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name16 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name24 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name24 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name32 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name32 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
                 <td> <!-- 1111111111111 33333333333333333333333333-->
                 <c:forEach items="${xkList}" var="data" varStatus="l">
	                 <c:if test="${Obj.name40 == data.id }">
	                    ${data.name }
	                 </c:if>
	               </c:forEach>
                <br> 
                <span style="font-size: 12px;color: #ccc">任课教师:</span><span style="color: red">
                  <c:forEach var="item" items="${map}">   
					<%-- ${item.key} > ${item.value} <br> --%> 
					 <c:if test="${Obj.name40 == item.key }">
					 ${item.value}
					 </c:if>
				</c:forEach> 
                </span>
                 <!-- 2222223333333333333333333333333333333 --></td>
            </tr>
      </table>
</div>
<div class="if_view_foot">
    <table align="center">
        <tr>
             <td width="100">
                <input type="button" value="关闭" onclick="top.Dialog.close()" class="if_submit_button"/>
            </td>
       </tr>
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
