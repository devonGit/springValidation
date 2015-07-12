<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <form:form action="createUser" method="post" commandName='user'>
	   Enter User Name:<form:input  path="name"/>
	   <font color="red"> <form:errors path="name"></form:errors></font><br/>
	   Enter age :<form:input path="age"/>
	   <font color="red"><form:errors path="age"></form:errors></font><br/>
	   
	   <input type="submit">
  </form:form>
</body>
</html>