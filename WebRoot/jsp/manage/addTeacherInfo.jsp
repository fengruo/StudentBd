<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<body>
<table id="TeacherInfoShow" cellspacing="7" border="0" style="text-align: center;">
	
	
</table>
<input type="button" id="addMan" value="添加">
<table id="TeacherAddInfoShow" cellspacing="7" border="0" style="text-align: center;">
	<tr><th>教师姓名</th><th>教师性别</th><th>教师手机号</th><th>教师邮箱</th><th>操作</th></tr>
	<tr><td><input type="text" id="teacherUser"></td>
	<td><select id="teacherSex">
		<option value="男">男</option>
		<option value="女">女</option>
		</select></td>
	<td>
		<input type="text" id="teacherTel">
	</td>
	<td>
	<input type="text" id="teacherEmail">
	</td>
	<td><input type="button" id="addButMan" value="添加"></td></tr>
</table>
<script type="text/javascript">
	$("#TeacherAddInfoShow").hide();
	indexInfo();
	function indexInfo(){
	$.ajax({
		url:"${pageContext.request.contextPath }/manage_queryTeacherAll.action",
		dataType:"json",
		type:"post",
		data:{},
		success:function(msg){
			var TeacherJson=eval(msg);
			var maHtml="<tr><th>教师姓名</th><th>教师性别</th><th>教师手机号</th><th>教师邮箱</th><th>操作</th></tr>";
			for ( var num in TeacherJson) {
				//alert(nowinfo+TeacherJson[num].t_name);
				maHtml=maHtml+'<tr><td>'+TeacherJson[num].t_name+'</td><td>'+TeacherJson[num].t_sex+'</td><td>'+TeacherJson[num].t_tel+'</td><td>'+TeacherJson[num].t_email+'</td><td><a href="javascript:alert(\'待开发\');" >编辑</a></td></tr>';
			}
			$("#TeacherInfoShow").html(maHtml);
		}
	
	});
	}
	$("#addMan").click(function(){
		$("#addMan").hide();
		$("#TeacherAddInfoShow").show();
	});
	$("#addButMan").click(function(){
		var t_name=$("#teacherUser").val();
		var t_sex=$("#teacherSex").val();
		var t_tel=$("#teacherTel").val();
		var t_email=$("#teacherEmail").val();
		if(t_name==null||t_name==""||t_tel==null||t_tel==""||t_email==null||t_email==""){
			alert("输入不能为空");
			return false;
		}
		var madata={
			"t_name":t_name,"t_sex":t_sex,"t_tel":t_tel,"t_email":t_email
		};
		$.ajax({
			url:"${pageContext.request.contextPath }/manage_addTeacherOne.action",
			dataType:"json",
			type:"post",
			data:madata,
			success:function(msg){
				var flag=eval(msg);
				alert(flag.flag);
				$("#addMan").show();
				$("#TeacherAddInfoShow").hide();
				indexInfo();
			}
		});
		
	});
</script>
</body>
</html>