package firstlogin;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Crypter c = new Crypter();
		String username = c.enCrypt((String) request.getParameter("user"));
		String password = c.enCrypt((String) request.getParameter("pass"));
		User u = new User(username, password);
		DbCon con = new DbCon();
		String userc = con.checkLogin(u);
		if(userc.equals("True")) {
			session.setAttribute("logged", "yes");
			session.setAttribute("username", username);
			response.sendRedirect("begin.jsp");
		}
		else if(userc.equals("False")) {
			session.setAttribute("usernotexist", 1);
			response.sendRedirect("login.jsp");
		}
		else {
			session.setAttribute("error", userc);
			response.sendRedirect("login.jsp");
		}
	}

}
