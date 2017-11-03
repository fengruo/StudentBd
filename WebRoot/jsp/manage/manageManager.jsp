<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head></head>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<body>
<table id="manageInfoShow" cellspacing="7" border="0" style="text-align: center;">
	
	
</table>
<input type="button" id="addMan" value="添加">
<table id="manageAddInfoShow" cellspacing="7" border="0" style="text-align: center;">
	<tr><th>管理员用户名</th><th>管理员密码</th><th>管理员所属身份</th><th>管理员所属教师</th><th>操作</th></tr>
	<tr><td><input type="text" id="manageUser"></td>
	<td><input type="text" id="managePwd"></td>
	<td>
		<select id="manageInfoSel">
		<option value="1">超级管理员</option>
		<option value="2">辅导员</option>
		</select>
	</td>
	<td>
	<select id="teacherInfoSel">
		<option></option>
	</select>
	</td>
	<td><input type="button" id="addButMan" value="添加"></td></tr>
</table>
<script type="text/javascript">
	$("#manageAddInfoShow").hide();
	indexInfo();
	function indexInfo(){
	$.ajax({
		url:"${pageContext.request.contextPath }/manage_queryManageAll.action",
		dataType:"json",
		type:"post",
		data:{},
		success:function(msg){
			var manageJson=eval(msg);
			var maHtml="<tr><th>管理员用户名</th><th>管理员所属教师</th><th>管理员所属身份</th><th>管理员状态</th><th>操作</th></tr>";
			for ( var num in manageJson) {
				var nowinfo="";
				var nowState="";
				if(manageJson[num].ma_del==0){
					nowinfo="正常";
				}else{
					nowinfo="已删除";
				}
				if(manageJson[num].ma_state==1){
					nowState="超级管理员";
				}else{
					nowState="辅导员";
				}
				//alert(nowinfo+manageJson[num].t_name);
				maHtml=maHtml+'<tr><td>'+manageJson[num].ma_name+'</td><td>'+manageJson[num].t_name+'</td><td>'+nowState+'</td><td>'+nowinfo+'</td><td><a href="javascript:alert(\'待开发\');" >编辑</a></td></tr>';
			}
			$("#manageInfoShow").html(maHtml);
		}
	
	});
	}
	$.ajax({
			url:"${pageContext.request.contextPath }/manage_queryTeacherAll.action",
			dataType:"json",
			type:"post",
			data:{},
			success:function(msg){
				var teajson=eval(msg);
				var teajsonhtml="";
				for ( var num in teajson) {
					teajsonhtml=teajsonhtml+'<option value="'+teajson[num].t_id+'">'+teajson[num].t_name+'</option>';
				}
				$("#teacherInfoSel").html(teajsonhtml);
			}
		});
	
	$("#addMan").click(function(){
		$("#addMan").hide();
		$("#manageAddInfoShow").show();
	});
	$("#addButMan").click(function(){
		var ma_name=$("#manageUser").val();
		var ma_pwd=$("#managePwd").val();
		var ma_state=$("#manageInfoSel").val();
		var ma_teacherid=$("#teacherInfoSel").val();
		if(ma_name==null||ma_name==""||ma_pwd==null||ma_pwd==""){
			alert("输入不能为空");
			return false;
		}
		$.ajax({
		url:"${pageContext.request.contextPath }/manage_queryManageAll.action",
		dataType:"json",
		type:"post",
		data:{},
		success:function(msg){
					var manageJson=eval(msg);
					for ( var num in manageJson) {
						if(manageJson[num].ma_name==ma_name){
							alert("用户名已存在");
							return false;
						}
					}
					var madata={
						"ma_name":ma_name,"ma_pwd":ma_pwd,"ma_state":ma_state,"ma_teacherid":ma_teacherid
					};
					$.ajax({
						url:"${pageContext.request.contextPath }/manage_addManageOne.action",
						dataType:"json",
						type:"post",
						data:madata,
						success:function(msg){
							var flag=eval(msg);
							alert(flag.flag);
							$("#addMan").show();
							$("#manageAddInfoShow").hide();
							indexInfo();
						}
				});
			}
		});
		
	});
</script>
</body>
</html>