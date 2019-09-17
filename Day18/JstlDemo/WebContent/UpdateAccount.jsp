<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
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
		url="jdbc:mysql://localhost:3306/bank"
		user="root"
		password="root"
/>

<sql:query var="searchquery" dataSource="${conn}">
select city,state from accounts where accountno=?
<sql:param value="${param.accountNo}"></sql:param>
</sql:query>

<jstl:set var="flag" value="0"/>
<jstl:forEach var="a" items="${searchquery.rows}">
City:
<jstl:out value="${a.city}"/><br/><br/>
State:
<jstl:out value="${a.state}"/><br/><br/>
<jstl:set var="flag" value="1"/>
</jstl:forEach>

<jstl:if test="${flag==0}">
<jstl:out value="Record Not Found"/>
</jstl:if>
<jstl:if test="${flag==1}">
<sql:update var="updatequery" dataSource="${conn}">
Update accounts set city=?, state=? where accountNo=?
<sql:param value="${param.city}"/>
<sql:param value="${param.state}"/>
<sql:param value="${param.accountNo}"/>
</sql:update>

<jstl:out value="Account updated"/>
</jstl:if>


</body>
</html>