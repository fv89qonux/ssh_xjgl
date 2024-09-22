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
<div class="box2" panelTitle="学期查询" id="searchPanel">
    <form action="cj_userCj.do" id="queryForm" method="post">
        <table class="if_search_table">
            <tr>
                <td align="right" class="if_w80">选择学期：</td>
                <td class="if_w172">
                  <select name="xq">
	                <option value="">全部</option>
	                 <c:if test="${Obj.xq == 1 }">
	                 <option value="1" selected="selected">第一学期</option>
	                 </c:if>
	                  <c:if test="${Obj.xq != 1 }">
	                 <option value="1" >第一学期</option>
	                 </c:if>
	                 <c:if test="${Obj.xq == 2 }">
	                 <option value="2" selected="selected">其二学期</option>
	                 </c:if>
	                  <c:if test="${Obj.xq != 2 }">
	                  <option value="2">其二学期</option>
	                 </c:if>
	                  
	            </select>
                
                </td>
                 <td>
                    <button><span class="icon_find">查询</span></button>
                </td>
            </tr>
        </table>
    </form>
</div>
<div class="box_tool_min padding_top2 padding_bottom2 padding_right5" style="margin-bottom: 0px; ">
 </div>
<!--  private User user;
	开课学期、课程编号、课程名称、成绩。
	private Cj cj; -->
<div id="scrollContent" style="overflow-x:hidden;">
    <form id="myFormId" action="" method="post">
        <table class="tableStyle" mode="list" style="table-layout: fixed;">
            <tr align="center">
                <th width="130">开课学期</th>
                <th>学生姓名</th>
                <th>课程编号</th>
                <th width="">课程名称</th>
                 <th width="">成绩</th>
            </tr>
             <c:forEach items="${pagers}" var="data" varStatus="l">
             <!-- private Integer id;
	
	private String code;
	
	private String name; -->
	       <tr>
                <td align="center">
                <c:if test="${data.xq == 1 }">
                第一学期
                </c:if>
                <c:if test="${data.xq == 2 }">
                第二学期
                </c:if>
                </td>
                <td align="center" title="">${user.realName}</td>
                <td align="center" title="">${data.xk.code}</td>
                <td align="center">${data.xk.name}</td>
                 <td align="center">
                  <c:if test="${data.df == null}">
                    未录入
                  </c:if>
                  <c:if test="${data.df != null}">
                    ${data.df}
                  </c:if>
                 </td>
            </tr>
             </c:forEach>
            
        </table>
    </form>
</div>

<div style="height:35px; width: 400px;margin: 0 auto">
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
    		location.href=ctx+"/classRoom_delete.do?id="+id;
    	},function(){
    		
    	});
    }
   
</script>

</html>
