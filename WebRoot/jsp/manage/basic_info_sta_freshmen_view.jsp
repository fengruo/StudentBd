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
	<table align="center" cellpadding="5" cellspacing="0" width="200%">
		<thead>
			<tr>
				<th scope="col" colspan="20">学生基本信息统计表</th>
			</tr>
			<tr>
				<th scope="col">学院名称</th>
				<th scope="col">学生姓名</th>
				<th scope="col">专业</th>
				<th scope="col">班级</th>
				<th scope="col">培养层次</th>
				<th scope="col">学制</th>
				<th scope="col">宿舍号</th>
				<th scope="col">性别</th>
				<th scope="col">出生年月日</th>
				<th scope="col">民族</th>
				<th scope="col">政治面貌</th>
				<th scope="col">身份证号码</th>
				<th scope="col">籍贯</th>
				<th scope="col">家庭住址</th>
				<th scope="col">乘车区间</th>
				<th scope="col">监护人1姓名</th>
				<th scope="col">联系电话</th>
				<th scope="col">监护人2姓名</th>
				<th scope="col">联系电话</th>
				<th scope="col">家庭人口数</th>
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
				sqlStr = "select d_name,s_name,m_name,c_name,s_train_level,s_education_system,s_dormitory_id,s_sex,CAST(SUBSTRING(s_id_card,7,8) AS DATE),s_nation,p_political_status,s_id_card,s_native_place,s_address,s_riding_section,g_name1,g_tel1,g_name2,g_tel2,s_family_population from student,politicsstatus,guardian,department,major,class where student.s_p_id=politicsstatus.p_id and student.s_id_card=guardian.g_id_card and department.d_id=major.d_id and major.m_id=class.c_major_id and student.s_class_id=class.c_id";
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
				<td><%=sData[0]%></td>
				<td><%=sData[1]%></td>
				<td><%=sData[2]%></td>
				<td><%=sData[3]%></td>
				<td><%=sData[4]%></td>
				<td><%=sData[5]%></td>
				<td><%=sData[6]%></td>
				<td><%=sData[7]%></td>
				<td><%=sData[8]%></td>
				<td><%=sData[9]%></td>
				<td><%=sData[10]%></td>
				<td><%=sData[11]%></td>
				<td><%=sData[12]%></td>
				<td><%=sData[13]%></td>
				<td><%=sData[14]%></td>
				<td><%=sData[15]%></td>
				<td><%=sData[16]%></td>
				<td><%=sData[17]%></td>
				<td><%=sData[18]%></td>
				<td><%=sData[19]%></td>
				
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
				href="${pageContext.request.contextPath}/jsp/manage/basic_info_sta_freshmen_view.jsp.jsp?showPage=1"
				target="_self">[首 页]</a>&nbsp;
			<%
				//判断"上一页"链接是否要显示
				if (showPage > 1) {
			%>
			<a
				href="${pageContext.request.contextPath}/jsp/manage/basic_info_sta_freshmen_view.jsp.jsp?showPage
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
				href="${pageContext.request.contextPath}/jsp/manage/basic_info_sta_freshmen_view.jsp.jsp?showPage
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
				href="${pageContext.request.contextPath}/jsp/manage/basic_info_sta_freshmen_view.jsp.jsp?showPage
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
	<%
	
	pages.close();
	 %>
</body>
</html>