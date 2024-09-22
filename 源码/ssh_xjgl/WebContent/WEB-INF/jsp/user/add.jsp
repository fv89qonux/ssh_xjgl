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
<div style="padding: 15px 25px 15px 15px; width: 85%;margin: 0 auto" >
    <form id="myFormId" action="user_exAdd.do" method="post" enctype="multipart/form-data">
        <input type="hidden" id="workOrderId" name="id" value="133398"/>
        <input type="hidden" id="dialogId" value="workOrder_133398"/>

        <div class="if_tableview_fenge">
            <p>基本信息</p>
          
        </div>
        <table width="100%" class="if_tableview">
           <tr>
                <td width="10%" bgcolor="#EBEBEB">学号：</td>
                <td width="23%"><input type="text" name="userName" value=""></td>
                <td width="10%" bgcolor="#EBEBEB">密码：</td>
                <td><input type="text" name="passWord" value=""></td>
                <td width="10%" bgcolor="#EBEBEB">照片：</td>
                <td width="23%"><input type="file" name="file" value=""></td>
            </tr>
             <tr>
                <td width="10%" bgcolor="#EBEBEB">姓名：</td>
                <td width="23%"><input type="text" name="realName" value=""></td>
                <td width="10%" bgcolor="#EBEBEB">性别：</td>
                <td>
	                <input type="radio" name="xb" value="1" class="validate[required]" id=""
	                       />
	                <label for="" class="hand">男</label>
	                <input type="radio" name="xb" value="2" class="validate[required]" id=""
	                       checked="checked"/>
	                <label for="" class="hand">女</label>
                </td>
                <td width="10%" bgcolor="#EBEBEB">民族：</td>
                <td width="23%"><input type="text" name="mz" value=""></td>
            </tr>
              <tr>
                <td width="10%" bgcolor="#EBEBEB">年级：</td>
                <td width="23%"><input type="text" name="nj" value=""></td>
                <td width="10%" bgcolor="#EBEBEB">班级：</td>
                <td>
                <select name="classroom.id">
	               <c:forEach items="${classList}" var="data" varStatus="l">
	                <option value="${data.id }">${data.nj}-${data.name}</option>
	               </c:forEach>
	            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">籍贯：</td>
                <td width="23%"><input type="text" name="jg" value=""></td>
            </tr>
             <tr>
                <td width="10%" bgcolor="#EBEBEB">出生日期：</td>
                <td width="23%"><input type="text" name="birth" value="" class="date"></td>
                <td width="10%" bgcolor="#EBEBEB">联系方式：</td>
                <td colspan="1"><input type="text" name="phone" value=""></td>
                <td width="10%" bgcolor="#EBEBEB">学校：</td>
                <td width="23%"><input type="text" name="xx" value=""></td>
            </tr>
            </table>
      <div class="if_tableview_fenge"><p>奖励情况</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
                  <textarea rows="" cols="" style="width: 100%;height: 100%" name="jl"> </textarea>
                  
                 
                </td>
            </tr>
        </table>

 <div class="if_tableview_fenge"><p>惩罚情况</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
                  <textarea rows="" cols="" style="width: 100%;height: 100%" name="cf"> </textarea>
                  
                 
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
                <td><input type="text" name="jname1" value=""></td>
                <td><input type="radio" name="jsex1" value="1" class="" id=""
	                       />
	                <label for="" class="hand">男</label>
	                <input type="radio" name="jsex1" value="2" class="" id=""
	                       checked="checked"/>
	                <label for="" class="hand">女</label></td>
                <td><input type="text" name="jgx1" value=""></td>
                <td><input type="text" name="jage1" value=""></td>
                <td><input type="text" name="jdw1" value=""></td>
                <td><input type="text" name="jlx1" value=""></td>
            </tr>
              <tr class="if_table_center">
                <td><input type="text" name="jname2" value=""></td>
                <td><input type="radio" name="jsex2" value="1" class="" id=""
	                       />
	                <label for="" class="hand">男</label>
	                <input type="radio" name="jsex2" value="2" class="" id=""
	                       checked="checked"/>
	                <label for="" class="hand">女</label></td>
                <td><input type="text" name="jgx2" value=""></td>
                <td><input type="text" name="jage2" value=""></td>
                <td><input type="text" name="jdw2" value=""></td>
                <td><input type="text" name="jlx2" value=""></td>
            </tr>
             <tr class="if_table_center">
                <td><input type="text" name="jname3" value=""></td>
                <td><input type="radio" name="jsex3" value="1" class="" id=""
	                       />
	                <label for="" class="hand">男</label>
	                <input type="radio" name="jsex3" value="2" class="" id=""
	                       checked="checked"/>
	                <label for="" class="hand">女</label></td>
                <td><input type="text" name="jgx3" value=""></td>
                <td><input type="text" name="jage3" value=""></td>
                <td><input type="text" name="jdw3" value=""></td>
                <td><input type="text" name="jlx3" value=""></td>
            </tr>
      </table>
      
     
</div>
<div class="if_view_foot">
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
