<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,com.sina.sae.util.SaeUserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_pschool";
// 使用从库读数据
  // 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
String Username=SaeUserInfo.getAccessKey();

String Password=SaeUserInfo.getSecretKey();

int stunum,week=100;
int rows = 9;  
int cols = 7; 
int count = 0;
try {
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection conn =DriverManager.getConnection(URL,Username,Password);
    String sql= "SELECT week1, formid FROM tch_list WHERE id='0001'";
    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
    	        String sname = rs.getString(1);
    	        //System.out.println(sname);
    	        if(sname!=null)
    	         week=Integer.parseInt(sname);
    	         stunum=rs.getInt(2);
    	         System.out.println(stunum);
        
%>
<center>
	<h1>学生预约情况</h1>

	<br />
	<br />

	<p>&nbsp;</p>


</center>
<body>

	<div align="center">
		<form name="input" action="Showstu" method="post">
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

					<% 
   for(int i = 0; i < rows; i++ ){
 %>
					<tr style="background-color: #FFF">
						<%
    for(int j = 0; j < cols; j++ ){
    	count++;
    	if(count!=week){
 %>
						<td align="center" width="50">第<%=i+1 %>节
						</td>
						<%
    	}
 else{
	 %>
						<td align="center" width="50">已预约<%=stunum %>人&nbsp;<input
							type="submit" value="查看" /></td>
						<% 
    }
    }
%>
					</tr>
					<% 
   }
    }
    if (conn != null) {
        try {
           conn.close();
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
 }
 
 
}catch (Exception e) {
   e.printStackTrace();  
  }
 %>
				</tbody>
			</table>
		</form>
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