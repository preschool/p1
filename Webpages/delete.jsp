<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.sql.*,com.sina.sae.util.SaeUserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>delete a appointment successfully</title>
</head>
<center>

	<h1>删除发布成功</h1>
	<br />
	<br />
	<br />
	<br />

	<%
String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_pschool";
//使用从库读数据
//通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
String Username=SaeUserInfo.getAccessKey();
String Password=SaeUserInfo.getSecretKey();
String appID=(String)session.getAttribute("appID");
//System.out.print(appID);
try {
	if(appID!=null){
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection conn =DriverManager.getConnection(URL,Username,Password);
	 String sql = "UPDATE app_list SET exist=1 WHERE id="+appID;
	 PreparedStatement ps = conn.prepareStatement(sql); 
      ps.execute();
      conn.close();
	} } catch (SQLException e) {  
          e.printStackTrace();  
      }
%>
	<a href="tseeapp.jsp">继续</a>
</center>
</html>