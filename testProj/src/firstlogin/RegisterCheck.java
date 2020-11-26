package firstlogin;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegisterCheck")
public class RegisterCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();  //creating session instance or getting old one if exists
		String username = (String) session.getAttribute("username");  //getting encrypted data
		String password = (String) session.getAttribute("password");
		User u = new User(username, password);  
		DbCon c = new DbCon(); 
		String userc = c.checkUser(u); //checking user validity
		if(userc.equals("True")) {  //returns true if logic is satisfied..
			String addc = c.addUser(u);  //tries adds user if user name available
			if(addc.equals("1")) {  //1 of logic is satisfied
				session.setAttribute("logged", "yes");
				session.setAttribute("username", username); //creates session with encypted
				response.sendRedirect("begin.jsp"); //goes to homepage
			}
			else {
				session.setAttribute("error", addc);  //if 1 is not returned.. then some exception is raised
				response.sendRedirect("register.jsp");
			}
		}
		else if(userc.equals("False")){  //false for incorrect logic
			session.setAttribute("userexist", 1);
			response.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("error", userc);
			response.sendRedirect("register.jsp");
		}
	}

}
