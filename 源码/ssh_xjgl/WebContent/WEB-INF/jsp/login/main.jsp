<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9"></meta>
    <title>学籍管理</title>
    <!--框架必需start-->
    <link href="libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
    <link href="libs/skins/blue2/style.css" rel="stylesheet" type="text/css" id="theme" themeColor="blue2"
          positionTarget="positionContent" selInputHeight="28" selButtonWidth="29" defaultSelWidth="160"
          fileBtnWidth="60" defaultFileInputWidth="222" defaultGridHeaderHeight="32" defaultGridRowHeight="32"
          defaultFontSize="12" defaultPageSelWidth="55" defaultFilterItemHeight="28" defaultFontFamily="宋体"/>
    <link href="skin/style.css" rel="stylesheet" type="text/css" id="skin" skinPath="skin/"/>
    <script type="text/javascript" src="libs/js/jquery.js"></script>
    <script type="text/javascript" src="libs/js/language/cn.js"></script>
    <script type="text/javascript" src="libs/js/main.js"></script>
    <!--框架必需end-->

    <!--弹窗组件start-->
    <script type="text/javascript" src="libs/js/popup/drag.js"></script>
    <script type="text/javascript" src="libs/js/popup/dialog.js"></script>
    <!--弹窗组件end-->

    <!--弹出式提示框start-->
    <script type="text/javascript" src="libs/js/popup/messager.js"></script>
    <!--弹出式提示框end-->


    <!--分隔条start-->
    <script type="text/javascript" src="libs/js/nav/spliter.js"></script>
    <!--分隔条end-->
    <script>
        // 退出
        function logout() {
            window.location.href = "login_tuichu.do";
        }
    </script>
    <style>
        a {
            behavior: url(libs/js/method/focus.htc)
        }
    </style>
    <link href="skin/skin2016/ifhead.css" rel="stylesheet" type="text/css"/>
    <script>
        $(function () {
            // 默认选中第一个
            var hiconIdx = 0;

            // 默认选中url传递的index
            var index = GetQueryString("index");
            if (index != null) {
                hiconIdx = parseInt(index);
                frmleft.location.href = "login_left.do";
            }
           
            $(".nav_icon_h_item >a").filter(':eq(' + hiconIdx + ')').addClass("current");
            // 遍历全部按钮
            $(".nav_icon_h_item >a").each(function (i) {
                // 添加点击事件
                $(this).click(function () {
                    // 移除其他按钮选中状态
                    $(".nav_icon_h_item >a").removeClass("current");
                    // 为当前按钮添加选中状态
                    $(this).addClass("current");
                    // 联动左侧菜单
                    frmleft.showTab(i);
                    //新老平台兼容代码start
                    if (i != 2) {
                        //jumpUrl(i);
                    }
                    //新老平台兼容代码end
                });
            });
        });

       
        // 跳转到Url
        function jumpUrl(index) {
            window.location.href = "http://localhost/?index=" + index;
        }

        // 获取Url参数
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null)return unescape(r[2]);
            return null;
        }
    </script>
</head>

<body>
<div id="mainFrame">
    <!--头部与导航start-->
    <div id="hbox">
        <div class="if_head_main">
            <div class="if_head_logo" >
              <span style="font-size: 40px;color: white;line-height: 80px;display: inline-block;margin-left: 50px;"> 学籍信息管理系统</span>
            </div>
            <div class="if_head_right">
                <div class="if_head_rt">
                    <ul>
                        
                    </ul>
                </div>
                <div class="if_head_rb">
                    <span><img src="skin/skin2016/img/ico_s_6.png"/></span>
                    <span class="w80" title="111">用户：${userName }</span>
                    <span><a href="javascript:;" onclick="logout();">退出</a></span>
                    <span><img src="skin/skin2016/img/ico_s_7.png"/></span>
                </div>
            </div>
        </div>
    </div>
    <!--头部与导航end-->

    <table width="100%" cellpadding="0" cellspacing="0" class="table_border0">
        <tr>
            <!--左侧区域start-->
            <td id="hideCon" class="ver01 ali01">
                <div id="lbox">
                    <div id="lbox_topcenter">
                        <div id="lbox_topleft">
                            <div id="lbox_topright">
                            </div>
                        </div>
                    </div>
                    <div id="lbox_middlecenter">
                        <div id="lbox_middleleft">
                            <div id="lbox_middleright">
                                <div id="bs_left">
                                    <IFRAME height="100%" width="100%" frameBorder=0 id=frmleft name=frmleft
                                            src="login_left.do" allowTransparency="true"></IFRAME>
                                </div>
                                <!--更改左侧栏的宽度需要修改id="bs_left"的样式-->
                            </div>
                        </div>
                    </div>
                    <div id="lbox_bottomcenter">
                        <div id="lbox_bottomleft">
                            <div id="lbox_bottomright">
                                <div class="lbox_foot"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <!--左侧区域end-->

            <!--分隔栏区域start-->
            <td class="spliter main_shutiao" targetId="hideCon" beforeClickTip="收缩面板" afterClickTip="展开面板"
                beforeClickClass="bs_leftArr" afterClickClass="bs_rightArr">
            </td>
            <!--分隔栏区域end-->

            <!--右侧区域start-->
            <td class="ali01 ver01" width="100%">
                <div id="rbox">
                    <div id="rbox_topcenter">
                        <div id="rbox_topleft">
                            <div id="rbox_topright">
                            </div>
                        </div>
                    </div>
                    <div id="rbox_middlecenter">
                        <div id="rbox_middleleft">
                            <div id="rbox_middleright">
                                <div id="bs_right">
                                    <IFRAME height="100%" width="100%" frameBorder=0 id=frmright name=frmright
                                            src="login_open.do" allowTransparency="true"></IFRAME>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="rbox_bottomcenter">
                        <div id="rbox_bottomleft">
                            <div id="rbox_bottomright">

                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <!--右侧区域end-->
        </tr>
    </table>

    <!--尾部区域start-->
    <div id="fbox">
        <div id="bs_footcenter">
            <div id="bs_footleft">
                <div id="bs_footright">
                     <a href="http://www.icodedock.com">源码码头</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--尾部区域end-->

<!--浏览器resize事件修正start-->
<div id="resizeFix"></div>
<!--浏览器resize事件修正end-->

<!--窗口任务栏区域start-->
<div id="dialogTask" class="dialogTaskBg" style="display:none;"></div>
<!--窗口任务栏区域end-->

<!--载进度条start-->
<div class="progressBg" id="progress" style="display:none;">
    <div class="progressBar"></div>
</div>
<!--载进度条end-->
</body>

</html>
