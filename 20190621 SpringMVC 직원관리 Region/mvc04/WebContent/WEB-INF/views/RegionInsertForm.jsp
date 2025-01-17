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
<title>EmployeeInsertForm.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<link rel="stylesheet" href="<%=cp %>/css/jquery-ui.css">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			if( $("#name").val()== "" )
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return; 	
			}
				
			$("#regionForm").submit();
		});
	});
	
</script>
</head>
<body>

<!-----------------------------------------------------------------------
	#. RegionInsertForm.jsp
	- 지역 데이터 입력 페이지
	- 관리자가 접근하는 지역 데이터 입력 페이지
 ------------------------------------------------------------------------>

<div>

	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		
		<h1>[ 지역 관리 ]</h1>
		<hr>
		
		<form action="regioninsert.action" method="post" id="regionForm">
			<table>
				<tr>
					<th>지역</th>
					<td>
						<input type="text" id="name" name="name" placeholder="지역이름">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br><br>
					<button type="button" class="btn" id="submitBtn" style="width: 40%">지역 추가</button>
					<button type="button" class="btn" id="listBtn" style="width: 40%"
					onclick="location.href='regionlist.action'">지역 리스트</button>
					<br><br>
					<span id="err" style="color: red; font-weight: bold; display: none;"></span>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
	
</div>
</body>
</html>