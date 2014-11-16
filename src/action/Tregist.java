package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

public class Tregist extends ActionSupport{
	  private String teacherid;
	   private String passwd;
	   private String tname;
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
			         ps.setString(1, teacherid);
			         ResultSet rs = ps.executeQuery();
			         if (rs.next()) {
			        	 String sql2 = "insert into tch_list(id,name,password) values('?','?','?')";
			        	 PreparedStatement ps2 = conn.prepareStatement(sql2);
			        	 ps.setString(1, teacherid);
			        	 ps.setString(2, tname);
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
