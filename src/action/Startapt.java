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
public class Startapt   extends ActionSupport {
	   private String aptmsg;
	   private String tchnote;
	  
       public String getAptmsg(){
    	   return this.aptmsg;
       }
       public void setAptmsg(String num){
    	   this.aptmsg=num;
       }
	   public String getTchnote(){
		   return this.tchnote;
	   }
	   public void setTchnote(String name){
		   this.tchnote=name;
	   }

		   
		   public String execute() {
			      String ret = "none";
		   Connection conn = null;
			      try {
			    	  String URL="jdbc:mysql://localhost:3306/app";
				    	// 使用从库读数据
				    	  // 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
			    	  String Username="root";
<<<<<<< HEAD
			    	  String Password="";
=======
<<<<<<< HEAD
			    	  String Password="";
=======
			    	  String Password="0451";
>>>>>>> 339fc110a57650931d8c0f93148857cb8f705c37
>>>>>>> 9fa8330758d7e721824ee195bdd021d78e20aee7
				    	  Class.forName("com.mysql.jdbc.Driver").newInstance();
				    	  conn =DriverManager.getConnection(URL,Username,Password);
				    	  System.out.println(aptmsg);
				    	  System.out.println(tchnote);
			         String sql = "UPDATE tch_list SET week1=?,week2=? WHERE id='0001'";
			      
			         PreparedStatement ps = conn.prepareStatement(sql);
			         ps.setString(1, aptmsg);
			         ps.setString(2, tchnote);
			         ps.execute();
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
