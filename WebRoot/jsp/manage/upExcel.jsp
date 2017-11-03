<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>上传文档</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style>
    		#loadbar{  
                width:300px;  
                background-color: silver;  
                border:1px solid salmon;  
                text-align: center;  
                border-radius:8px ;  
            }  
            #bar{  
                display: block;  
                font-family: arial;  
                font-size: 12px;  
                background-color: sandybrown;  
                text-align: center;  
                padding: 0px;  
                border-radius:5px ;  
                   
            }  
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js">
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js">
</script>
<link href="${pageContext.request.contextPath }/jsp/manage/css/paging.css"
	rel="stylesheet" type="text/css"></link>
</head>
<body>
	<div>
		<center>
		<form id="excelform" method="post" enctype="multipart/form-data">
			<table border="0" cellspacing="0" cellpadding="10">
				<tr>
					<td><input id="fileupload" name="fileupload" type="file" />
						<div id="tipDiv"></div></td>
					<td colspan="2" align="center"><input type="button"
						 onclick="uploadExcel()" value="导入" /></td>
			</tr>
		</table></form> 
		<div id="loadbardiv">
			  <span id="loadinfo">正在导入数据库</span>
			   <div id="loadbar"> 
              <span id="bar"  style="width: 5%;">1%</span>  
        </div> </div>
		<br>
		<div id="showExcelDiv">
			<h3>数据预览</h3>
			<table border="1" cellspacing="0" cellpadding="7" style="text-align: center;" id="showExcel">
			
			</table>
		</div>
		<!-- 分页 -->
		<div id="pageTool"></div>
		</center>
	</div>
	<script type="text/javascript">
	$("#loadbardiv").hide();
	$("#showExcelDiv").hide();
	function uploadExcel() {
		if($("#fileupload").val().length==0){
			alert("请选择文件");
			return false;
		}else{
		$(document)
				.ready(
						function() {
							var options = {
								url : "${pageContext.request.contextPath}/file_uploadFile.action",
								type : "POST",
								dataType : "json",
								success : function(msg) {
									$("#loadbardiv").show();
									$("#bar").show();
									 $("#loadinfo").html("正在导入数据库");
									var infoJson=eval(msg);
									$("#tipDiv").html(infoJson.info);
									$.ajax({
										url:"${pageContext.request.contextPath}/file_insertDBExcel.action",
										data:{"excelUrl":infoJson.url},
										dataType:"json",
										type:"post",
										success:function(msg){
											var studentInfoJson=eval(msg);
											var loadbardivi=1;
								            var showbar=setInterval(function(){
								            	console.log("setbar");  
									            loadbardivi+=1;  
									            if(loadbardivi>100)  
									            {   
									                clearInterval(showbar);
									                $("#excelform").hide();
									                $("#loadinfo").html("导入数据库成功,共导入"+studentInfoJson.length+"条数据");
									                pageShowStudent(studentInfoJson.length);
									                return null;
									            }  
									            document.getElementById("bar").style.width=loadbardivi+"%";  
									            document.getElementById("bar").innerHTML=loadbardivi+"%";  
								            },50);
										},
										error:function(){
											//alert(infoJson.url);
											 $("#loadinfo").html("导入数据库失败,共导入"+0+"条数据");
											 $("#bar").hide();
											alert("导入失败，检查模板是否匹配");
										}
									});
								},
								error : function(error) {
									alert("上传失败");
								}
							};
							$("#excelform").ajaxSubmit(options);
							return false;
						});
			}
	}
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/manage/js/query.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/manage/js/paging.js"></script>
	<script type="text/javascript">
	function pageShowStudent(obj){
		$.ajax({
						url:"${pageContext.request.contextPath }/manage_queryStudentsFenYe.action",
						data:{"nowpage":1,"pagesize":8},
						dataType:"json",
						type:"post",
						success:function(msg){
							
							var studentsListJson=eval(msg);
							var stuHtml='<tr><th>考生号</th><th>姓名</th><th>性别</th><th>省份</th><th>班级编号</th><th>宿舍号</th></tr>';
							for ( var num in studentsListJson) {
							stuHtml=stuHtml+'<tr><td>'+studentsListJson[num].s_exam_number+'</td><td>'+studentsListJson[num].s_name+'</td><td>'+studentsListJson[num].s_sex+'</td><td>'+studentsListJson[num].s_province+'</td><td>'+studentsListJson[num].s_class_id+'</td><td>'+studentsListJson[num].s_dormitory_id+'</td></tr>';
							}
							stuHtml=stuHtml+'';
							$("#showExcel").html(stuHtml);
							$("#showExcelDiv").show();
							//alert(msg);
						}
					});
		$("#pageTool").Paging({
				pagesize:8,
				count:obj,
				callback:function(page,size,count){
				$.ajax({
						url:"${pageContext.request.contextPath }/manage_queryStudentsFenYe.action",
						data:{"nowpage":page,"pagesize":size},
						dataType:"json",
						type:"post",
						success:function(msg){
							
							var studentsListJson=eval(msg);
							var stuHtml='<tr><th>考生号</th><th>姓名</th><th>性别</th><th>省份</th><th>班级编号</th><th>宿舍号</th></tr>';
							for ( var num in studentsListJson) {
							stuHtml=stuHtml+'<tr><td>'+studentsListJson[num].s_exam_number+'</td><td>'+studentsListJson[num].s_name+'</td><td>'+studentsListJson[num].s_sex+'</td><td>'+studentsListJson[num].s_province+'</td><td>'+studentsListJson[num].s_class_id+'</td><td>'+studentsListJson[num].s_dormitory_id+'</td></tr>';
							}
							stuHtml=stuHtml+'';
							$("#showExcel").html(stuHtml);
							$("#showExcelDiv").show();
							//alert(msg);
						}
					});
				//alert('当前第 ' +page +'页,每页 '+size+'条,总页数：'+count+'页');
			}});
	}
	 
	
	</script>
</body>
</html>
