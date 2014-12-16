<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>login successfully</title>

</head>
<img src="../pictures/logo.jpg" />
<body>
	<center>

		<h1 align="center">----------欢迎-----------</h1>
		<br />
		<br /> 现在您可以 <br /> <br /> <a href="startapp.html"><img
			src="../pictures/disch.gif" width="207" height="68" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
			href="tseeapp.jsp"><img src="../pictures/query.gif" width="213"
			height="68" border="0"></a><br /> <br />
		<br /> <br />
		<br /> <br />
		<br />
		<%
Object obj2=session.getAttribute("tname");
String tname=(String)obj2;
%>
		您以&nbsp;<%=tname %>（教师）&nbsp;身份登陆系统
	</center>
</body>
<div align="right">
  <span id=localtime></span>
<script type="text/javascript">
function showLocale(objD)
{
	var str,colorhead,colorfoot;
	var yy = objD.getYear();
	if(yy<1900) yy = yy+1900;
	var MM = objD.getMonth()+1;
	if(MM<10) MM = '0' + MM;
	var dd = objD.getDate();
	if(dd<10) dd = '0' + dd;
	var hh = objD.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = objD.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = objD.getSeconds();
	if(ss<10) ss = '0' + ss;
	var ww = objD.getDay();
	if  (ww==0)  ww="星期日";
	if  (ww==1)  ww="星期一";
	if  (ww==2)  ww="星期二";
	if  (ww==3)  ww="星期三";
	if  (ww==4)  ww="星期四";
	if  (ww==5)  ww="星期五";
	if  (ww==6)  ww="星期六";
	colorfoot="</font>"
	str =yy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "  " + ww + colorfoot;
	return(str);
}
function tick()
{
	var today;
	today = new Date();
	document.getElementById("localtime").innerHTML = showLocale(today);
	window.setTimeout("tick()", 1000);
}
tick();
</script>
</div>
</html>
