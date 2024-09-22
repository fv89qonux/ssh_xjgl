<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title></title>
    <!--框架必需start-->
    <script type="text/javascript" src="libs/js/jquery.js"></script>
    <script type="text/javascript" src="libs/js/language/cn.js"></script>
    <script type="text/javascript" src="libs/js/framework.js"></script>
    <link href="libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" id="skin" prePath="./" scrollerY="false"/>
    <link rel="stylesheet" type="text/css" id="customSkin"/>
    <!--框架必需end-->

    <!--基本选项卡start-->
    <script type="text/javascript" src="libs/js/nav/basicTabModern.js"></script>
    <!--基本选项卡end-->

    <!--弹出式提示框start-->
    <script type="text/javascript" src="libs/js/popup/messager.js"></script>
    <!--弹出式提示框end-->
    <script>
        $(function () {
            //修正由于使用了tab导致高度计算不准确
            if (broswerFlag == "IE6") {
                setTimeout(function () {
                    top.iframeHeight('frmrightChild');
                }, 500)
            }
        })

        function customHeightSet(contentHeight) {
            if ($("#newsBox").width() < 420) {
                $("#newsBox").width(420);
            }
        }
    </script>
</head>

<body>
</body>
</html>
