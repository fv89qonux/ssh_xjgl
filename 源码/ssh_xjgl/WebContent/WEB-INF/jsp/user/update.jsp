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
    <input type="hidden" name="id" value="${Obj.id}">

        <div class="if_tableview_fenge">
            <p>基本信息</p>
          
        </div>
        <table width="100%" class="if_tableview">
           <tr>
                <td width="10%" bgcolor="#EBEBEB">学号：</td>
                <td width="23%"><input type="text" name="userName" value="${Obj.userName }"></td>
                <td width="10%" bgcolor="#EBEBEB">密码：</td>
                <td><input type="text" name="passWord" value="${Obj.passWord}"></td>
                <td width="10%" bgcolor="#EBEBEB">照片：</td>
                <td width="10%" rowspan="5">
                 <img alt="" src="${Obj.photoUrl}" width="106" height="150">
                </td>
            </tr>
             <tr>
                <td width="10%" bgcolor="#EBEBEB">姓名：</td>
                <td width="23%"><input type="text" name="realName" value="${Obj.realName }"></td>
                <td width="10%" bgcolor="#EBEBEB">性别：</td>
                <td>
                    <c:if test="${Obj.xb == 1 }">
                     <input type="radio" name="xb" value="1" checked="checked" class="validate[required]" id=""/>
                    </c:if>
	                <c:if test="${Obj.xb != 1 }">
                     <input type="radio" name="xb" value="1" class="validate[required]" id=""/>
                    </c:if>
	                <label for="" class="hand">男</label>
	                <c:if test="${Obj.xb == 2 }">
	                 <input type="radio" name="xb" value="2" class="validate[required]" checked="checked" id=""
	                       />
	                </c:if>
	                <c:if test="${Obj.xb != 2 }">
	                  <input type="radio" name="xb" value="2" class="validate[required]" id=""
	                       />
	                </c:if>
	               
	                <label for="" class="hand">女</label>
                </td>
                  <td width="10%" bgcolor="#EBEBEB"></td>
            </tr>
            <tr>
            <td width="10%" bgcolor="#EBEBEB">民族：</td>
                <td width="23%"><input type="text" name="mz" value="${Obj.mz }"></td>
                 <td width="10%" bgcolor="#EBEBEB">年级：</td>
                <td width="23%"><input type="text" name="nj" value="${Obj.nj }"></td>
                 <td width="10%" bgcolor="#EBEBEB"></td>
            </tr>
              <tr>
                <td width="10%" bgcolor="#EBEBEB">班级：</td>
                <td>
                <select name="classroom.id">
	               <c:forEach items="${classList}" var="data" varStatus="l">
	                 <c:if test="${data.id == Obj.classroom.id }">
	                  <option value="${data.id }" selected="selected">${data.nj}-${data.name}</option>
	                 </c:if>
	                <c:if test="${data.id != Obj.classroom.id }">
	                  <option value="${data.id }" >${data.nj}-${data.name}</option>
	                 </c:if>
	               </c:forEach>
	            </select>
                </td>
                <td width="10%" bgcolor="#EBEBEB">籍贯：</td>
                <td width="23%"><input type="text" name="jg" value="${Obj.jg }"></td>
                <td width="10%" bgcolor="#EBEBEB"></td>
            </tr>
             <tr>
                <td width="10%" bgcolor="#EBEBEB">出生日期：</td>
                <td width="23%"><input type="text" name="birth" value="${Obj.birth }" class="date"></td>
                <td width="10%" bgcolor="#EBEBEB">联系方式：</td>
                <td colspan="1"><input type="text" name="phone" value="${Obj.phone }"></td>
                <td width="10%" bgcolor="#EBEBEB"></td>
            </tr>
            <tr>
             <td width="10%" bgcolor="#EBEBEB">学校：</td>
                <td width="23%"><input type="text" name="xx" value="${Obj.xx }"></td>
                 <td width="10%" bgcolor="#EBEBEB"></td>
                <td width="23%"></td>
                 <td width="10%" bgcolor="#EBEBEB">修改照片</td>
                <td width="10%"><input type="file" name="file" value=""></td>
            </tr>
            </table>
      <div class="if_tableview_fenge"><p>奖励情况</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
                  <textarea rows="" cols="" style="width: 100%;height: 100%" name="jl"> ${Obj.jl } </textarea>
                 
                </td>
            </tr>
        </table>

 <div class="if_tableview_fenge"><p>惩罚情况</p></div>
       <table width="100%" class="if_tableview" height="200px">
            <tr>
                <td>
                  <textarea rows="" cols="" style="width: 100%;height: 100%" name="cf">  ${Obj.cf}</textarea>
                  
                 
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
                <td><input type="text" name="jname1" value="${Obj.jname1 }"></td>
                <td>
                 <c:if test="${Obj.jsex1 == 1 }">
                     <input type="radio" name="jsex1" value="1" checked="checked" class="validate[required]" id=""/>
                    </c:if>
	                <c:if test="${Obj.jsex1 != 1 }">
                     <input type="radio" name="jsex1" value="1" class="validate[required]" id=""/>
                    </c:if>
	                <label for="" class="hand">男</label>
	                <c:if test="${Obj.jsex1 == 2 }">
	                 <input type="radio" name="jsex1" value="2" class="validate[required]" checked="checked" id=""
	                       />
	                </c:if>
	                <c:if test="${Obj.jsex1 != 2 }">
	                  <input type="radio" name="jsex1" value="2" class="validate[required]" id=""
	                       />
	                </c:if>
	                <label for="" class="hand">女</label>
	                </td>
                <td><input type="text" name="jgx1" value="${Obj.jgx1 }"></td>
                <td><input type="text" name="jage1" value="${Obj.jage1 }"></td>
                <td><input type="text" name="jdw1" value="${Obj.jdw1 }"></td>
                <td><input type="text" name="jlx1" value="${Obj.jlx1 }"></td>
            </tr>
              <tr class="if_table_center">
                <td><input type="text" name="jname2" value="${Obj.jname2 }"></td>
                <td>
                 <c:if test="${Obj.jsex2 == 1 }">
                     <input type="radio" name="jsex2" value="1" checked="checked" class="validate[required]" id=""/>
                    </c:if>
	                <c:if test="${Obj.jsex2 != 1 }">
                     <input type="radio" name="jsex2" value="1" class="validate[required]" id=""/>
                    </c:if>
	                <label for="" class="hand">男</label>
	                <c:if test="${Obj.jsex2 == 2 }">
	                 <input type="radio" name="jsex2" value="2" class="validate[required]" checked="checked" id=""
	                       />
	                </c:if>
	                <c:if test="${Obj.jsex2 != 2 }">
	                  <input type="radio" name="jsex2" value="2" class="validate[required]" id=""
	                       />
	                </c:if>
	                <label for="" class="hand">女</label>
                </td>
                <td><input type="text" name="jgx2" value="${Obj.jgx2 }"></td>
                <td><input type="text" name="jage2" value="${Obj.jage2 }"></td>
                <td><input type="text" name="jdw2" value="${Obj.jdw2 }"></td>
                <td><input type="text" name="jlx2" value="${Obj.jlx2 }"></td>
            </tr>
             <tr class="if_table_center">
                <td><input type="text" name="jname3" value="${Obj.jname3 }"></td>
                <td>
                 <c:if test="${Obj.jsex3 == 1 }">
                     <input type="radio" name="jsex3" value="1" checked="checked" class="validate[required]" id=""/>
                    </c:if>
	                <c:if test="${Obj.jsex3 != 1 }">
                     <input type="radio" name="jsex3" value="1" class="validate[required]" id=""/>
                    </c:if>
	                <label for="" class="hand">男</label>
	                <c:if test="${Obj.jsex3 == 2 }">
	                 <input type="radio" name="jsex3" value="2" class="validate[required]" checked="checked" id=""
	                       />
	                </c:if>
	                <c:if test="${Obj.jsex3 != 2 }">
	                  <input type="radio" name="jsex3" value="2" class="validate[required]" id=""
	                       />
	                </c:if>
	                <label for="" class="hand">女</label>
                </td>
                <td><input type="text" name="jgx3" value="${Obj.jgx3 }"></td>
                <td><input type="text" name="jage3" value="${Obj.jage3 }"></td>
                <td><input type="text" name="jdw3" value="${Obj.jdw3 }"></td>
                <td><input type="text" name="jlx3" value="${Obj.jlx3 }"></td>
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
