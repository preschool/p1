<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.sql.*,com.sina.sae.util.SaeUserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>make a appointment successfully</title>
</head>
<center>

	<h1>ԤԼ�ɹ�</h1>
	<br />
	<br />
	<br />
	<br />

	<%
String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_pschool";
//ʹ�ôӿ������
//ͨ��SaeUserInfo�ṩ�ľ�̬������ȡӦ�õ�access_key��secret_key
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
	 String sql = "UPDATE app_list SET stu_num=stu_num+1 WHERE id="+appID;
	 PreparedStatement ps = conn.prepareStatement(sql); 
      ps.execute();
      String sql2 = "insert into stu_app(sid,sname,appid) values(?,?,"+appID+")";
      PreparedStatement ps2 = conn.prepareStatement(sql2);  
		 ps2.setString(1, studentid);
		 ps2.setString(2, sname);
		 ps2.execute();
      conn.close();
	} } catch (SQLException e) {  
          e.printStackTrace();  
      }
%>
	<a href="searchtech.jsp">����</a>
</center>
</html>