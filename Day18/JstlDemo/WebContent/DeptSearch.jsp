<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="conn"
driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/sqlpractise" user="root"
		password="root"
/>


<sql:query var="deptquery" dataSource="${conn}">
Select * from department where deptno=?
<sql:param value="${param.deptno}" />
</sql:query>


<c:set var="flag" value="0"/>
<c:forEach var="e" items="${deptquery.rows}">

Dept No:
<c:out value="${e.deptno}" /><br/>
D Name:
<c:out value="${e.dname}" /><br/>
Loc:
<c:out value="${e.loc}" /><br/>
Head:
<c:out value="${e.head}" /><br/>

<c:set var="flag" value="1"></c:set>
</c:forEach>

<c:if test="${flag==0}">
		<c:out value="Dept Not Found"></c:out>
	</c:if>
	
</body>
</html>