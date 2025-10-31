<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Dish - Foody Admin</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('bg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .admin-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            color: white;
            text-align: center;
            width: 350px; /* Adjust width as needed */
        }
        
        .admin-container h2 {
            margin-bottom: 20px;
        }
        
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
        }
        
        input[type="submit"] {
            background-color: orange;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        
        input[type="submit"]:hover {
            background-color: #ff8000;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <h2>Add a New Dish</h2>
        <form action="AddFoodServlet" method="post">
            <input type="text" id="dishName" name="dishName" placeholder="Dish Name" required>
            <textarea id="description" name="description" placeholder="Description" rows="4" required></textarea>
            <input type="text" id="price" name="price" placeholder="Price" required>
            <input type="text" id="image" name="image" placeholder="Image URL" required>
            <input type="submit" value="Add Dish">
        </form>
    </div>
</body>
</html>
