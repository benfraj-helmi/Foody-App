<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Foody Registration</title>
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
    
    .registration-container {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 30px;
      border-radius: 10px;
      color: white;
      text-align: center;
      width: 300px; /* Set a width for the form */
    }

    .registration-container h1 {
      margin-bottom: 20px;
    }

    .registration-container input[type="text"],
    .registration-container input[type="email"],
    .registration-container input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px; /* Adjusted for tighter layout */
      border-radius: 5px;
      border: none;
      font-size: 16px;
      background-color: #fff;
      color: #333;
    }
    
    .registration-container input[type="submit"] {
      background-color: orange;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      width: 100%; /* Make the button span the full width */
    }
    
    .registration-container input[type="submit"]:hover {
      background-color: #ff8000;
    }
  </style>
</head>
<body>
  <div class="registration-container">
    <h1>Register</h1>
    <form action="RegisterServlet" method="post">
      Username: <input type="text" name="username" required><br>
      Email: <input type="email" name="email" required><br>
      Password: <input type="password" name="password" required><br>
      <input type="submit" value="Register">
    </form>
  </div>
</body>
</html>

