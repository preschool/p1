<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ѧ��ԤԼ</title>
</head>

<body>
<center><h1>ѧ��ԤԼ</h1>

<br/><br/>
<%
String tname;
Object obj2=session.getAttribute("tname");
	 tname=(String)obj2;
%>
<p>&nbsp;  </p>       
�鿴<%=tname %>��ʦԤԼ�������
<form action="/" method="get" target="_blank">
��
<select name="weeks">
  <option value=1>1</option>
  <option value=2>2</option>
  <option value=3>3</option>
  <option value=4>4</option>
  <option value=5>5</option>
  <option value=6>6</option>
  <option value=7>7</option>
  <option value=8>8</option>
  <option value=9>9</option>
  <option value=10>10</option>
  <option value=11>11</option>
  <option value=12>12</option>
  <option value=13>13</option>
  <option value=14>14</option>
  <option value=15>15</option>
  <option value=16>16</option>
  <option value=17>17</option>
  <option value=18>18</option>

</select>
��
<input type="submit" value="�鿴" />
</form>
</center>
<body>

	<div align="center">
	<form name="input" action="Makeapt" method="post">
	  <table width="96%" height="167" border="1">
		  <tbody>
		  <tr bgcolor="#005CA5">
		  <th><font style="color: #FFF">����һ</font></th>
		  <th><font style="color: #FFF">���ڶ�</font></th>
		  <th><font style="color: #FFF">������</font></th>
		  <th><font style="color: #FFF">������</font></th>
		  <th><font style="color: #FFF">������</font></th>
		  <th><font style="color: #FFF">������</font></th>
		  <th><font style="color: #FFF">������</font></th>
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
   <td align="center"  width="50">��<%=i+1 %>��</td>
 <%
    	}
 else{
	 %>
	 <td align="center" align="center" width="50" ><input type="submit" value="ԤԼ" /></td>
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
