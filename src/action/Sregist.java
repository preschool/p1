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
public class Sregist extends ActionSupport{
	 private String studentid;
	   private String passwd;
	   private String sname;
     
	   public String getSname(){
		   return this.sname;
	   }
	   public void setSname(String sname){
		   this.sname=sname;
	   }
	   public String getStudentid() {
	      return studentid;
	   }

	   public void setStudentid(String sid) {
	      this.studentid = sid;
	   }

	   public String getPasswd() {
		      return passwd;
		   }

		   public void setPasswd(String pd) {
		      this.passwd = pd;
		   }
		   
		   public String execute() {
			      String ret = "error";
		   Connection conn = null;
			      try {
			    	  String URL="jdbc:mysql://localhost:3306/app";
				    	// 使用从库读数据
				    	  // 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
			    	  String Username="root";
			    	  String Password="0451";
				    	  Class.forName("com.mysql.jdbc.Driver").newInstance();
				    	  conn =DriverManager.getConnection(URL,Username,Password);
		
			         String sql = "SELECT FROM tch_list WHERE id=?";
			         PreparedStatement ps = conn.prepareStatement(sql);
			         ps.setString(1, studentid);
			         ResultSet rs = ps.executeQuery();
			         if (rs.next()) {
			        	 String sql2 = "insert into tch_list(id,name,password) values('?','?','?')";
			        	 PreparedStatement ps2 = conn.prepareStatement(sql2);
			        	 ps.setString(1, studentid);
			        	 ps.setString(2, sname);
			        	 ps.setString(3, passwd);
				         ps.execute();
				            ret = SUCCESS;
				            //HttpServletRequest request = ServletActionContext.getRequest();  
				            //request.getSession().setAttribute("sname",sname);
				         }
			         else{
			        	 ret = "exist";
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
