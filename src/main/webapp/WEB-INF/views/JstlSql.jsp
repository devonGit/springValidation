<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<sql:setDataSource driver="com.mysql.jdbc.Driver"
				   url="jdbc:mysql://localhost:3306/myspringdb"
				   var="msqlDS" user="root" password="root" />

<sql:transaction dataSource="${msqlDS}">
<%-- <sql:update>
insert into empjstl (empName,empclass,empadd) values("Manjeet", "B.tech","Mahendra Garh")
</sql:update> --%>

<sql:update  sql="UPDATE empjstl SET empname ='Deva kumars' WHERE empid =5" var="result"/>
<sql:query var="res" sql="select * from empjstl" ></sql:query>	
</sql:transaction>

<%-- 
<table style="border: 2px solid red" width="100%">
<c:forEach var="row" items="${res.rows}">
<c:forEach var="col" items="${row }" >
<tr><td align="right"><b><c:out value="${col.key}"></c:out></b> </td>
<td><c:out value="${col.value}"></c:out></td>
</tr>
</c:forEach>

</c:forEach>
</table>
 --%>
 <div style="border: 2px groove red;">
 <table style="border: 4px groove green ;width: 80%; ">
  <tr style="font-size: 2em ;color: red;"> <td><b>Id</b></td><td>Name</td><td>Class</td><td>Address</td></tr>
 <c:forEach var="row" items="${res.rows}">
 
 <tr>
 <td style="border: 2px inset red ;"><c:out value="${row.empid }"></c:out></td>
  <td><c:out value="${row.empname }"></c:out></td>
   <td><c:out value="${row.empclass}"></c:out></td>
    <td><c:out value="${row.empadd}"></c:out></td>
 </tr>
 
 
 </c:forEach>
 
 </table>
 </div>
 
 <div style="border: inherit;" >
 
 <sql:query var="count"  dataSource="${msqlDS}" >
 update empjstl set empname =? where empid='4'
 
 <sql:param value="Dev Kumar" />
 <sql:param value="4" />
 </sql:query>
 
 </div>
 
</body>
</html>