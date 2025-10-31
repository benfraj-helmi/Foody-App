import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import firsttry.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve food details from request
        String dishName = request.getParameter("dishName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        // Initialize database connection and statement
        try {
        	Connection conn = DBConnection.getConnection();
        
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO dishes (dish_name, description, price, image) VALUES (?, ?, ?, ?)"); 
            stmt.setString(1, dishName);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setString(4, image);

            // Execute the insert operation
            int result = stmt.executeUpdate();

            
            if (result > 0) {
            	request.setAttribute("message", " dish added succefully");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else {
            	request.setAttribute("message1", "Erreur");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException("Database error while inserting the dish", ex);
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
