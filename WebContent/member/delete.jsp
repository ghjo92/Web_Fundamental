<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess = dao.delete(seq);
	if(isSuccess){
%>
    <script>
    alert('삭제');
    location.href="list.jsp";
    </script>
<%  }else{%>
    <script>
    alert('삭제실패');

<%  	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>