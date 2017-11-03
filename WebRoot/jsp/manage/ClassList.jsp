<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<html>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head></head>
		<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/manage/css/index.css">
		<style>
		.dropdown-content p{
			margin-top: 2px;
		}
		.dropdown-content p:hover{
			background-color:orange;
			color:blue;
		}
		
		</style>
<body>
<div id="data_page1_info"></div>
<div id="data_page2_info"></div>
<script type="text/javascript">
				$.ajax({
					url:"/StudentBD/manage_queryTeaClassList.action",
					data:{},
					dataType:"json",
					type:"post",
					success:function(msg){
						classList=eval(msg);
						var classHtml='<div class="dropdown"><span id="class_title">班级分类</span><div class="dropdown-content">';
						for ( var num in classList) {
							classHtml=classHtml+
							'<p onclick="classHtmlClick(this)"  value="'+classList[num].c_name+'">'+classList[num].c_name+'</p>';
						}
						classHtml=classHtml+"</div></div>";
						$("#data_page1_info").html(classHtml);
					},
					error:function(){
						
					}
				});
		function classHtmlClick(obj){
			var c_name=$(obj).attr("value");
			$("#data_page2_info").html('<iframe style="width:1000px;height:410px;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="/StudentBD/jsp/manage/StudentChoiceResult.jsp?zid=2&flag='+encodeURI(encodeURI(c_name))+'"/>');
		}
</script>
</body>
</html>