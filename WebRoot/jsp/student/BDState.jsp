<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BDState.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
  </head>
  
  <body>
    	报道状态查询
    	身份证号<input type="text" id="s_id_card"><input type="button" id="cxbut" value="查询">
    	<script type="text/javascript">
    	$("#cxbut").click(function(){
    		$.ajax({
    			url:"${pageContext.request.contextPath }/student_getNowState.action",
	    		data:{"s_id_card":$("#s_id_card").val()},
	    		dataType:"html",
	    		type:"post",
	    		success:function(msg){
    				alert("当前状态："+msg);
    			}
    		});
    	
    	
    	});
    	
    	</script>
  </body>
</html>
