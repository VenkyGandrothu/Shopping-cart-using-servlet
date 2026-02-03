package shoppingApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.xdevapi.Result;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/registration")
public class UserRegistration extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		String userName = req.getParameter("username");
		String userEmail = req.getParameter("useremail");
		String userPassword = req.getParameter("userpassword");
		
		try {
			
		 	Connection con =DbConnection.getConnection();
		 	PreparedStatement ps = con.prepareStatement("INSERT INTO userDetails(userName, userEmail, userPassword) VALUES (?,?,?)");
		 	ps.setString(1, userName);
		 	ps.setString(2, userEmail);
		 	ps.setString(3, userPassword);
		 	
		 	ps.execute();
		 	
		 	res.sendRedirect("Login.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
