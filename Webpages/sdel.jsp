<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.sql.*,com.sina.sae.util.SaeUserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cancel a appointment successfully</title>
</head>
<center>

	<h1>È¡ÏûÔ¤Ô¼³É¹¦</h1>
	<br />
	<br />
	<br />
	<br />

	<%
String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_pschool";
//Ê¹ÓÃ´Ó¿â¶ÁÊý¾Ý
//Í¨¹ýSaeUserInfoÌá¹©µÄ¾²Ì¬·½·¨»ñÈ¡Ó¦ÓÃµÄaccess_keyºÍsecret_key
String Username=SaeUserInfo.getAccessKey();
String Password=SaeUserInfo.getSecretKey();
String appID=(String)session.getAttribute("appID");
String sname =(String)session.getAttribute("sname");
String studentid=(String)session.getAttribute("studentid");
//System.out.print(appID);
try {
	if(appID!=null){
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection conn =DriverManager.getConnection(URL,Username,Password);
	 String sql = "UPDATE app_list SET stu_num=stu_num-1 WHERE id="+appID;
	 PreparedStatement ps = conn.prepareStatement(sql); 
      ps.execute();
      String sql2 = "delete from stu_app where sid=? and appid="+appID;
      PreparedStatement ps2 = conn.prepareStatement(sql2);  
		 ps2.setString(1, studentid);
		 ps2.execute();
      conn.close();
	} } catch (SQLException e) {  
          e.printStackTrace();  
      }
%>
	<a href="stu.jsp">¼ÌÐø</a>
</center>
</html>