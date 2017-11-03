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
<table id="teacherInfo" border="1" cellspacing="0" cellpadding="0">
</table>
</td><td id="classInfoCheckboxTD"  style="vertical-align:top;">
<table id="classInfoCheckbox">
	

</table>
</td></tr>
</table>
</div>
<script type="text/javascript">
		$.ajax({
			url:"${pageContext.request.contextPath}/manage_queryTeacherAll.action",
			data:{},
			dataType:"json",
			type:"post",
			success:function(msg){
				var teacherInfo=eval(msg);
				var teacherhtml='<tr><th>教师姓名</th><th>教师手机号</th></tr>';
				for ( var num in teacherInfo) {
					//alert(teacherInfo[num].t_id);
					//alert(teacherInfo[num].t_name);
					//alert(teacherInfo[num].t_tel);
					teacherhtml=teacherhtml+'<tr class="teaTr"  onclick="TCshow(this)" id="'+teacherInfo[num].t_id+'"><td>'+teacherInfo[num].t_name+'</td><td>'+teacherInfo[num].t_tel+'</td></tr>';
				}
				$("#teacherInfo").html(teacherhtml);
			}
		});
		function classList(obj){
			$("#classInfoCheckboxTD").attr("style","border: 1px #4E5353 solid;");
			$.ajax({
				url:"${pageContext.request.contextPath}/manage_queryClassList.action",
				data:{},
				dataType:"json",
				type:"post",
				success:function(msg1){
					var classInfo=eval(msg1);
					$.ajax({
						url:"${pageContext.request.contextPath}/manage_queryTC.action",
						data:{},
						dataType:"json",
						type:"post",
						success:function(msg2){
								var tccon=eval(msg2);
								var classhtml='<tr><td><input type="checkbox" onclick="selectAll(this);" />全选</td></tr>';
								for ( var num in classInfo) {
									//alert(classInfo[num].c_id);
									//alert(classInfo[num].c_name);
									//if($(obj).attr("id")){
									//classhtml=classhtml+'<tr><td><input type="checkbox" name="className" id="classCheck'+classInfo[num].c_id+'" value="'+classInfo[num].c_id+'">'+classInfo[num].c_name+'</td></tr>';
									//}else{
									classhtml=classhtml+'<tr><td><input type="checkbox" name="className" id="classCheck'+classInfo[num].c_id+'" value="'+classInfo[num].c_id+'">'+classInfo[num].c_name+'</td></tr>';
									//}
								}
								classhtml=classhtml+'<tr><td><input type="button" id="teacher'+$(obj).attr("id")+'" onclick="upTCDataInfo(this)" value="修改"></td></tr>';
								$("#classInfoCheckbox").html(classhtml);
								for ( var i in tccon) {
									if(tccon[i].tc_tea_id==$(obj).attr("id")){
										$("#classCheck"+tccon[i].tc_cla_id).attr("checked","checked");
									}
								}
								//$("input:checkbox").removeAttr("checked");
								
							}
						});
				}
			});
		}
		function selectAll(checkbox) {
		    $("input[type=checkbox]").prop("checked", $(checkbox).prop("checked"));
		}
		
		function upTCDataInfo(obj){
			var className="";
			//alert($(obj).attr("id").substr(7,$(obj).attr("id").length));
	        $("input:checkbox[name='className']:checked").each(function() {
	            className=className+$(this).val()+",";
	            //alert($(this).attr("id"));
	        });
	         $.ajax({
						url:"${pageContext.request.contextPath}/manage_addTCOne.action",
						data:{"tc_tea_id":$(obj).attr("id").substr(7,$(obj).attr("id").length),"tc_cla_id":className},
						dataType:"json",
						type:"post",
						success:function(msg){
							var flag=eval(msg);
							alert(flag.flag);
						}
			}); 
		}
		function TCshow(obj){
			$("tr").attr("style","background-color:#FFFFFF");
			$(obj).attr("style","background-color:#87E0E0");
			classList(obj);
		}
</script>
</body>
</html>