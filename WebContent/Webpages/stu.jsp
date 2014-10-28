<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login successfully</title>
</head>
<body>
<center>
<h1 align="center">----------欢迎-----------</h1>
<br/><br/><br/><br/>
现在你可以查看教师可预约时间
<br/>
<form name="form1" action="Search" method="post">
教师姓名:     
<input type="text" name="tname" />
<br/>
<br/>
<input type="submit" value="搜索" />
</form>


<br/>
<br/><br/>
<br/><br/>
<br/><br/>

您以&nbsp;<s:property value="sname" />（学生）&nbsp;身份登陆系统

</center>
</body>
</html>