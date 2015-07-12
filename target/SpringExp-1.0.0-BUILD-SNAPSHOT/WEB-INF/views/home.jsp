<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<%
int a=10;
String name="Devendra Kumar";
%>
<P>  The time on the server is ${serverTime}. </P>
<c:set var="name"  value="Devendra Kumar"></c:set>
<div> <span>My Name By Jstl Tag lib </span><c:out value="${name}" ></c:out></div>

<c:set var="now" value="<%=new Date() %>"></c:set>
<div><h1>The Current Date is :</h1><fmt:formatDate value="${now}" type="date"/></div>
<div><h1>The Current Time is :</h1><fmt:formatDate value="${now}" type="time"/></div>
<h1>The Use of JSTL sql tag</h1>

<c:set var="ipadd" value="<%=name %>"></c:set>

The Jstl name from properties file<fmt:message key="jstl.name" ></fmt:message>

<div><h1>The value from controller class--</h1><c:out value="${nm}"></c:out></div>

<h1>The use of jstl ForEach</h1>

<c:if test="${not empty list}" >
<c:forEach var="lstvar" items="${list}">

<c:out value="${lstvar}"></c:out>
</c:forEach>
</c:if>






<h3>The use of jstl Sql tag</h3>

<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/myspringdb" var="localdbSrc" user="root" password="root" />
<sql:query var="result" dataSource="${localdbSrc}" sql="select * from emp"></sql:query>
<table style="width: 100%;border: 2px">
<tr><th>Id</th><th>Emp Name</th><th>Emp class</th><th>Emp address</th></tr>
<c:forEach var="row" items="${result.rows}" >
<tr>
<td><c:out value="row.empId"></c:out> </td>
<td><c:out value="row.empName"></c:out> </td>
<td><c:out value="row.empclass"></c:out> </td>
<td><c:out value="row.empadd"></c:out> </td>
</tr>
</c:forEach>
</table>




<%-- <sql:setDataSource dataSource="jdbc/corejavaDS"/>
<sql:query var="employee" sql="select * from employee"></sql:query>
<table border="1" style="text-align: center;" >
<c:forEach var="employee" items="${employee.row}" ></c:forEach>
<tr>
<td><c:out value="${employee.empid}"></c:out></td>
<td><c:out value="${employee.empname}"></c:out></td>
<td><c:out value="${employee.empclass}"></c:out></td>
<td><c:out value="${employee.empadd}"></c:out></td>

</tr>
</table> --%>

<a href="/springValidate/user1">Go to User page...</a>


</body>
</html>
