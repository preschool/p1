package action;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.SQLException;  
import java.sql.Statement;  
import java.sql.ResultSet; 
//import java.util.*;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
public class AddApp   extends ActionSupport {
	   private String starttime;
	   private String endtime;
	   private String address;
	   private String message;
<<<<<<< HEAD
	   private String day;
	   
	   public String getDay(){
		   return this.day;
	   }
	   public void setDay(String name){
		   this.day=name;
	   }
=======
       
>>>>>>> 3739629f02a16ae931f9384a2b10a337a339a6cb
	   public String getStarttime(){
		   return this.starttime;
	   }
	   public void setStarttime(String name){
		   this.starttime=name;
	   }
	   public String getEndtime() {
	      return endtime;
	   }

	   public void setEndtime(String sid) {
	      this.endtime = sid;
	   }

	   public String getAddress() {
		      return address;
		   }

		   public void setAddress(String pd) {
		      this.address = pd;
		   }
		   
		   public String getMessage() {
			      return message;
			   }

			   public void setMessage(String pd) {
			      this.message = pd;
			   }
<<<<<<< HEAD
			   
			   
		   public String execute() {
=======
		   public String execute() {
			      String ret = "none";
>>>>>>> 3739629f02a16ae931f9384a2b10a337a339a6cb
		   Connection conn = null;
			      try {
			    	  String URL="jdbc:mysql://localhost:3306/app";
				    	// 使用从库读数据
				    	  // 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
			    	  String Username="root";
<<<<<<< HEAD
			    	  String Password="0451";
				    	  Class.forName("com.mysql.jdbc.Driver").newInstance();
				    	  conn =DriverManager.getConnection(URL,Username,Password);
		
			         String sql = "insert into app_list(tname,time,address,msg,stu_num) "
			         		+ "values('?','?','?','?',0)";
			         String time= starttime+"---"+endtime;
			         PreparedStatement ps = conn.prepareStatement(sql);
			         ps.setString(1, "孔丘");
			         //ps.setString(2, passwd);
			         ps.setString(2, time);
			         ps.setString(3, address);
			         ps.setString(4, message);
			         //System.out.println(teacherid);
			         //System.out.println(passwd);
			        ps.execute();
			        String sql2 = "select LAST_INSERT_ID()";
			        PreparedStatement ps2 = conn.prepareStatement(sql2);
			        ResultSet rs = ps2.executeQuery();
			        if (rs.next()) {
			        	 
				         int id = rs.getInt(1);
				       
				            ret = SUCCESS;
				         }
=======
			    	  String Password="";
				    	  Class.forName("com.mysql.jdbc.Driver").newInstance();
				    	  conn =DriverManager.getConnection(URL,Username,Password);
		
			         String sql = "insert into app_list values('?','?','?','?')";
			         String time= starttime+"---"+endtime;
			         PreparedStatement ps = conn.prepareStatement(sql);
			         //ps.setString(1, teacherid);
			         //ps.setString(2, passwd);
			         ps.setString(3, time);
			         ps.setString(4, address);
			         ps.setString(5, message);
			         //System.out.println(teacherid);
			         //System.out.println(passwd);
			        ps.execute();
	
>>>>>>> 3739629f02a16ae931f9384a2b10a337a339a6cb
				            //HttpServletRequest request = ServletActionContext.getRequest();  
				            //request.getSession().setAttribute("sname",sname);
			         if (conn != null) {
				            try {
				               conn.close();
				            } catch (SQLException e) {  
			                    e.printStackTrace();  
			                    return ERROR;
				            }
			         }
			      }catch (Exception e) {
			    	   e.printStackTrace();  
	                    return ERROR;
				      }
			      
			      return ret;
}
}
