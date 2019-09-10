<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page contentType="application/json; charset=utf-8" %>


<%
	String clientId = "3emzoyMCLnSG8bERHPzK";// 애플리케이션 클라이언트 아이디값";
	String clientSecret = "V41sY5O4_G";// 애플리케이션 클라이언트 시크릿값";
	String oriUrl = request.getParameter("url");
	
	StringBuffer  resp = new StringBuffer(); 
	try {
		// String text = "https://developers.naver.com/notice";
		String apiURL = "https://openapi.naver.com/v1/util/shorturl?url=" + oriUrl;
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		while ((inputLine = br.readLine()) != null) {
			resp.append(inputLine + "\n");
		}
		br.close();
		// System.out.println(response.toString());

		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(resp.toString());
		JSONObject dataObj = (JSONObject) jsonObj.get("result");

		resp.setLength(0); // 데이타 모두 지우기
		resp.append(dataObj.get("url"));

	} catch (Exception e) {
		System.out.println(e);
	}

	String result = resp.toString();
	if(result != null){
%>
{"result" : "ok", "shortenUrl" : "<%=result %>"}
<%}else{%>
{"result" : "false"}
<%}%>