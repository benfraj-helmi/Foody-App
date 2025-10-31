import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import firsttry.DBConnection;

import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            // Check if the login is for the admin first
            if ("admin@admin.com".equals(email) && "azerty123".equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", email);
                response.sendRedirect("admin.jsp");
                return; // Stop further processing
            }

            // If not admin, check the database for the user
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", email);
                response.sendRedirect("index.jsp"); // Redirect to a general user page
            } else {
                // No such user exists in the database
                request.setAttribute("message", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Database connection problem", e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

