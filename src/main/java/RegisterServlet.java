import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import firsttry.DBConnection;

import java.sql.*;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO users (username, email, password, user_type) VALUES (?, ?, ?, 'client')");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("login.jsp"); // Redirect to login page after successful registration
            } else {
                request.setAttribute("errorMessage", "Registration Failed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Registration Error", e);
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}


