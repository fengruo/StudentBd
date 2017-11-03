<%@ page language="java" import="java.util.*,com.tom.utils.*"
	pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<table align="center" cellpadding="5" cellspacing="0">
		<thead>
			<tr>
				<th scope="col" colspan="9">学生信息列表</th>
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
				int pageSize = 12;
				String sqlStr = "";
				int showPage = 1;
				splitPage pages = new splitPage();
				pages.setCon(new DBConnectionManager().getConnection());
				sqlStr = "select * from stu_re_brief_info_view";
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
				<td><%=sData[7]%></td>
				<td><span class="qrbd"
					title="s_id_card<%=i%>" onclick="qrbdFormAjax(this)">确认报道</span></td>
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
				href="${pageContext.request.contextPath}/jsp/manage/StudentAllInfo.jsp?showPage=1"
				target="_self">[首 页]</a>&nbsp;
			<%
				//判断"上一页"链接是否要显示
				if (showPage > 1) {
			%>
			<a
				href="${pageContext.request.contextPath}/jsp/manage/StudentAllInfo.jsp?showPage
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
				href="${pageContext.request.contextPath}/jsp/manage/StudentAllInfo.jsp?showPage
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
				href="${pageContext.request.contextPath}/jsp/manage/StudentAllInfo.jsp?showPage
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
			</select> 页&nbsp; <input type="submit" name="go" value="提交" />
		</form>

	</div>
	<script>
	function qrbdFormAjax(obj){
		var  s_id_cardid=$(obj).attr("title");
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
		
	</script>
	<%
	pages.close();
	 %>
</body>
</html>