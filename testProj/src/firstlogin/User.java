package firstlogin;

public class User {  //stores encrypted data
	private String name=null;
	private String password=null;
	
	User(String n, String p){
		this.name = n;
		this.password = p;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
}
