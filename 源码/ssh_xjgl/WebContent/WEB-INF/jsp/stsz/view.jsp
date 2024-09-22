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
    <form id="myFormId" action="stsz_exUpdate.do" method="post" enctype="multipart/form-data">
          <input type="hidden" name="uid" value="${user.id}">
         <!--  内容包括姓名、性别、年龄、身高、体重、血压、血型、肺活量、家族史、有无疾病、
        校医院联系方式。 -->
        <div class="if_tableview_fenge">
            <p>基本信息</p>
        </div>
        <table width="100%" class="if_tableview">
             <tr>
               <td>学号：</td>
                <td colspan="3">${user.userName }</td>
             </tr>
             <tr>
                <td width="20%" bgcolor="#EBEBEB">姓名：</td>
                <td width="">${user.realName }
                </td>
                <td width="20%" bgcolor="#EBEBEB">性别：</td>
                <td>
                 <c:if test="${user.xb == 1 }">
                 男
                 </c:if>
                 <c:if test="${user.xb == 2 }">
                 女
                 </c:if>
                </td>
            </tr>
      <!--       private String sg;//身高
	private String tz ;//体重
	private String xy;//血压
	private String xx;//血型
	private String fhl;//肺活量
	private String jzbs;//家族史
	private String ywjb;//有无疾病
	private String phone;// 校医院联系方式 -->
             <tr>
                <td width="20%" bgcolor="#EBEBEB">身高：</td>
                <td width="">
                  ${Obj.sg }单位：cm
                </td>
                <td width="20%" bgcolor="#EBEBEB">体重：</td>
                <td>
                 ${Obj.tz }单位：kg
                </td>
            </tr>
            
            <tr>
                <td width="20%" bgcolor="#EBEBEB">血压：</td>
                <td width="">
                  ${Obj.xy }
                </td>
                <td width="20%" bgcolor="#EBEBEB">血型：</td>
                <td>
                 ${Obj.xx }
                </td>
            </tr>
             <tr>
                <td width="20%" bgcolor="#EBEBEB">肺活量：</td>
                <td width="">
                  ${Obj.fhl }
                </td>
                <td width="20%" bgcolor="#EBEBEB">校医院联系方式：</td>
                <td>
                 ${Obj.phone }
                </td>
            </tr>
            </table>
           <div class="if_tableview_fenge"><p>家族史</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
                  <textarea rows="" cols="" style="width: 100%;height: 100%" name="jzbs">${Obj.jzbs } </textarea>
                  
                 
                </td>
            </tr>
        </table>

 <div class="if_tableview_fenge"><p>有无疾病</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
                  <textarea rows="" cols="" style="width: 100%;height: 100%" name="ywjb">${Obj.ywjb } </textarea>
                  
                 
                </td>
            </tr>
        </table>
</div>
<div class="if_view_foot">
    <table align="center">
        <tr>
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
