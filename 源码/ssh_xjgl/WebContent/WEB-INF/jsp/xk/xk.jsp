<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>学籍管理</title>
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

    <!--数字分页start-->
    <script type="text/javascript" src="${ctx}/libs/js/nav/pageNumber.js"></script>
    <!--数字分页end-->
    <style type="text/css">
        .tableStyle td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis
        }
    </style>
    <script>
        var fixObjHeight = 190;
        function customHeightSet(contentHeight) {
            $("#scrollContent").height(contentHeight - fixObjHeight);
        }
    </script>
</head>

<body>
<div class="box_tool_min padding_top2 padding_bottom2 padding_right5" style="margin-bottom: 0px; ">
        <a href="xk_add.do" style="display: block; width: 77px; height: 28px; background-color: #3ba2c0;
        text-align: center; color: white; line-height: 28px; text-decoration:none; font-size: 13px; margin-bottom: -10px; margin-right: 10px">新增</a>
 </div>
<div id="scrollContent" style="overflow-x:hidden;">
    <form id="myFormId" action="waitList.do" method="post">
        <table class="tableStyle" mode="list" style="table-layout: fixed;">
            <tr align="center">
                <th width="130">ID</th>
                <th>课程编码</th>
                <th width="">课程名称</th>
                <th width="">操作</th>
            </tr>
             <c:forEach items="${pagers.datas}" var="data" varStatus="l">
             <!-- private Integer id;
	
	private String code;
	
	private String name; -->
	       <tr>
                <td align="center">${data.id}</td>
                <td align="center" title="">${data.code}</td>
                <td align="center">${data.name}</td>
                
                <td align="center" style="margin-right: 3px">
                 <a href="xk_update.do?id=${data.id}"> <span style="color: #f9a002" >修改</span></a>
                         <a href="javascript:" onclick="del('${data.id}')"> <span style="color: red">删除</span></a>
                </td>
            </tr>
             </c:forEach>
            
        </table>
    </form>
</div>

<div style="height:35px; width: 400px;margin: 0 auto">
    <pg:pager  url="${ctx}/xk_xk.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:last>  
			共${pagers.total}记录,共${pageNumber}页,  
		</pg:last>  
			当前第${curPage}页 
  
        <pg:first>  
    		<a href="${pageUrl}">首页</a>  
		</pg:first>  
		<pg:prev>  
    		<a href="${pageUrl}">上一页</a>  
		</pg:prev>  
      
       	<pg:pages>  
        	<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">[${pageNumber }]</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">${pageNumber}</a>  
            	</c:otherwise>  
        	</c:choose>  
    	</pg:pages>
             
        <pg:next>  
    		<a href="${pageUrl}">下一页</a>  
		</pg:next>  
		<pg:last>  
			<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">尾页</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">尾页</a>  
            	</c:otherwise>  
        	</c:choose> 
    		  
		</pg:last>
	</pg:pager>
</div>
</body>
<script>
    function initComplete() {
        var $pager = $("#pageContent");
        $pager.bind("pageChange", function (e, index) {
            var pageIndex = index + 1;
            $("#pageIndex").val(pageIndex);
            $("#pageSize").val($pager.attr("pageSize"));
            postData();
        });
        $pager.bind("sizeChange", function (e, num) {
            var pageSize = num;
            $("#pageSize").val(pageSize);
            postData();
        });
        $("#searchPanel").bind("stateChange", function (e, state) {
            if (state == "hide") {
                fixObjHeight = 90;
            }
            else if (state == "show") {
                fixObjHeight = 190;
            }
            triggerCustomHeightSet();
        });

    }

    //办理
  /*   function onAdd() {
        top.Dialog.open({
            Module: 'dxgd',
             URL: "xk_add.do",
            Title: "新增", Width: 600, Height: 300
        });
    } */

    //查看详情
    function onView(workOrderId) {
        top.Dialog.open({
            Module: 'dxgd',
            URL: "jmhdjmktJh/view.html",
            Title: "详情", Width: 600, Height: 300
        });
    }

    //提交表单
   function postData() {
        var form = document.getElementById("myFormId");
        form.submit();
        showProgressBar();
    }

    //重新提交数据
    function refresh() {
        postData();
    }
    function del(id){
    	top.Dialog.confirm("是否确认删除",function(){
    		location.href=ctx+"/xk_delete.do?id="+id;
    	},function(){
    		
    	});
    }
   
</script>

</html>
