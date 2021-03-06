<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="ch">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>学生报道后台管理</title>
        <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
        <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png");
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function() {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function() {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function() {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function() {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                });
            });
        </script>
        <!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath }/js/html5shiv.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/respond.min.js"></script>
<![endif]-->
        <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/slide.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery.nouislider.css">
    </head>

    <body>
    <%
    	if(session.getAttribute("manageName").toString().length()<1){
    		response.sendRedirect("${pageContext.request.contextPath }/jsp/manage/login.jsp");
    	}
     %>
        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <div class="leftMeun" id="leftMeun" style="overflow-y: scroll;" >
                <div id="logoDiv">
                    <p id="logoP"><img id="logo" alt="左右结构项目" src="${pageContext.request.contextPath }/images/logo.png"><span>入学报道系统</span></p>
                </div>
                <div id="personInfor">
                    <p id="userName"><%=session.getAttribute("manageName") %></p>
                    <p><span>信息工程学院入学报道系统</span></p>
                    <p>
                        <a href="${pageContext.request.contextPath }/jsp/manage/quit.jsp">退出登录</a>
                    </p>
                </div>
                <div class="meun-title">学生管理</div>
                <div class="meun-item" id="TeaStudentListChoice"   data-toggle="tab"><img src="${pageContext.request.contextPath }/images/icon_chara_grey.png">学生信息查询</div>
            	<div class="meun-item" id="pwdManage"  data-toggle="tab"><img src="${pageContext.request.contextPath }/images/icon_rule_grey.png">密码修改</div>
            </div>
            <!-- 右侧具体内容栏目 -->
            <div id="rightContent">
                <a class="toggle-btn" id="nimei">
                    <i class="glyphicon glyphicon-align-justify"></i>
                </a>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- 资源管理模块 -->
                    <div  class="tab-pane active" id="sour">
                        <div class="check-div form-inline">
                            内容显示 
                        </div>
                        <div class="data-div" id="data_info_show">
                        <h1>欢迎来到学生报道后台管理系统</h1>
            			</div>
            </div>
        		</div>
        		</div>
        		</div>
        		<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/manage/js/ajaxForm.js"></script>
</body>
</html>