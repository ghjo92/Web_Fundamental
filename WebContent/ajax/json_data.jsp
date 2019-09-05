<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json;charset=utf-8"%>

<%
	JSONObject jsonObj = new JSONObject();
	JSONArray jsonArray = new JSONArray();
	
	
	JSONObject item1 = new JSONObject();
	item1.put("name","syh");
	item1.put("clubid","syho1011");
	jsonArray.add(item1);
	
	JSONObject item2 = new JSONObject();
	item2.put("name","syh2");
	item2.put("clubid","syho1012");
	jsonArray.add(item2);
	
	JSONObject item3 = new JSONObject();
	item3.put("name","syh3");
	item3.put("clubid","syho1013");
	jsonArray.add(item3);
	
	jsonObj.put("cafelist",jsonArray);
	
	
	out.print(jsonObj.toString());
%>