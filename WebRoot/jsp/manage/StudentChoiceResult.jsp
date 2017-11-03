<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*,com.tom.utils.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>分页</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<style>
table,th,tr,td {
	border: 1px #C1B9B0 solid;
}
.qrbd {
	color:orange;
	cursor: pointer;
}
.ckxq{
	color:green;
	cursor: pointer;
	margin-right: 10px;
}
.czzt{
	color:red;
	cursor: pointer;
	margin-left: 10px;
}
</style>
</head>
<body>
	<table align="center" cellpadding="5" cellspacing="0">
		<thead>
			<tr>
				<th scope="col" id="title_class" colspan="9">学生信息列表</th>
			</tr>
			<tr>
				<th scope="col">身份证号</th>
				<th scope="col">姓名</th>
				<th scope="col">性别</th>
				<th scope="col">专业</th>
				<th scope="col">培养层次</th>
				<th scope="col">班级</th>
				<th scope="col">当前状态</th>
				<th scope="col">操作</th>
			</tr>
		</thead>
		<tbody>
			<%-- 遍历所有的用户 --%>
			<%
				int pageSize = 8;
				String sqlStr = "";
				int showPage = 1;
				splitPage pages = new splitPage();
				pages.setCon(new DBConnectionManager().getConnection());
				int zid=Integer.parseInt(request.getParameter("zid"));
				String flag=java.net.URLDecoder.decode(request.getParameter("flag") , "UTF-8") ;
				if(zid==1){
				int majorid=Integer.parseInt(flag);
				sqlStr="select * from stu_re_brief_info_view where LENGTH(s_id_card)>14 and c_name in (select c_name from class,major where class.c_major_id=major.m_id and m_id="+majorid+") order by st_name desc";
				}
				if(zid==2){
				String c_name=flag;
				sqlStr="select * from stu_re_brief_info_view where LENGTH(s_id_card)>14 and c_name='"+c_name+"' order by st_name desc";
				}
				String strPage = null;
				strPage = request.getParameter("showPage");
				if (strPage == null) {
					showPage = 1;
				} else {
					try {
						showPage = Integer.parseInt(strPage);
					} catch (NumberFormatException e) {
						showPage = 1;
					}
					if (showPage < 1) {
						showPage = 1;
					}
				}
				pages.initialize(sqlStr, pageSize, showPage);
				Vector vector = pages.getPage();
				for (int i = 0; i < vector.size(); i++) {
					String[] sData = (String[]) vector.get(i);
			%>

			<tr>
				<td id="s_id_card<%=i%>"><%=sData[0]%></td>
				<td><%=sData[1]%></td>
				<td><%=sData[2]%></td>
				<td><%=sData[4]%></td>
				<td><%=sData[5]%></td>
				<td><%=sData[6]%></td>
				<td id="s_state<%=i%>"><%=sData[7]%></td>
				<td><span class="ckxq" title="s_id_card<%=i%>" onclick="cxxxAjax(this)">查看详情</span><span class="qrbd"
				s_state="s_state<%=i%>"	title="s_id_card<%=i%>" onclick="qrbdFormAjax(this)">确认报道</span><span class="czzt" s_state="s_state<%=i%>" title="s_id_card<%=i%>" onclick="czztAjax(this)">重置</span></td>
			</tr>
			<%
				}
			%>
		</tbody>


	</table>

	<!--分页  -->
	<div style="text-align: center;">
		<form action="" method="get" target="_self">
		
			共<font color=red><%=pages.getRowCount()%></font>条&nbsp;
			<%=pageSize%>条/页&nbsp; 第<font color=red><%=showPage%></font>页/共<font
				color=red><%=pages.getPageCount()%></font>页 &nbsp; <a
				href="${pageContext.request.contextPath}/jsp/manage/StudentChoiceResult.jsp?zid=<%=zid %>&flag=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode(flag,"UTF-8"),"UTF-8")%>&showPage=1"
				target="_self">[首 页]</a>&nbsp;
			<%
				//判断"上一页"链接是否要显示
				if (showPage > 1) {
			%>
			<a
				href="${pageContext.request.contextPath}/jsp/manage/StudentChoiceResult.jsp?zid=<%=zid %>&flag=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode(flag,"UTF-8"),"UTF-8")%>&showPage
=<%=showPage-1%>"
				target="_self">[上一页]</a>&nbsp;
			<%
				} else {
			%>
			[上一页]&nbsp;
			<%
				}
				//判断"下一页"链接是否要显示
				if (showPage < pages.getPageCount()) {
			%>
			<a
				href="${pageContext.request.contextPath}/jsp/manage/StudentChoiceResult.jsp?zid=<%=zid %>&flag=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode(flag,"UTF-8"),"UTF-8")%>&showPage
=<%=showPage+1%>"
				target="_self">[下一页]</a>&nbsp;
			<%
				} else {
			%>
			[下一页]&nbsp;
			<%
				}
			%>
			<a
				href="${pageContext.request.contextPath}/jsp/manage/StudentChoiceResult.jsp?zid=<%=zid %>&flag=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode(flag,"UTF-8"),"UTF-8")%>&showPage
