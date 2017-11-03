<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
	#teacherInfo{
		width:350px;
		text-align: center;
	}
	 table{
	 	margin: 15px;
	 }
	 tr{
	 	cursor: pointer;
	 }
	 .teaTr:HOVER{
		background-color: #8FDADA;
	}
	#classInfoCheckbox{
	
	}
</style>
</head>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<body>
<div>
<table>
<tr><td style="vertical-align:top;">
<table id="queryMajorInfo" border="1" cellspacing="0" cellpadding="0">
</table>
</td><td id="classInfoCheckboxTD"  style="vertical-align:top;">
<table id="classInfoCheckbox">
	

</table>
</td></tr><tr><td>
<input type="hidden" id="mnameup"  value="" placeholder="请输入院系名称">
<select style="display: none;" id="mccnameup">
<option value="本科">本科</option>
<option value="专科">专科</option>
</select>
<input type="hidden" id="mnameupbut"   value="提交">
</td><td>
<input type="hidden" id="classnameup"  value="" placeholder="请输入班级名称">
<input type="hidden" id="classnameupbut" info=""  value="提交">
</td></tr>
</table>
</div>
<script type="text/javascript">
		$.ajax({
			url:"${pageContext.request.contextPath}/manage_queryMajor.action",
			data:{},
			dataType:"json",
			type:"post",
			success:function(msg){
				var queryMajorInfo=eval(msg);
				var queryMajorhtml='<tr><th>专业名称</th><th>专业层次</th></tr>';
				for ( var num in queryMajorInfo) {
					//alert(teacherInfo[num].t_id);
					//alert(teacherInfo[num].t_name);
					//alert(teacherInfo[num].t_tel);
					queryMajorhtml=queryMajorhtml+'<tr class="teaTr"  onclick="MCshow(this)" id="'+queryMajorInfo[num].m_id+'"><td>'+queryMajorInfo[num].m_name+'</td><td>'+queryMajorInfo[num].training_level+'</td></tr>';
				}
				queryMajorhtml=queryMajorhtml+'<tr><td><input type="button"  onclick="upMDataInfo()" value="添加"></td><td></td><tr>';
				$("#queryMajorInfo").html(queryMajorhtml);
			}
		});
		function classList(obj){
			$("#classInfoCheckboxTD").attr("style","border: 1px #4E5353 solid;");
			$.ajax({
				url:"${pageContext.request.contextPath}/manage_queryClassWM.action",
				data:{"majorid":$(obj).attr("id")},
				dataType:"json",
				type:"post",
				success:function(msg1){
					var classInfo=eval(msg1);
					var classhtml='<tr><td></td></tr>';
					for ( var num in classInfo) {
						//alert(classInfo[num].c_id);
						//alert(classInfo[num].c_name);
						//if($(obj).attr("id")){
						//classhtml=classhtml+'<tr><td><input type="checkbox" name="className" id="classCheck'+classInfo[num].c_id+'" value="'+classInfo[num].c_id+'">'+classInfo[num].c_name+'</td></tr>';
						//}else{
						classhtml=classhtml+'<tr><td id="classCheck'+classInfo[num].c_id+'">'+classInfo[num].c_name+'</td></tr>';
						//}
					}
					classhtml=classhtml+'<tr><td><input type="button" id="major'+$(obj).attr("id")+'" onclick="upTCDataInfo(this)" value="添加"></td></tr>';
					$("#classInfoCheckbox").html(classhtml);
					//$("input:checkbox").removeAttr("checked");
				}
			});
		}
		function upTCDataInfo(obj){
			var className="";
			$("#mccnameup").attr("style","display:none;");
			$("#mnameup").attr("type","hidden");
			$("#mnameupbut").attr("type","hidden");
			$("#classnameup").attr("type","text");
			$("#classnameupbut").attr("type","button");
			$("#classnameupbut").attr("info",$(obj).attr("id").substr(5,$(obj).attr("id").length));
			//alert($(obj).attr("id").substr(5,$(obj).attr("id").length));
			
	         /* $.ajax({
						url:"${pageContext.request.contextPath}/manage_addTCOne.action",
						data:{"tc_tea_id":$(obj).attr("id").substr(5,$(obj).attr("id").length),"tc_cla_id":className},
						dataType:"json",
						type:"post",
						success:function(msg){
							var flag=eval(msg);
							alert(flag.flag);
						}
			});  */
		}
		$("#classnameupbut").click(function(){
			//alert($("#classnameupbut").attr("info"));
			//alert($("#classnameup").val());
			$.ajax({
						url:"${pageContext.request.contextPath}/manage_insertClass.action",
						data:{"classClass.c_major_id":$("#classnameupbut").attr("info"),"classClass.c_name":$("#classnameup").val()},
						dataType:"json",
						type:"post",
						success:function(msg){
							var flag=eval(msg);
							alert(flag.flag);
							window.location.href="${pageContext.request.contextPath}/jsp/manage/addMCInfo.jsp";
						}
			});
		});
		$("#mnameupbut").click(function(){
			//alert($("#mnameup").val());
			//alert($("#mccnameup").val());
			$.ajax({
						url:"${pageContext.request.contextPath}/manage_insertMajor.action",
						data:{"major.m_name":$("#mnameup").val(),"major.training_level":$("#mccnameup").val()},
						dataType:"json",
						type:"post",
						success:function(msg){
							var flag=eval(msg);
							alert(flag.flag);
							window.location.href="${pageContext.request.contextPath}/jsp/manage/addMCInfo.jsp";
						}
			});
		});
		function MCshow(obj){
		$("#mccnameup").attr("style","display:none;");
			$("#mnameup").attr("type","hidden");
			$("#mnameupbut").attr("type","hidden");
			$("#classnameup").attr("type","hidden");
			$("#classnameupbut").attr("type","hidden");
			$("tr").attr("style","background-color:#FFFFFF");
			$(obj).attr("style","background-color:#87E0E0");
			classList(obj);
		}
		function upMDataInfo(){
			$("#mccnameup").attr("style","display:block;");
			$("#classnameup").attr("type","hidden");
			$("#classnameupbut").attr("type","hidden");
			$("#mnameup").attr("type","text");
			$("#mnameupbut").attr("type","button");
		}
		
</script>
</body>
</html>