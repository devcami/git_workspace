<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp" %>
		<h1>main1</h1>
		<p><%= name %>님, 반갑습니다.</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate deleniti inventore magni quas debitis maiores dolore officiis non voluptas dolores quam dolorum nemo hic in natus architecto consequatur at itaque!</p>
		
		<script>
		const title = document.querySelector("header h1").innerHTML;
		alert(title);
		</script>
<%@ include file="/jsp/footer.jsp" %>
