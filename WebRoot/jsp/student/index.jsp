<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Student Info Form</title>
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
  	<div id="student_infoshow">
  	考生号：<input type="text" id="s_exam_number">
  	姓名：<input type="text" id="studentname">
  	<input type="button" value="提交" id="formBut">
  	</div>
    <script type="text/javascript">
    //学生信息表单生成
    	$("#formBut").click(function(){
    		var studntInputInfo={
    			"s_exam_number":$("#s_exam_number").val(),
    			"studentname":$("#studentname").val(),	
    		};
    		$.ajax({
    		url:"${pageContext.request.contextPath }/student_quaryOneStudentFormAction.action",
    		data:studntInputInfo,
    		dataType:"json",
    		type:"post",
    		success:function(msg){
    			var OneStudentForm=eval(msg);
    			if(OneStudentForm.s_state_id==0){
    				alert("未查询到您的信息");
    			}else{
    				if(OneStudentForm.s_id_card.length==0){
    				alert("请完善您的信息");
    				var studentAddInfoFormHtml='<table>'+
    				'<tr><td><span>学生姓名</span><td><td><span>'+OneStudentForm.s_name+'</span><td><tr>'+
    				'<tr><td><span>考生号</span><td><td><span id="form_s_exam_number">'+OneStudentForm.s_exam_number+'</span><td><tr>'+
    				'<tr><td><span>学生班级</span><td><td><span>'+OneStudentForm.c_name+'</span><td><tr>';
    				if(OneStudentForm.s_dormitory_id=="暂未分配")
    				{
    					studentAddInfoFormHtml=studentAddInfoFormHtml+'<tr><td><span>学生宿舍</span><td><td><input id="form_s_dormitory_id" type="text" value="'+OneStudentForm.s_dormitory_id+'"><td><tr>';
    				}else{
    					studentAddInfoFormHtml=studentAddInfoFormHtml+'<tr><td><span>学生宿舍</span><td><td><input id="form_s_dormitory_id" readonly="readonly"  type="text" value="'+OneStudentForm.s_dormitory_id+'"><td><tr>';
    				}
    				studentAddInfoFormHtml=studentAddInfoFormHtml+
    				'<tr><td><span>身份证号</span><td><td><input id="form_s_id_card" type="text" value=""><td><tr>';
    				$.ajax({
    					url:"${pageContext.request.contextPath }/usua_selectZZMM.action",
    						data:{},
    						dataType:"json",
    						type:"post",
    						success:function(msg){
    							studentAddInfoFormHtml=studentAddInfoFormHtml+
    							'<tr><td><span>政治面貌</span><td><td><select id="form_p_id">';
    							var zzmm=eval(msg);
    							for ( var i in zzmm) {
									studentAddInfoFormHtml=studentAddInfoFormHtml+
									'<option value="'+zzmm[i].p_id+'">'+zzmm[i].p_p_political_status+'</option>';
								}
								studentAddInfoFormHtml=studentAddInfoFormHtml+
								'</select><td><tr>';
								studentAddInfoFormHtml=studentAddInfoFormHtml+
    							'<tr><td><span>民族</span><td><td><input id="form_s_nation" type="text" value=""><td><tr>'+
    							'<tr><td><span>乘车区间</span><td><td>信阳-<input id="form_s_riding_section" style="width:108px;" type="text" value=""><td><tr>'+
    							'<tr><td><span>籍贯</span><td><td><input id="form_s_native_place" type="text" value=""><td><tr>'+
    							'<tr><td><span>家庭详细地址</span><td><td><input id="form_s_address" type="text" value=""><td><tr>'+
    							'<tr><td><span>本人电话</span><td><td><input id="form_s_tel" type="text" value=""><td><tr>'+
    							'<tr><td><span>监护人1  姓名(父亲)</span><td><td><input id="form_g_name1" type="text" value=""><td><tr>'+
    							'<tr><td><span>监护人1手机号</span><td><td><input id="form_g_tel1" type="text" value=""><td><tr>'+
    							'<tr><td><span>监护人2姓名</span><td><td><input id="form_g_name2" type="text" value=""><td><tr>'+
    							'<tr><td><span>监护人2手机号</span><td><td><input id="form_g_tel2" type="text" value=""><td><tr>'+
    							'<tr><td><span>家庭人口数</span><td><td><input id="form_s_family_population" type="text" value=""><td><tr>'+
    							'<tr><td><span>个人邮箱</span><td><td><input id="form_s_email" type="text" value=""><td><tr>'+
    							'<tr><td><input id="form_student_button" onclick="form_student_button()" type="button" value="提交"><td><td></td><tr>';
								studentAddInfoFormHtml=studentAddInfoFormHtml+'<table>';
    							$("#student_infoshow").html(studentAddInfoFormHtml);
    							//alert($("#form_s_exam_number").html());
    						}
    				});
    				}else{
    					$.ajax({
			    			url:"${pageContext.request.contextPath }/student_getNowState.action",
				    		data:{"s_id_card":OneStudentForm.s_id_card},
				    		dataType:"html",
				    		type:"post",
				    		success:function(msg){
			    				alert("当前状态为："+msg);
			    			}
			    		});
    				}
    			}
    		}
    		});
    	
    	});
    	function form_student_button(){
    	//alert(getMyDate($("#form_s_id_card").val()));
    	//alert($("#form_s_dormitory_id").val());
    	//学生信息
    		var student_addInfo={
    			"s_email":$("#form_s_email").val(),
    			"s_exam_number":$("#form_s_exam_number").html(),
    			"s_note":$("#form_s_note").val(),
    			"s_age":getMyDate($("#form_s_id_card").val()),
    			"s_student_number":"",
    			"s_nation":$("#form_s_nation").val(),
    			"s_dormitory_id":$("#form_s_dormitory_id").val(),
    			"s_native_place":$("#form_s_native_place").val(),
    			"s_riding_section":"信阳-"+$("#form_s_riding_section").val(),
    			"s_address":$("#form_s_address").val(),
    			"s_family_population":$("#form_s_family_population").val(),
    			"s_p_id":$("#form_p_id").val(),
    			"s_tel":$("#form_s_tel").val(),
    			"s_id_card":$("#form_s_id_card").val()
    		};
    		$.ajax({
    			url:"${pageContext.request.contextPath }/student_updateStudent.action",
    			dataType:"html",
    			type:"post",
    			data:student_addInfo,
    			success:function(msg){
    				alert(msg);
		    		var student_family={
		    			"s_id_card":$("#form_s_id_card").val(),
		    			"g_name1":$("#form_g_name1").val(),
		    			"g_tel1":$("#form_g_tel1").val(),
		    			"g_name2":$("#form_g_name2").val(),
		    			"g_tel2":$("#form_g_tel2").val()
		    		};
		    		//插入联系方式
		    		$.ajax({
		    			url:"${pageContext.request.contextPath }/student_insertGuardian.action",
		    			dataType:"html",
		    			type:"post",
		    			data:student_family,
		    			success:function(msg){
		    					alert(msg);
		    					window.location.href="${pageContext.request.contextPath }/index.jsp";
				    		}
		    		});
    			}
    		
    		});
    	}
    	
    	//获取输入身份证号码信息
    	function getMyDate(UUserCard){
			if(UUserCard != null && UUserCard != ''){
			//获取出生日期 
			//var birthday = UUserCard.substring(6, 10) + "-" + UUserCard.substring(10, 12) + "-" + UUserCard.substring(12, 14); 
			//获取性别 
			//if (parseInt(UUserCard.substr(16, 1)) % 2 == 1) { 
			// alert("男");//男 
			//} else { 
			// alert("女");//女 
			//} 
			//获取年龄 
			var myDate = new Date(); 
			var month = myDate.getMonth() + 1; 
			var day = myDate.getDate();
			
			var age = myDate.getFullYear() - UUserCard.substring(6, 10) - 1; 
			if (UUserCard.substring(10, 12) < month || UUserCard.substring(10, 12) == month && UUserCard.substring(12, 14) <= day) { 
			age++; 
			}
			return age;
			//年龄 age
			}
    	} 
		
    </script>
  </body>
</html>
