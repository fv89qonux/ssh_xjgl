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
<script type="text/javascript" src="${ctx}/libs/js/form/datePicker/WdatePicker.js"></script>
    <!-- 表单异步提交start -->
    <script src="${ctx}/libs/js/form/form.js" type="text/javascript"></script>
    <!-- 表单异步提交end -->
    <link href="${ctx}/skin/skin2016/ifstyle.css" rel="stylesheet" type="text/css" />
    <!--数字分页start-->
    <script type="text/javascript" src="${ctx}/libs/js/nav/pageNumber.js"></script>
</head>

<body>
<div style="padding: 15px 25px 15px 15px; width: 85%;margin: 0 auto" >
    <form id="myFormId" action="user_exUpdate.do" method="post" enctype="multipart/form-data">

        <div class="if_tableview_fenge">
            <p>基本信息</p>
          
        </div>
        <table width="100%" class="if_tableview">
           <tr>
                <td width="10%" bgcolor="#EBEBEB">学号：</td>
                <td width="23%" colspan="3">${Obj.userName }</td>
                <td width="10%" rowspan="6" bgcolor="#EBEBEB">照片：</td>
                <td width="10%" rowspan="6">
                 <img alt="" src="/ssh_xjgl/${Obj.photoUrl}" width="106" height="150">
                </td>
            </tr>
             <tr>
                <td width="10%" bgcolor="#EBEBEB">姓名：</td>
                <td width="23%">${Obj.realName }</td>
                <td width="10%" bgcolor="#EBEBEB">性别：</td>
                <td>
                    <c:if test="${Obj.xb == 1 }">
                     男
                    </c:if>
	                <c:if test="${Obj.xb == 2 }">
	                女
	                </c:if>
	               
                </td>
            </tr>
            <tr>
            <td width="10%" bgcolor="#EBEBEB">民族：</td>
                <td width="23%">${Obj.mz }</td>
                 <td width="10%" bgcolor="#EBEBEB">年级：</td>
                <td width="23%">${Obj.nj }</td>
            </tr>
              <tr>
                <td width="10%" bgcolor="#EBEBEB">班级：</td>
                <td>
                ${Obj.classroom.name }
                </td>
                <td width="10%" bgcolor="#EBEBEB">籍贯/地址：</td>
                <td width="23%">${Obj.jg }</td>
            </tr>
             <tr>
                <td width="10%" bgcolor="#EBEBEB">出生日期：</td>
                <td width="23%">${Obj.birth }</td>
                <td width="10%" bgcolor="#EBEBEB">联系方式：</td>
                <td colspan="1">${Obj.phone }</td>
            </tr>
            <tr>
             <td width="10%" bgcolor="#EBEBEB">学校：</td>
                <td width="23%" colspan="3">${Obj.xx }</td>
            </tr>
            </table>
      <div class="if_tableview_fenge"><p>奖励情况</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
                  ${Obj.jl }
                </td>
            </tr>
        </table>

 <div class="if_tableview_fenge"><p>惩罚情况</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
${Obj.cf}                  
                </td>
            </tr>
        </table>
 <div class="if_tableview_fenge"><p>家庭信息</p></div>
      <table width="100%" class="if_table_list">
     <!--  姓名、性别、与本人关系、年龄、工作单位、联系方式 -->
            <tr>
                <th width="90">姓名</th>
                <th width="90">性别</th>
                 <th width="110">与本人关系</th>
                <th>年龄</th>
                <th width="90">工作单位</th>
                 <th width="130">联系方式</th>
            </tr>
             <tr class="if_table_center">
                <td>${Obj.jname1 }</td>
                <td>
	                  <c:if test="${Obj.jsex1 == 1 }">
	                   男
	                  </c:if>
	                  <c:if test="${Obj.jsex1 == 2 }">
	                  女
	                  </c:if>
	                </td>
                <td>${Obj.jgx1 }</td>
                <td>${Obj.jage1 }</td>
                <td>${Obj.jdw1 }</td>
                <td>${Obj.jlx1 }</td>
            </tr>
             <tr class="if_table_center">
                <td>${Obj.jname2 }</td>
                <td>
	                  <c:if test="${Obj.jsex2 == 1 }">
	                   男
	                  </c:if>
	                  <c:if test="${Obj.jsex2 == 2 }">
	                  女
	                  </c:if>
	                </td>
                <td>${Obj.jgx2 }</td>
                <td>${Obj.jage2 }</td>
                <td>${Obj.jdw2 }</td>
                <td>${Obj.jlx2 }</td>
            </tr>
             <tr class="if_table_center">
                <td>${Obj.jname3 }</td>
                <td>
	                  <c:if test="${Obj.jsex3 == 1 }">
	                   男
	                  </c:if>
	                  <c:if test="${Obj.jsex3 == 2 }">
	                  女
	                  </c:if>
	                </td>
                <td>${Obj.jgx3 }</td>
                <td>${Obj.jage3 }</td>
                <td>${Obj.jdw3 }</td>
                <td>${Obj.jlx3 }</td>
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