=<%=pages.getPageCount()%>"
				target="_self">[尾页]</a>&nbsp; 转到 <select name="showPage">
				<%
					for (int x = 1; x <= pages.getPageCount(); x++) {
				%>
				<option value="<%=x%>"
					<%if (showPage == x)
					out.println("selected");%>><%=x%></option>
				<%
					}
				%>
			
			</select> 页&nbsp; <input type="hidden" name="zid" value="<%=zid%>" /><input type="hidden" name="flag" value="<%=java.net.URLEncoder.encode(flag,"UTF-8")%>" /><input type="submit" name="go" value="提交" />
			
		</form>

	</div>
	<script>
	function qrbdFormAjax(obj){
		var  s_id_cardid=$(obj).attr("title");
		var  s_state=$(obj).attr("s_state");
		//alert(s_id_cardid);
		//alert($("#"+s_id_cardid).html());
		$.ajax({
			url:"${pageContext.request.contextPath}/manage_updateOneStudentInfo.action",
			data:{"s_id_card":$("#"+s_id_cardid).html()},
			dataType:"html",
			type:"post",
			success:function(msg){
				alert(msg);
				$("#"+s_state).html("在校");
			},
			error:function(){
				
			}
		});
	}
	function cxxxAjax(obj){
		var  s_id_cardid=$(obj).attr("title");
		if($("#"+s_id_cardid).html()=="null"){
			alert("暂无信息");
		}
		//alert(s_id_cardid);
		//alert($("#"+s_id_cardid).html());
		$.ajax({
			url:"${pageContext.request.contextPath}/manage_queryOneStudent.action",
			data:{"s_id_card":$("#"+s_id_cardid).html()},
			dataType:"json",
			type:"post",
			success:function(msg){
				var studetInfo=eval(msg);
				if(studetInfo.flag=="暂无信息"){
					alert(studetInfo.flag);
				}else{
					var alertinfo=studetInfo.s_name+"详细信息：\n身份证号："+studetInfo.s_id_card+"\n";
					alertinfo=alertinfo+"考生号："+studetInfo.s_exam_number+"\n";
					alertinfo=alertinfo+"性别："+studetInfo.s_sex+"\n";
					alertinfo=alertinfo+"年龄："+studetInfo.s_age+"\n";
					alertinfo=alertinfo+"省份："+studetInfo.s_province+"\n";
					alertinfo=alertinfo+"籍贯："+studetInfo.s_native_place+"\n";
					alertinfo=alertinfo+"家庭详细地址："+studetInfo.s_address+"\n";
					alertinfo=alertinfo+"乘车区间："+studetInfo.s_riding_section+"\n";
					alertinfo=alertinfo+"政治面貌："+studetInfo.p_political_status+"\n";
					alertinfo=alertinfo+"民族："+studetInfo.s_nation+"\n";
					alertinfo=alertinfo+"本人手机号："+studetInfo.s_tel+"\n";
					alertinfo=alertinfo+"邮箱："+studetInfo.s_email+"\n";
					alertinfo=alertinfo+"宿舍号："+studetInfo.s_dormitory_id+"\n";
					alertinfo=alertinfo+"培养层次："+studetInfo.s_train_level+"\n";
					alertinfo=alertinfo+"监护人1姓名："+studetInfo.guardian.g_name1+"\n";
					alertinfo=alertinfo+"监护人1电话："+studetInfo.guardian.g_tel1+"\n";
					alertinfo=alertinfo+"监护人2姓名："+studetInfo.guardian.g_name2+"\n";
					alertinfo=alertinfo+"监护人2电话："+studetInfo.guardian.g_tel2+"\n";
					alert(alertinfo);
				}
				
			},
			error:function(){
				
			}
		});
	}
	function czztAjax(obj){
		var  s_id_cardid=$(obj).attr("title");
		var  s_state=$(obj).attr("s_state");
		//alert(s_id_cardid);
		//alert($("#"+s_id_cardid).html());
		$.ajax({
			url:"${pageContext.request.contextPath}/manage_resStudent.action",
			data:{"s_id_card":$("#"+s_id_cardid).html()},
			dataType:"html",
			type:"post",
			success:function(msg){
					alert(msg);
					window.location.href="${pageContext.request.contextPath}/jsp/manage/StudentInfo.jsp";
			},
			error:function(){
				
			}
		});
	}
		
	</script>
	<%
	pages.close();
	 %>
</body>
</html>