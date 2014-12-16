<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ page
	import="java.util.*,java.sql.*,javax.servlet.http.HttpServletRequest,com.sina.sae.util.SaeUserInfo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查看预约</title>

</head>

<body>
	<p align="right">
		<a href="stu.jsp">回首页</a>&nbsp;&nbsp;<a href="javascript :;"
			onClick="javascript :history.back(-1);">返回</a>
	</p>
	<center>
		<h1>查看预约</h1>





		<%
String appID=request.getParameter("appID");
//System.out.println(appID);
//if(session.getAttribute("appID")!=)
session.setAttribute("appID",appID); 
String sname =(String)session.getAttribute("sname");
String studentid=(String)session.getAttribute("studentid");
String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_pschool";
//使用从库读数据
//通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
String Username=SaeUserInfo.getAccessKey();
String Password=SaeUserInfo.getSecretKey();
try {
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection conn =DriverManager.getConnection(URL,Username,Password);
	 if(appID!=null){
		 PreparedStatement ps5;
		 String sql5= "SELECT * FROM stu_app WHERE sid =? and  appid="+appID;
		 ps5 = conn.prepareStatement(sql5);  
		 ps5.setString(1, studentid);
		   ResultSet rs5 = ps5.executeQuery();
	        if(rs5.next())
	        {
%>
		<p style="color: Red;">您已预约此项</p>
		<form name="form1" action="sdel.jsp" method="post">
			<input type="submit" value="取消预约" />
		</form>
		<% 
	        }
	        else {
	        	%>
		<form name="form0" action="mkaptsuc.jsp" method="post">
			<input type="submit" value="预约" />
		</form>
		<%
	        }

			PreparedStatement ps;
			 String sql= "SELECT * FROM app_list WHERE id = "+appID;
			// System.out.println(appID);
		        ps = conn.prepareStatement(sql);  
		        ResultSet rs = ps.executeQuery();
		        if(rs.next())
		        {
		        	String tname=rs.getString(1);
		        	String time=rs.getString(2);
		        	String address=rs.getString(3);
		        	String msg=rs.getString(4);
		        	int num=rs.getInt(5);
		        	out.print("<table border=\"1\" width=\"66%\"> <tr>");
		      
		        	out.print("<td width=\"100\">预约教师：       "+tname+"</td>");
		        	out.print("<td width=\"100\">已预约人数：      "+num+"</td>");
		        	out.print("</tr>");
		        	out.print("<tr>");
		        	out.print("<td width=\"*\">时间：      "+time+"</td>");
		        	
		        	out.print("<td width=\"*\">地点："+address+"</td>");
		        	out.print("</tr>");
		        	out.print("<br/>");
		        	out.print("<tr height=\"100\"><td valign=\"top\"  colspan=\"2\">"+msg+"</td></tr>");
		        	out.print("<tr><td colspan=\"2\" align=\"center\">填写留言<form name=\"form1\" action=\"Livemsg\" method=\"post\"><p><textarea name=\"message\" cols=\"25\" rows=\"10\">留言：</textarea></p><br/><input type=\"submit\" value=\"提交\" /></form></td></tr></table>");
		        	out.flush();
		        }
	 }
	 conn.close();
} catch (SQLException e) {  
    e.printStackTrace();  
}
//HttpServletRequest request2 = ServletActionContext.getRequest();
//Object obj2=request2.getSession().getAttribute("appID");
%>

	</center>
</body>
</html>
