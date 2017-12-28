<%@page import="kr.or.nextit.member.service.impl.MemberServiceImpl"%>
<%@page import="kr.or.nextit.member.service.MemberService"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	request.setCharacterEncoding("utf-8");

	String mem_id = request.getParameter("mem_id");

	boolean isError = false;	
	
	try{
		
		MemberService memberService = MemberServiceImpl.getInstance();
		
		int updCnt = memberService.deleteMember(mem_id);
		
		if(updCnt == 0){
			// 에러
			isError = true;
		}
		
	}catch(Exception e){
		// 에러
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
			alert("회원삭제에 실패하였습니다.");
			history.go(-1);
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("정상적으로 삭제 되었습니다.");
			location.href="memberList.jsp";
		</script>
		<%
	}
%>

</body>
</html>







