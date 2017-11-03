$(function(){
	$("#baqkylb_table").click(function(){
		$.ajax({
			url:"/StudentBD/manage_quaryAllReportFormAction.action",
			data:{},
			dataType:"json",
			type:"post",
			success:function(msg){
				var AllReportForm=eval(msg);
				var baqkylb_tablehtml="<table><tr><td><table border='2' cellspacing='10' cellpadding='10' style='text-align:center;float:left;margin:10px;'><tr><th colspan='4'>总体情况一览表</th></tr><tr><th>汇总类别</th><th>录取人数</th><th>已报到人数</th><th>未报到人数</th></tr>"
				for ( var num in AllReportForm) {
					baqkylb_tablehtml=baqkylb_tablehtml+'<tr><td>'+AllReportForm[num].leibie+'</td><td>'+AllReportForm[num].lqrs+'</td><td>'+AllReportForm[num].bdrs+'</td><td>'+AllReportForm[num].wbdrs+'</td></tr>';
				}
				baqkylb_tablehtml=baqkylb_tablehtml+"</table></td></tr>";
				$.ajax({
					url:"/StudentBD/manage_quaryMajorBDInfo.action",
					data:{},
					dataType:"json",
					type:"post",
					success:function(msg){
						var AllReportForm=eval(msg);
						baqkylb_tablehtml=baqkylb_tablehtml+"<tr><td><table border='2' cellspacing='10' cellpadding='10' style='text-align:center;float:left;margin:10px;'><tr><th colspan='7'>专业分类情况统计一览表</th></tr><tr><th>专业名称</th><th>录取人数</th><th>录取女生人数</th><th>录取男生人数</th><th>实到女生人数</th><th>实到男生人数</th><th>已报到人数</th></tr>"
						for ( var num in AllReportForm) {
							baqkylb_tablehtml=baqkylb_tablehtml+'<tr><td>'+AllReportForm[num].zymc+'</td><td>'+AllReportForm[num].lqrs+'</td><td>'+AllReportForm[num].lqnvsrs+'</td><td>'+AllReportForm[num].lqnsrs+'</td><td>'+AllReportForm[num].sdnvsrs+'</td><td>'+AllReportForm[num].sdnsrs+'</td><td>'+AllReportForm[num].ybdrs+'</td></tr>';
						}
						baqkylb_tablehtml=baqkylb_tablehtml+"</table></td></tr>";
						$.ajax({
							url:"/StudentBD/manage_quaryClassBDInfo.action",
							data:{},
							dataType:"json",
							type:"post",
							success:function(msg){
								var AllReportForm=eval(msg);
								baqkylb_tablehtml=baqkylb_tablehtml+"<tr><td><table border='2' cellspacing='10' cellpadding='10' style='text-align:center;float:left;margin:10px;'><tr><th colspan='7'>班级分类情况统计一览表</th></tr><tr><th>班级名称</th><th>录取人数</th><th>录取女生人数</th><th>录取男生人数</th><th>实到女生人数</th><th>实到男生人数</th><th>已报到人数</th></tr>"
								for ( var num in AllReportForm) {
									baqkylb_tablehtml=baqkylb_tablehtml+'<tr><td>'+AllReportForm[num].bjmc+'</td><td>'+AllReportForm[num].lqrs+'</td><td>'+AllReportForm[num].lqnvsrs+'</td><td>'+AllReportForm[num].lqnsrs+'</td><td>'+AllReportForm[num].sdnvsrs+'</td><td>'+AllReportForm[num].sdnsrs+'</td><td>'+AllReportForm[num].ybdrs+'</td></tr>';
								}
								baqkylb_tablehtml=baqkylb_tablehtml+"</table></td></tr>";
								$.ajax({
									url:"/StudentBD/manage_quaryPYCCBDInfo.action",
									data:{},
									dataType:"json",
									type:"post",
									success:function(msg){
										var AllReportForm=eval(msg);
										baqkylb_tablehtml=baqkylb_tablehtml+"<tr><td><table border='2' cellspacing='10' cellpadding='10' style='text-align:center;float:left;margin:10px;'><tr><th colspan='7'>培养层次分类情况统计一览表</th></tr><tr><th>培养层次</th><th>录取人数</th><th>录取女生人数</th><th>录取男生人数</th><th>实到女生人数</th><th>实到男生人数</th><th>已报到人数</th></tr>"
										for ( var num in AllReportForm) {
											baqkylb_tablehtml=baqkylb_tablehtml+'<tr><td>'+AllReportForm[num].pyce+'</td><td>'+AllReportForm[num].lqrs+'</td><td>'+AllReportForm[num].lqnvsrs+'</td><td>'+AllReportForm[num].lqnsrs+'</td><td>'+AllReportForm[num].sdnvsrs+'</td><td>'+AllReportForm[num].sdnsrs+'</td><td>'+AllReportForm[num].ybdrs+'</td></tr>';
										}
										baqkylb_tablehtml=baqkylb_tablehtml+"</table></td></tr></table>";
										$("#data_info_show").html(baqkylb_tablehtml);
									}
								});
							}
						});
					}
				});
			},
			error:function(){
				
			}
		});
	});
	/**/
	function classChange(v){     
        alert(v);     
    } 
	$("#information_audit").click(function(){
		$("#data_info_show").html("<iframe style='width:1080px;height:520px;' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/StudentInfo.jsp'/>");
	});
	$("#stu_basic_info_regist_view").click(function(){
		$("#data_info_show").html("<iframe style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='auto' allowtransparency='yes' src='/StudentBD/jsp/manage/stu_basic_info_regist_view.jsp'/>");
	});
	$("#basic_info_sta_freshmen_view").click(function(){
		$("#data_info_show").html("<iframe style='width:1080px;height:520px' src='/StudentBD/jsp/manage/basic_info_sta_freshmen_view.jsp'/>");
	});
	$("#StudentAllInfo").click(function(){
		$("#data_info_show").html("<iframe style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/StudentAllInfo.jsp'/>");
	});
	$("#StudentListChoice").click(function(){
		$("#data_info_show").html("<iframe  style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/MagorClassList.jsp'/>");
	});
	$("#TeaStudentListChoice").click(function(){
		$("#data_info_show").html("<iframe  style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/ClassList.jsp'/>");
	});
	$("#addMCInfo").click(function(){
		$("#data_info_show").html("<iframe  style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/addMCInfo.jsp'/>");
	});
	$("#addTCManager").click(function(){
		$("#data_info_show").html("<iframe  style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/addTCManager.jsp'/>");
	});
	$("#manageManager").click(function(){
		$("#data_info_show").html("<iframe  style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/manageManager.jsp'/>");
	});
	$("#addTeacherInfo").click(function(){
		$("#data_info_show").html("<iframe  style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/addTeacherInfo.jsp'/>");
	});
	$("#addStudentInfo").click(function(){
		$("#data_info_show").html("<iframe  style='width:1080px;height:520px' frameborder='no' border='0' marginwidth='0' marginheight='0' scrolling='no' allowtransparency='yes' src='/StudentBD/jsp/manage/upExcel.jsp'/>");
	});
	$("#pwdManage").click(function(){
		var html='<center><div style="margin-top:50px;">' +
			'<p><h4>密码修改</h4></p>'+	
			'<p>原始密码：<input type="password" id="oldPwd"></p>'+	
			'<p>&nbsp;&nbsp;&nbsp;&nbsp;新密码：<input type="password" id="newPwd1"></p>'+	
			'<p>密码确认：<input type="password" id="newPwd2"></p>'+	
			'<p id="infoShow" style="color:red;"></p>'+	
			'<p><input type="button" onclick="pwdUp()" value="修改"></p>'+	
		'</div></center>';
		$("#data_info_show").html(html);
	});
});
function pwdUp(){
	var oldPwd=$("#oldPwd").val();
	var newPwd1=$("#newPwd1").val();
	var newPwd2=$("#newPwd2").val();
	if(oldPwd==null||newPwd1==null||newPwd2==null||oldPwd==""||newPwd1==""||newPwd2==""){
		alert("输入不能为空");
		return false;
	}else if(newPwd1==newPwd2){
		var formInfo={
				"oldPwd":oldPwd,
				"newPwd":newPwd1
			};
		$.ajax({
			url:"/StudentBD/manage_xgPwd.action",
			dataType:"json",
			type:"post",
			data:formInfo,
			success:function(msg){
				var info=eval(msg);
				$("#infoShow").html(info.flag);
			}
		});
		return true;
	}else{
		alert("密码输入不一致");
		return false;
	}
}
