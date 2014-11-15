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
public class Search  extends ActionSupport {
	   private String tname;
	   private int numb;
	   
	   public String getTname(){
		   return this.tname;
	   }
	   public void setTname(String sname){
		   this.tname=sname;
	   }
	   
	   public int getNumb(){
		   return this.numb;
	   }
	   public void setNumb(int um)
	   {
		   this.numb=um;
	   }
	   
		   public String execute() {
			   
			      String ret = "none";
			      String week=null;
			      
		   Connection conn = null;
			      try {
			    	 numb=100;
			    	  String URL="jdbc:mysql://localhost:3306/app";
				    	// 使用从库读数据
				    	  // 通过SaeUserInfo提供的静态方法获取应用的access_key和secret_key
			    	  String Username="root";
			    	  String Password="";
				    	  Class.forName("com.mysql.jdbc.Driver").newInstance();
				    	  conn =DriverManager.getConnection(URL,Username,Password);
		
			         String sql = "SELECT id,week1 FROM tch_list WHERE";
			         sql+=" name = ?";
			         PreparedStatement ps = conn.prepareStatement(sql);
			         ps.setString(1, tname);
			         System.out.println(tname);
			         ResultSet rs = ps.executeQuery();
			         
			         if (rs.next()) {
			    
			        	  rs.getString(1);
				          week = rs.getString(2);
				         
				          System.out.println(week);
				            ret = SUCCESS;
				            if(week!=null)
				            numb=Integer.parseInt(week);
				            System.out.println(numb);
				          HttpServletRequest request = ServletActionContext.getRequest();  
				           request.getSession().setAttribute("numb",numb);
				           request.getSession().setAttribute("tname",tname);
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