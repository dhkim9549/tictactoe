<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.rmi.*"%>
<%@page import="com.dhkim9549.mlptictactoe.RMIInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String boardJsonStr = request.getParameter("board");

	String a = "";
	RMIInterface look_up = null;
	
  try {
		look_up = (RMIInterface)Naming.lookup("//bada.ai/MyServer");
		a += look_up.helloTo(boardJsonStr);
		Thread.sleep(1000);
	} catch(Exception ex){
		a += ex;
	}
	
	PrintWriter pw = response.getWriter();
	out.print(a);
		
	return;
%>