<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--框架必需start-->
    <script type="text/javascript" src="libs/js/jquery.js"></script>
    <script type="text/javascript" src="libs/js/language/cn.js"></script>
    <script type="text/javascript" src="libs/js/framework.js"></script>
    <link href="libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
    <!--框架必需end-->

    <link href="skin/skin2016/ifleft.css" rel="stylesheet" type="text/css"/>
      
</head>

<body leftFrame="true">
<div id="scrollContent">
    <div>
   <!--  <option value ="1">管理员</option>
				  <option value="2">教师</option>
				  <option value="3">学生</option> -->
     <c:if test="${role == 1 }">
        <div class="ifboxmenu">
            <div class="menupanel">系统管理</div>
            <ul>
                <li><a href="xk_xk.do" target="frmright"><span class="text_slice">学科管理</span></a></li>
                <li><a href="classRoom_classRoom.do" target="frmright"><span class="text_slice">班级管理</span></a></li>
                <li><a href="teacher_teacher.do" target="frmright"><span class="text_slice">教师管理</span></a></li>
                 <li><a href="user_user.do" target="frmright"><span class="text_slice">学籍信息管理</span></a></li>
                 <li><a href="classRoom_xkRoom.do" target="frmright"><span class="text_slice">课表管理</span></a></li>
                 <li><a href="user_stszUser.do" target="frmright"><span class="text_slice">身体素质管理</span></a></li>
                  <li><a href="news_news.do" target="frmright"><span class="text_slice">教务公告</span></a></li>
            </ul>
        </div>
        </c:if>
        <!-- 教师 -->
      <c:if test="${role == 2 }">
       <div class="ifboxmenu">
            <div class="menupanel">菜单</div>
            <ul>
                  <li><a href="news_news.do" target="frmright"><span class="text_slice">教务公告</span></a></li>
                  <li><a href="classRoom_cjRoom.do" target="frmright"><span class="text_slice">成绩管理</span></a></li>
            </ul>
        </div>
     </c:if>
     
     <c:if test="${role == 3 }">
       <div class="ifboxmenu">
            <div class="menupanel">菜单</div>
            <ul>
                  <li><a href="news_news.do" target="frmright"><span class="text_slice">教务公告</span></a></li>
                  <li><a href="user_view2.do" target="frmright"><span class="text_slice">学籍信息</span></a></li>
                   <li><a href="kb_kb3.do" target="frmright"><span class="text_slice">课表查询</span></a></li>
                   <li><a href="stsz_view.do" target="frmright"><span class="text_slice">身体素质信息</span></a></li>
                   <li><a href="cj_userCj.do" target="frmright"><span class="text_slice">成绩查询</span></a></li>
                   <li><a href="login_toXiugai.do" target="frmright"><span class="text_slice">密码修改</span></a></li>
            </ul>
        </div>
     </c:if>
    </div>
</body>
</html>
