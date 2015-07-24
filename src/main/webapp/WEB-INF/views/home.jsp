<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
	<title>Home</title>
	<style type="text/css">
	.divBorder{
	border: 2px solid gray;
	
	}
	td{
	border: 2px solid green;
	text-align: center;
	}
	</style>
	
</head>
<body>
<h1>
	Hello world!  
</h1>
<%
int a=10;
String name="Devendra Kumar on jsp page";
request.setAttribute("nmJsp", name);
%>
<P>  The time on the server is ${serverTime}. </P>
<h1 style="text-align: center;color: navy;">The Use of Jstl Tags</h1>
	<div class="divBorder" > <label>The c:Set and C:out tags --</label>
	<c:set var="name"  value="Devendra Kumar"></c:set>
	<div> <span>My Name display by  Tag lib </span><c:out value="${name}" ></c:out></div>
	Name on jsp page scriptlet tags: <c:out value="${nmJsp}"></c:out>
	<p>The Value of a variable ----<c:out value="<%=a %>"></c:out></p>
	</div>
<br>
<div class="divBorder" style="border-color: yellow;">
<label>Jstl core Url c:redirection and  c:url </label><br>
<code>This tag Redirect the Url When you call this Page --</code>
<%-- <c:redirect url="http://www.tutorialspoint.com/jsp/jstl_core_redirect_tag.htm"></c:redirect> --%>
<br>
<a href="<c:url value="http://www.tutorialspoint.com/"/>">Tutorial Point</a>
</div>

<div class="divBorder" style="border-color :  green ;">
<c:set var="now" value="<%=new Date() %>"></c:set>
<div><label>The Current Date is :</label><fmt:formatDate value="${now}" type="date"/></div>
<div><label>The Current Time is :</label><fmt:formatDate value="${now}" type="time"/></div>
<p>The day of the year from date -<fmt:formatDate value="${now}" type="date" pattern="D"/> </p>
<p>The Date in numeric form date- <fmt:formatDate value="${now}" type="date" pattern="d"/></p>
<p>The Text day of the week form date- <fmt:formatDate value="${now}" type="date" pattern="E"/></p>
<p>The numeric day of the week from date -<fmt:formatDate value="${now}" type="date" pattern="F"/> </p>
<p>The Month in Numeric of the year from date -<fmt:formatDate value="${now}" type="date" pattern="M"/> </p>
<p>The Month in Char of the year from date -<fmt:formatDate value="${now}" type="date" pattern="MMM"/> </p>
<p>The week of the year from date -<fmt:formatDate value="${now}" type="date" pattern="w"/> </p>
<p>The Week of the month this year from date -<fmt:formatDate value="${now}" type="date" pattern="W"/> </p>

<c:remove var="now"/>
<p>The value of now after c:remove -<fmt:formatDate value="${now }"  type="date"  /></p>
</div>

<span>Use of Jstl format and out tags </span>
<div class="divBorder" style="border-color: navy;">
<label>The Jstl name from properties file --</label> <fmt:message key="jstl.name" ></fmt:message>
<div><label>The value from controller class--</label><c:out value="${nm}"></c:out></div>
<div>The Address From controller Class :<c:out value="${varAdd}"></c:out> </div>
</div>

<h1>The use of jstl ForEach</h1>
<div class="divBorder" style="border-color: green;">
<c:if test="${not empty list}" >
<c:forEach var="lstvar" items="${list}">
<%-- <div>The Add is :<c:out value="${varAdd}"></c:out> </div> --%>
<c:out value="${lstvar}"></c:out><br>
<li  >${lstvar}</li>
</c:forEach>
</c:if>

<span>The Looping in forEach...</span><br>
<c:forEach var="res" begin="1" end="5">
no. <c:out value="${res}"></c:out><p>
</c:forEach>

<div class="divBorder" style="border-top-color: red;">
<p>The Use of forEach</p>
<c:forEach var="res" items="${arstr}" >
<c:out value="${res}"></c:out>
</c:forEach>
<p>The Use of forTokens</p>
<c:forTokens items="${arstr}" delims="/" var="res">
<c:out value="${res}"></c:out>
</c:forTokens>

<br>
<c:forTokens items="dev/ram/Bhole Nath/Shiv" delims="/" var="res" >
<c:out value="${res }"></c:out>
</c:forTokens>
 </div>
 </div>

<div class="divBorder">
<h3>The use of jstl Sql tag</h3>

<sql:setDataSource driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/myspringdb" 
                   var="localdbSrc" user="root" password="root" />
<sql:query var="result" dataSource="${localdbSrc}" sql="select * from empjstl"></sql:query>
<table style="width: 50%;border: 5px groove red ;">
<tr style="border: 2px dashed ; "><th>Id</th><th>Emp Name</th><th>Emp class</th><th>Emp address</th></tr>
<c:forEach var="row" items="${result.rows}" >
<tr>
<td><c:out value="${row.empId}"></c:out> </td>
<td style="border-color:gray ; "><c:out value="${row.empName}"></c:out> </td>
<td><c:out value="${row.empclass}"></c:out> </td>
<td><c:out value="${row.empadd}"></c:out> </td>
</tr>
</c:forEach>
</table>

</div>





<div class="divBorder">

<fmt:setLocale value="en_IN"/>
<p>The Curruncy type is -<fmt:formatNumber value="478.087000"  minFractionDigits="3" type="currency"></fmt:formatNumber>
<p>The Curruncy type is -<fmt:formatNumber value="478.087000"  currencySymbol="Rs- " minFractionDigits="3" type="currency"></fmt:formatNumber>
<p>The Curruncy type is -<fmt:formatNumber value="478.087000"  minFractionDigits="3" type="currency"></fmt:formatNumber>

<fmt:setLocale value="hi_IN"/>

<fmt:formatNumber value="478.087000"  minFractionDigits="3" type="currency"></fmt:formatNumber>


</div>

<div class="divBorder">
<span>The use c:catch</span>
<c:catch var ="catchException">
   <% int x = 5/0;%>
</c:catch>

<c:if test = "${catchException != null}">
   <p>The exception is : ${catchException} 

   There is an exception: ${catchException.message}</p>
</c:if>
</div>

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
<br>
<a href="/springValidate/jstlQuery">Go to the JSTL Sql Example page</a>
<div align="center">
Footer contents
</div>
</body>
</html>
