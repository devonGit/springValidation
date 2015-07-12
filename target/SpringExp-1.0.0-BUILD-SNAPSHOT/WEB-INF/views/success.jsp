<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

.p1{

 font: italic;
 color: gray;
 font-size: 2em;
}
span{
color: red;

font-size: 3em;
 }

</style>

</head>
<body>

<div>
<div><span class="p1">Name is :</span><span> ${name }</span></div>
<div><span class="p1">Age is :</span> <span>${age }</span></div>

<a href="user1">Go to User Page</a>
</div>
</body>
</html>