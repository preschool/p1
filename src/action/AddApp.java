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
		   public String execute() {
			      String ret = "none";
		   Connection conn = null;
			      try {
			    	  String URL="jdbc:mysql://localhost:3306/app";
				    	// 使用从库读数据
				    	  // 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
			    	  String Username="root";
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
