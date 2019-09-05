<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page pageEncoding = "utf-8" %>
<%
	request.setCharacterEncoding("utf-8");

	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(email,pwd);
	dto = dao.isMember(dto);
	
	if(dto!=null){
		session.setAttribute("member", dto);
		session.setMaxInactiveInterval(60*60*24);
%>
		<script>
			alert('로그인성공');
			location.href="login.jsp"
		</script>
	<%}else{%>
	<script>
		alert("로그인정보가 잘못되었습니다.");
		history.back(-1);
	</script>
<%}%>