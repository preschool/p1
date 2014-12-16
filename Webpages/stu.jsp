<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page
	import="java.util.*,java.sql.*,javax.servlet.http.HttpServletRequest,com.sina.sae.util.SaeUserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login successfully</title>
</head>
<img src="../pictures/logo.jpg" />
<body>

	<%
String sname =(String)session.getAttribute("sname");
String studentid =(String)session.getAttribute("studentid");
%>
	<center>
		<h1>-----------------------欢迎------------------------</h1>
		<br />
		<br />
		<div align="center">
			<table width="66%" height="167" border="1">
				<tbody>
					<tr style="background-color: #FFF" height=250>
						<td valign="middle" align="CENTER">现在你可以查看教师可预约时间 <br />
						<br />
							<form name="form1" action="Search" method="post">
								教师姓名: <input type="text" name="tname" /> <br /> <br /> <input
									type="submit" value="搜索" />
							</form>
						</td>
						<td valign="top"><br /> 你已有的预约： <br /> <br /> <%
String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_pschool";
//使用从库读数据
//通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
String Username=SaeUserInfo.getAccessKey();
String Password=SaeUserInfo.getSecretKey();
try {
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection conn =DriverManager.getConnection(URL,Username,Password);
	if(sname!=null){
		PreparedStatement ps;
		 String sql= "SELECT appid FROM stu_app WHERE sid = ?";
	        ps = conn.prepareStatement(sql);  
	        ps.setString(1,studentid);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next())
	        {    
	        	int i=1;
	        	int appid=rs.getInt(i);
	        	i++;
	        	PreparedStatement ps2=conn.prepareStatement("SELECT  time,exist,xq,day from app_list WHERE id ="+appid); 
	        	ResultSet rs2 = ps2.executeQuery();
                if(rs2.next())
                {
                	String time=rs2.getString(1);
    					
                	  int exist=rs2.getInt(2);
                	  String xq=rs2.getString(3);
                	  String ch=rs2.getString(4);
                	  xq=xq.replace("xq","");
                	  if(ch!=null)
                		  out.print(ch);
                	  out.print("星期"+xq);
         
                	  out.print("  "+time+"  ");
                  	   if(exist==1)
                  		out.print("<font  color=\"red\">此预约被老师取消</font>");
                	 out.print("<form  action=\"showapp.jsp?appID="+appid+"\" method=\"post\">");
               	  // System.out.print("<form  action=\"showapp.jsp?appID="+appArray[j]+" method=\"post\">");
               	   out.print(" <input type=submit value=\"查看\"> ");
               	   out.print("</form>");
                }
	        }
	}
	conn.close();
	} catch (SQLException e) {  
	    e.printStackTrace();  
	}

%></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />
		<br /> 您以&nbsp;<%=sname %>（学生）&nbsp;身份登陆系统

	</center>
</body>
</html>