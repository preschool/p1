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
public class Makeapt   extends ActionSupport {
	
	private String message;
	
	public void setMessage(String msg){
		this.message=msg;
	}
	public String getMessage(){
		return this.message;
	}
	
		   
		   public String execute() {
		   Connection conn = null;
			      try {
			    	  String URL="jdbc:mysql://localhost:3306/app";
				    	// 使用从库读数据
				    	  // 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
			    	  String Username="root";
<<<<<<< HEAD
			    	  String Password="";
=======
			    	  String Password="0451";
>>>>>>> 339fc110a57650931d8c0f93148857cb8f705c37
				    	  Class.forName("com.mysql.jdbc.Driver").newInstance();
				    	  conn =DriverManager.getConnection(URL,Username,Password);
			         String sql = "UPDATE tch_list SET formid=formid+1 WHERE id='0001'";
			      
			         PreparedStatement ps = conn.prepareStatement(sql);
			         ps.execute();
			         String sql2 = "SELECT week2 FROM tch_list WHERE id='0001'";
			         ps = conn.prepareStatement(sql2);
			         ResultSet rs = ps.executeQuery();
			         if (rs.next()) {
			        	 message= rs.getString(1);
			      //    HttpServletRequest request = ServletActionContext.getRequest();  
			        //  request.getSession().setAttribute("msg",msg);
			         }
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
			      
			      return SUCCESS;
			      }
		   }
