package shoppingApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLogin extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String userEmail = req.getParameter("useremail");
        String userPassword = req.getParameter("userpassword"); // match form

        System.out.println(userEmail);
        System.out.println(userPassword);

        try (Connection con = DbConnection.getConnection()) { // Auto-close connection
            if (con == null) {
                System.out.println("Connection is null");
                res.sendRedirect("LoginFailed.jsp");
                return;
            }

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM userDetails WHERE userEmail = ? AND userPassword = ?");
            ps.setString(1, userEmail);
            ps.setString(2, userPassword);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = req.getSession();
                
                session.setAttribute("userId", rs.getInt("userId"));
                session.setAttribute("userEmail", rs.getString("userEmail"));
                session.setAttribute("userName", rs.getString("userName")); // make sure your table has name column
                
                res.sendRedirect("Home.jsp");
            } else {
                req.setAttribute("error", "Invalid credentials");
                req.getRequestDispatcher("Login.jsp").forward(req, res); // keep error message
            }


        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("LoginFailed.jsp");
        }
    }
}
