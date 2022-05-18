<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<% 
	// java영역 <%% >
	// requet, response등 선언없이 사용가능한 내장 객체가 있다.
	String name = request.getParameter("name");
	String animal = request.getParameter("animal");
	String color = request.getParameter("color");
	String[] foods = request.getParameterValues("food");
	
	// Servlet에서 request의 속성으로 전달한 값
	String src = (String) request.getAttribute("src"); //Object -> String 형변환
	
	System.out.println("--------------------- @jsp ---------------------");
	System.out.println(name + ", " + animal + ", " + color + ", " + Arrays.toString(foods) + ", " + src);
%> 

<!doctype html>
<html>
<head>
	<meta charset='utf-8'>
	<title>개인취향검사결과 - Servlet & JSP</title>
</head>
<body>
	<h1>개인취향검사결과 - Servlet & JSP</h1>
	<%-- jsp주석 (해석/처리되지 않는다) --%>
	<%-- 표현식 (<%= %>) : 자바 변수를 응답메세지에 출력할 때 사용 --%>
	<p>이름 : <%= name %></p>
	<p>선호컬러 : <%= color %></p>
	<p>선호동물 : <%= animal %></p>
	<p>선호음식 : <%= Arrays.toString(foods) %></p>
<hr />
<p><%= name %>님이 좋아하는 <img src='<%= src %>'/>입니다.</p>
</body>
</html>