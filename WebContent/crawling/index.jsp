<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp"%>
<%
Document doc = null;
String url = "https://coinmarketcap.com/currencies/bitcoin/historical-data/?start=20190101&end=20190909";

try {
	doc = Jsoup.connect(url).get();
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

//System.out.println("Date\tOpen\tHigh\tLow\tClose\tVolume\tMarket Cap");

Elements bodyElements = doc.select(".table-responsive .table tbody tr");
%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Crawling</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시판</h5>
					<div class="table-responsive-md">
						<table class="table table-hover">
							<colgroup>
								<col width="25%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="15%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">Date</th>
									<th scope="col">Open</th>
									<th scope="col">High</th>
									<th scope="col">Low</th>
									<th scope="col">Close</th>
									<th scope="col">Volume</th>
									<th scope="col">Market Cap</th>									
								</tr>
							</thead>
							<tbody>	
							<% if(bodyElements.size() !=0 ){
							
							for(int i=0;i<bodyElements.size();i++) {
								int index = 0;
								Element trElement = bodyElements.get(i);
								//Element dateElement = trElement.child(0);
								String date = trElement.child(index++).text();
								date = Utility.getKoreanDate(date);
								//Element openElement = trElement.child(1);
								String open = trElement.child(index++).text();
								String high = trElement.child(index++).text();
								String low = trElement.child(index++).text();
								String close = trElement.child(index++).text();
								String volume = trElement.child(index++).text();
								String marketCap = trElement.child(index++).text();
							
							%>						
								<tr>
									<th scope="row"><%=date %></th>
									<td><%=open %></td>
									<td><%=high %></td>
									<td><%=low %></td>
									<td><%=close %></td>
									<td><%=volume %></td>
									<td><%=marketCap %></td>
								</tr>
							<%}
							}else{
							%>
							<tr>
							</tr>
							<%}
							%>
							</tbody>
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">
								
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../inc/footer.jsp"%>