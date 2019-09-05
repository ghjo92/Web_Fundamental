<%@ page pageEncoding="utf-8"%>
<%
	session.invalidate();
	response.sendRedirect("/");
%>