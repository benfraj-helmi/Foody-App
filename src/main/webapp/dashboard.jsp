
<%@ page import="firsttry.DBConnection"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.sql.Statement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
            text-align: left;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Welcome to Your Dashboard!</h1>
    <p>Here you can view available dishes and manage your orders.</p>

    <!-- Displaying a list of available dishes -->
    <h2>Available Dishes</h2>
    <table>
        <tr>
            <th>Dish Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Order</th>
        </tr>
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                // Ensure that this JSP knows about the DBConnection class
                 // Use the appropriate driver name
                conn = DBConnection.getConnection();    // Connect to the database
                stmt = conn.createStatement();
                String sql = "SELECT * FROM dishes";    // SQL query to select all dishes
                rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    String dishName = rs.getString("dish_name");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
        %>
        <tr>
            <td><%= dishName %></td>
            <td><%= description %></td>
            <td>$            <%= price %></td>
            <td>
                <form action="OrderServlet" method="post">
                    <input type="hidden" name="id_dish" value="<%= rs.getInt("id_dish") %>">
                    <input type="number" name="quantity" min="1" value="1">
                    <button type="submit">Order</button>
                </form>
            </td>
        </tr>
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
        %>
    </table>
</body>
</html>
            

            
            
            
            
            
