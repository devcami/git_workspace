<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
	// jsp는 동적으로 컴파일 되므로, tomcat을 재시작할 필요가 없다. (아예 reload대상이 아니고 변경사항이 있을때마다 톰캣이 알아서 갱신)
	
	// scriptlet - 자바영역 
	int sum = 0;
	for(int i = 1; i <= 100; i++)
		sum += i;
	System.out.println("sum@server-side = " + sum);
	
	long time = new Date().getTime();
	// long millis = System.currentTimeMillis(); 현재 시스템 시각을 milli초로 반환
	
	int n = 100;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp basic</title>
</head>
<body>
	<h1>jsp 기본 : server | client</h1>
	<h2>합계 구하기</h2>
	<!-- 서버 단에서 -->
	<p id="server-side-sum"><%= sum %></p>
	<!-- 클라이언트 단에서 -->
	<p id="client-side-sum"></p>
	
	<hr />
	
	<h2>millis 구하기</h2>
	<!-- time에 System.currentTimeMillis() 를 넣어도 된다. 세미콜론은 찍으면 안댐 -->
	<p id="server-side-time"><%= time %></p>
	<p id="client-side-time"></p>
	
	<hr>
	<script>
	const clientSideSum = document.querySelector("#client-side-sum");
	let sum = 0;
	for(let i = 1; i <= 100; i++)
		sum += i;
	clientSideSum.innerHTML = sum;
	console.log("sum@client-side = ", sum);
	
	document.querySelector("#client-side-time").innerHTML = new Date().getTime();
	// document.querySelector("#client-side-time").innerHTML = Date.now(); 
	
	// 서버단 처리값(java단)을 자바스크립트에서 활용하기 - 자바스크립트 값을 자바에서 활용은 안됨~~~~~~ 절대
	const k = 100 + <%= n %>;
	document.querySelector("#client-side-time").innerHTML += '<br><hr>' + k;
	</script>
	
	<h2>주석</h2>
	<%-- jsp주석 : servlet 변환과정에서 처리되지 않는다. - 클라이언트에 전달되지 않는다. --%>
	<!-- html주석 : 클라이언트에 전달 -->
	
	<h2>분기처리</h2>
<%
	// url http://localhost:9090/web/basic.jsp?type=abc..
	String type = request.getParameter("type");
	System.out.println("type = " + type);			

	if("abc".equals(type)){
%>
	<p>abcdefg</p>
<%
	}	else if("가나다".equals(type)){
%>	
	<p>가나다라마바사</p>
<% 
	}	else if("123".equals(type)){
%>
	<p>1234567</p>
<%
	}	else {
%>
	<p>타입이 지정되지 않았습니다.</p>
<%
	}
%>
	<hr>
	<h2>반복처리</h2>
<%
	List<String> fruits = Arrays.asList("사과", "바나나", "아보카도", "키위");
%>
	<ul>
<%-- 	<li>사과</li>
		<li>바나나</li>
		<li>아보카도</li>
		<li>키위</li> --%>
<% 
	for(String fruit : fruits){
%> 		
		<li><%= fruit %></li> 
<% 
	} 
%>
	</ul>
	<hr />
	<h2>@실습문제</h2>
	<ul>
<% 
	if("abc".equals(type) || "가나다".equals(type)){
		String values = request.getParameter("value");
		String[] valuesArr = values.split(",");
		if(values != null){
			for(String value : valuesArr){
%>
			<li><%= value %></li>
<%	
			}
		}
	}
%> 
	</ul>
	<hr />	

</body>
</html>












