<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page pageEncoding="UTF-8" info="test"%>
<%@ include file="../inc/header.jsp"%>
<%
request.setCharacterEncoding("utf-8");
String tempSeq = request.getParameter("seq");
String tempPage = request.getParameter("page");
int seq = 0;
int cPage = 0;
try{
	seq = Integer.parseInt(tempSeq);
	cPage = Integer.parseInt(tempPage);
}catch(NumberFormatException e){
	seq = 0;
	cPage = 1;
}

	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.select(seq);
	if(dto != null){	
		String id = dto.getId();
		String email =dto.getEmail();
		String name = dto.getName();
		String phone = dto.getPhone();

%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Member</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">회원정보</h5>
					<form class="form-horizontal" role="form" name="f" method="post"
						action="">
						<div class="form-group">
							<label class="col-form-label" for="name">성명</label> 
							<p><%=name %></p>								
						</div>
						<div class="form-group">
							<label class="col-form-label" for="id">아이디</label>
							<p><%=id %></p>
						</div>
						<div class="form-group">
							<label for="email">이메일 주소</label>
							<p><%=email %></p>
						</div>
						<div class="form-group">
							<label for="phone">휴대폰 번호</label>
							<p><%=phone %></p>
						</div>
					</form>
					<div class="text-right">
						<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../inc/footer.jsp"%>
<%
	} else {
%>
<script>
			alert("회원정보가 없습니다");
			history.back(-1);
		</script>
<%} %>
