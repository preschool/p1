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
public class Tlogin   extends ActionSupport {
	   private String teacherid;
	   private String passwd;
	   private String tname;
       private int formnum;
       public int getFormnum(){
    	   return this.formnum;
       }
       public void setFormnum(int num){
    	   this.formnum=num;
       }
	   public String getTname(){
		   return this.tname;
	   }
	   public void setTname(String name){
		   this.tname=name;
	   }
	   public String getTeacherid() {
	      return teacherid;
	   }

	   public void setTeacherid(String sid) {
	      this.teacherid = sid;
	   }

	   public String getPasswd() {
		      return passwd;
		   }

		   public void setPasswd(String pd) {
		      this.passwd = pd;
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
			    	  String Password="0451";
>>>>>>> 339fc110a57650931d8c0f93148857cb8f705c37
				    	  Class.forName("com.mysql.jdbc.Driver").newInstance();
				    	  conn =DriverManager.getConnection(URL,Username,Password);
		
			         String sql = "SELECT name,formid FROM tch_list WHERE";
			         sql+=" id = ? AND password = ?";
			         PreparedStatement ps = conn.prepareStatement(sql);
			         ps.setString(1, teacherid);
			         ps.setString(2, passwd);
			         System.out.println(teacherid);
			         System.out.println(passwd);
			         ResultSet rs = ps.executeQuery();
			         if (rs.next()) {
			        	 
				          tname = rs.getString(1);
				         formnum=rs.getInt(2);
				          System.out.println(tname);
				          System.out.println(formnum);
				            ret = SUCCESS;
				            //HttpServletRequest request = ServletActionContext.getRequest();  
				            //request.getSession().setAttribute("sname",sname);
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
			      
			      return ret;

}
}
