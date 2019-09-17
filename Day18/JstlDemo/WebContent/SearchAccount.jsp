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
select * from accounts where accountno=?
<sql:param value="${param.accountNo}"></sql:param>
</sql:query>


<jstl:set var="flag" value="0"/>

<jstl:forEach var="a" items="${searchquery.rows}">
Account No:
<jstl:out value="${a.accountNo}"/><br/><br/>
First Name:
<jstl:out value="${a.firstName}"/><br/><br/>
Second Name:
<jstl:out value="${a.lastName}"/><br/><br/>
City:
<jstl:out value="${a.city}"/><br/><br/>
State:
<jstl:out value="${a.state}"/><br/><br/>
Amount:
<jstl:out value="${a.amount}"/><br/><br/>
CheqFacil:
<jstl:out value="${a.cheqfacil}"/><br/><br/>
AccountType:
<jstl:out value="${a.accountType}"/><br/><br/>
<jstl:set var="flag" value="1"/>
</jstl:forEach>
<jstl:if test="${flag==0}">
<jstl:out value="Record Not Found"/>
</jstl:if>

</body>
</html>