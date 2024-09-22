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
<div class="box2" panelTitle="学生查询" id="searchPanel">
    <form action="user_classUser.do" id="queryForm" method="post">
        <table class="if_search_table">
            <tr>
                <td align="right" class="if_w80">学生名称：</td>
                <td class="if_w172"><input type="text" name="realName" value="${Obj.realName }" /></td>
                 <td>
                    <button><span class="icon_find">查询</span></button>
                </td>
            </tr>
        </table>
    </form>
</div>
<!--  private String userName;//登陆学号
	private String passWord;//密码
	private String realName;//真实
	private Date createTime;
	
	private Integer xb;//1男 2 女
	
	private String mz;//民族
	
	private String photoUrl;
	
	private String birth;//出生日期
	
	private String  jg;//籍贯
	
	private String phone;//联系方式
	
	private String address;//地址
	
	private String jl;//奖励
	
	private String cf;//处分
	
	private ClassRoom classroom; -->
<div id="scrollContent" style="overflow-x:hidden;">
    <form id="myFormId" action="" method="post">
        <table class="tableStyle" mode="list" style="table-layout: fixed;">
            <tr align="center">
                <th width="130">ID</th>
                <th>年级</th>
                <th width="">班级名称</th>
                
                <th width="">姓名</th>
                <th width="">登录名</th>
                
                <th width="">操作</th>
            </tr>
             <c:forEach items="${pagers.datas}" var="data" varStatus="l">
             <!-- private Integer id;
	
	private String code;
	
	private String name; -->
	       <tr>
                <td align="center">${data.id}</td>
                <td align="center" title="">${data.nj}</td>
                <td align="center">${data.classroom.name}</td>
                <td align="center" title="">${data.realName}</td>
                <td align="center" title="">${data.userName}</td>
                <td align="center" style="margin-right: 3px">
                          <a href="javascript:" onclick="detail('${data.id}')"> <span style="color: red">查看详情</span></a>
                </td>
            </tr>
             </c:forEach>
            
        </table>
    </form>
</div>

<div style="height:35px; width: 400px;margin: 0 auto">
    <pg:pager  url="${ctx}/user_classUser.do" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
    <pg:param name="cid" value="${cid }"/>
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
    		location.href=ctx+"/user_delete.do?id="+id;
    	},function(){
    		
    	});
    }
    
    function detail(id){
    	 top.Dialog.open({
             Module: 'dxgd',
             URL: "user_view.do?id="+id,
             Title: "详情", Width: 1100, Height: 600
         });
    }
   
</script>

</html>
