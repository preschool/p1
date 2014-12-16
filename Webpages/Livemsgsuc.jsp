<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>make a appointment successfully</title>
</head>
<center>

	<h1>留言成功</h1>
	<br />
	<br />
	<br />
	<br />
	<%
Object obj2=session.getAttribute("tname");
String appID =(String)session.getAttribute("appID");
if(obj2==null){

     out.print("<a href=\"showapp.jsp?appID="+appID+"\">返回</a>");

}else {

out.print("<a href=\"showapp2.jsp?appID="+appID+"\">返回</a>");
}
%>
</center>
</html>