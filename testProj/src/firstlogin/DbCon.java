package firstlogin;
import java.sql.*;

public class DbCon {
	private String driverName = "com.mysql.cj.jdbc.Driver";
	private String connectionUrl = "jdbc:mysql://localhost:3306/tcsdb?serverTimezone=IST";
	private String userId = "root";
	private String password = "";
	
	public Connection getConnection() { //method to establish and db connection
		Connection con = null;
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(connectionUrl,userId,password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return(con);
	}
	
	public String checkUser(User u) {  //if check if username is available
		Connection con = this.getConnection();
		if(null==con) {  //hiding the complex errors
			return("Connection refused");
		}
		int l = 0; //for returned rows count
		try {
			PreparedStatement stq1 = con.prepareStatement("select * from users where username=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			stq1.setString(1, u.getName());
			
			ResultSet rs = stq1.executeQuery();
			if(rs.last()) {   //moves to last
				l=rs.getRow();  //gets id of last
				rs.beforeFirst();  //moves to starting.. for future iteration needs
			}
			con.close();
		} catch (SQLException e1) {
			return(e1.toString()); //returning exception as text
		}
		if(l==0) {
			return("True");  //l==0 only if not user exists.. logic is satisfied
		}
		else {
			return("False");  //l==1 only if users exist.. logic failed
		}
	}
	
	public String checkLogin(User u) {  //to get login details with database
		Connection con = this.getConnection();
		if(null==con) {
			return("Connection refused");  //hiding the complex errors
		}
		int l = 0;
		try {
			
			PreparedStatement stq1 = con.prepareStatement("select * from users where username=? and password=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			stq1.setString(1, u.getName());
			stq1.setString(2, u.getPassword());
			
			ResultSet rs = stq1.executeQuery();
			if(rs.last()) {  //moves to last
				l=rs.getRow();  //gets id of last
				rs.beforeFirst();  //moves to starting.. for future iteration needs
			}
			con.close();
		} catch (SQLException e1) {
			return(e1.toString());  //returning exception as text
		}
		if(l==1) {
			return("True");  //l==1 if 1 user match.. logic is satisfied
		}
		else {
			return("False");  //l== nnly if 0 user match.. logic is satisfied
		}
	}
	
	public String addUser(User u) { //for adding new user
		Connection con = this.getConnection();
		if(null==con) {
			return("Connection refused");  //hiding the complex errors
		}
		int l=0;
		try {
			PreparedStatement stq1 = con.prepareStatement("insert into users values(?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			stq1.setString(1, u.getName());
			stq1.setString(2, u.getPassword());
			int rs = stq1.executeUpdate();
			l=rs;
			con.close();
		} catch (SQLException e1) {
			return(e1.toString());  //returning exception as text
		}
		String ls = l+"";
		return (ls);  //returns updated rows result
		
	}
}
