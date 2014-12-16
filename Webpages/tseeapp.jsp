<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.sql.*,com.sina.sae.util.SaeUserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>学生预约</title>
</head>
<%
int y,m,d,h,mi,s;   
Calendar cal=Calendar.getInstance();   
y=cal.get(Calendar.YEAR);   
m=cal.get(Calendar.MONTH);   
d=cal.get(Calendar.DATE);   
h=cal.get(Calendar.HOUR_OF_DAY);   
mi=cal.get(Calendar.MINUTE);   
s=cal.get(Calendar.SECOND);   
int w = cal.get(Calendar.DAY_OF_WEEK)-1;
String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
if (w < 0)
    w = 0;
out.println("<p  align=\"right\">"+y+"年"+m+"月"+d+"日"+h+"时"+mi+"分    "+weekDays[w]+"</p>");    
%>
<body>
	<center>
		<h1>查看预约</h1>

		<form name="form1" action="tseeapp.jsp" method="post">
			选择周次 <select name="week">
				<option value="xq">本周</option>
				<option value="nxq">下周</option>
			</select> <input type="submit" name="post" value="查看" />
		</form>

		<%
String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_pschool";
//使用从库读数据
// 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
String Username=SaeUserInfo.getAccessKey();
String Password=SaeUserInfo.getSecretKey();
Object obj2=session.getAttribute("tname");
String tname=(String)obj2;

%>



	</center>
<body>

	<div align="center">
		<table width="96%" height="167" border="1">
			<tbody>
				<tr bgcolor="#005CA5">
					<th><font style="color: #FFF">星期一</font></th>
					<th><font style="color: #FFF">星期二</font></th>
					<th><font style="color: #FFF">星期三</font></th>
					<th><font style="color: #FFF">星期四</font></th>
					<th><font style="color: #FFF">星期五</font></th>
					<th><font style="color: #FFF">星期六</font></th>
					<th><font style="color: #FFF">星期天</font></th>
				</tr>

				<tr style="background-color: #FFF" height=400>
					<% 
try {
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection conn =DriverManager.getConnection(URL,Username,Password);
	 int i;
	if(tname!=null){
		PreparedStatement ps,ps2;
		String[] appArray;
	  for(i=1;i<8;i++)
	 {
		  appArray=null;
		  
%>

					<td valign="top" align="center" width="150">
						<%
String week=request.getParameter("week");
String sql;
if(week==null)
sql= "SELECT xq"+i+" FROM tch_list WHERE name = ?";
else  sql= "SELECT "+week+i+" FROM tch_list WHERE name = ?";

        ps = conn.prepareStatement(sql);  
        ps.setString(1,tname);
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {    
        	String app=rs.getString(1);
        	System.out.print(app);
        	if(app!=null){
        	 appArray=app.split(",");
        	  for(int j=0;j<appArray.length;j++)
        	  {
        	  // System.out.println(appArray[i]);
        	   String sql2= "SELECT time,exist,stu_num FROM app_list WHERE id = "+appArray[j];
        	   ps2 = conn.prepareStatement(sql2);  
               ResultSet rs2 = ps2.executeQuery();
               if(rs2.next())
               {
            	   String time=rs2.getString(1);
            	   int exist=rs2.getInt(2);
            	   int stunum=rs2.getInt(3);
             	  if(exist==0){
            	   out.print(time+"<br/>");
            	   out.print(stunum+"人预约");
            	   out.print("<br/>");
            	   out.print("<form  action=\"showapp2.jsp?appID="+appArray[j]+"\" method=\"post\">");
            	  // System.out.print("<form  action=\"showapp.jsp?appID="+appArray[j]+" method=\"post\">");
            	   out.print(" <input type=submit value=\"查看\"> ");
            	   out.print("</form>");
            	   out.print("<br/><br/>");
             	  }
               }
        	  }
        }
        }
 %>
					</td>
					<%
	 }
	}
	conn.close();
} catch (SQLException e) {  
    e.printStackTrace();  
}
%>
				</tr>
			</tbody>
		</table>
		<%=tname %>老师预约发布情况 &nbsp; &nbsp; &nbsp;<a href="tch.jsp">返回</a>
	</div>
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
