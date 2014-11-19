<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查看预约</title>
</head>

<body>
<center><h1>查看预约</h1>

<br/><br/>
<%
String tname;
Object obj2=session.getAttribute("tname");
	 tname=(String)obj2;
%>
<p>&nbsp;  </p>       


</center>
<body>

	<div align="center">
	<form name="input" action="Makeapt" method="post">
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
		  
<% int rows = 9;  
   int cols = 7; 
   int count = 0;
   int numb=100;
  Object obj=session.getAttribute("numb");
  if(obj!=null)
	  numb=((Integer)obj).intValue();
  System.out.println(numb);
   for(int i = 0; i < rows; i++ ){
 %>
	<tr style="background-color: #FFF">
<%
    for(int j = 0; j < cols; j++ ){
    	count++;
    	if(count!=numb){
 %>
   <td align="center"  width="50">第<%=i+1 %>节</td>
 <%
    	}
 else{
	 %>
	 <td align="center" align="center" width="50" ><input type="submit" value="预约" /></td>
	 <% 
    }
    }
%>
</tr>
<% 
   }
 %> 
</tbody>
</table>
</form>
</div>
</body>
</html>
