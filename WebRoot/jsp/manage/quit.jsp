<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	session.removeAttribute("manageName");
	session.removeAttribute("managestate");
	session.removeAttribute("teacherid");
%>
<script>
window.location.href="${pageContext.request.contextPath }/jsp/manage/login.jsp";
</script>