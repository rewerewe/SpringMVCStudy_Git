<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	* {line-height: 150%;}
	#customers td {text-align: center}
	#submitBtn
	{
		height: 150%;
		width: 240px;
		font-size: 18px;
		font-weight: bold;
		font-family: 맑은 고딕;
		color: #343;
	}
	#err
	{
		display: none;
		color: red;
		font-size: small; 
	}
</style>
<!-- memberList 에서 CSS 에 접근하려한다 해서 WEB-INF 파일에 CSS 파일을 넣어두면 서로 만날 수 없다. 
     그래서 현재 .jsp 파일이 있는 위치를 기준으로(cp) 에서 상위, 상위로 가서 CSS 파일로 접근하겠다는 의미
     request.getContextPath  -->
     
<%-- 
	request.getContextPath()는 프로젝트 path만 얻어온다.
	요청 : http://localhost/ZESTINE/test.jsp 경우
	→ /ZESTINE 경로만 얻는다

	request.getRequestURI()는 프로젝트와 파일 경로까지 얻어온다.
	요청 : http://localhost/ZESTINE/test.jsp 경우
	→ /ZESTINE/test.jsp 까지 얻어온다.
--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			$("#err").css("display", "none");
			
			if($("#name").val()=="" || $("#telephone").val()=="" )
			{
				$("#err").css("display","inline");
				return;
			}
			
			$("#memberForm").submit();
			
		});	
		
	});
	
</script>

</head>
<body>
<div>
	<h1>회원관리</h1>
	<hr>
</div>

<div>
	<form action="memberinsert.action" method="post" id="memberForm">
		이름 <input type="text" name="name" id="name" class="control" required="required"><br>
		전화 <input type="text" name="telephone" id="telephone" class="control" required="required"><br>
		<button type="button" id="submitBtn">회원추가</button>
		<span id="err"> 모든 항목을 입력해야 합니다.</span>
	</form>
	
	<br>
	<%-- EL 표현에 의한 인원수 출력 부분 --%>
	<p>전체 인원 수 : ${count} 
	
	<table id="customers" style="width: 500px;">
		<tr>
			<th>번호</th><th>이름</th><th>전화번호</th>
		</tr>
		
		<%-- EL, JSTL 표현에 의한 회원 명단 출력 부분 --%>
		<c:forEach var="member" items="${memberList}">
		<tr>
			<%-- MemberDTO 객체에 getMid(), getName(), getTelephone() 메소드를 호출하는 EL 표현 --%>
			<td>${member.mid }</td>
			<td>${member.name }</td>
			<td>${member.telephone }</td>
		</tr>
		</c:forEach>
		
	</table>
</div>

</body>
</html>