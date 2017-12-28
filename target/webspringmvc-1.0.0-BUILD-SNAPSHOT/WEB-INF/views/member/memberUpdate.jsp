<%@page import="kr.or.nextit.member.service.impl.MemberServiceImpl"%>
<%@page import="kr.or.nextit.member.service.MemberService"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="kr.or.nextit.member.model.Member" ></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<%
	boolean isError = false;

	try{
		
		MemberService memberService = MemberServiceImpl.getInstance();
		
		int updCnt = memberService.updateMember(member);

		if(updCnt == 0){
			isError = true;
		}		
		
	}catch(Exception e){
		e.printStackTrace();
		isError = true;
	}

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(isError){
		%>
		<script type="text/javascript">
			alert("회원정보 수정에 실패하였습니다.");
			history.go(-1);
		</script>
		<%
	}else{
		%>
		<script>
			alert("정상적으로 수정되었습니다.");
			location.href="memberView.jsp?mem_id=<%= member.getMem_id() %>"
		</script>		
		<%
	}
%>


</body>
</html>




