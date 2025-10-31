<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Foody Login</title>
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
    
    .login-container {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 30px;
      border-radius: 10px;
      color: white;
      text-align: center;
    }
    
    .login-container h2 {
      margin-bottom: 20px;
    }
    
    .login-container input[type="text"],
    .login-container input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border-radius: 5px;
      border: none;
      font-size: 16px;
    }
    
    .login-container input[type="submit"] {
      background-color: orange;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }
    
    .login-container input[type="submit"]:hover {
      background-color: #ff8000;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Welcome to Foody!</h2>
    <form action="LoginServlet" method="post">
      <input type="text" name="email" placeholder="Email" required><br>
      <input type="password" name="password" placeholder="Password" required><br>
      <input type="submit" value="Login">
    </form>
    <div> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 										</div>
    <!-- New form for registration redirection -->
    <form action="register.jsp" method="get">
      <input type="submit" value="Register">
    </form>
        <b style="color:red;">
<%
String message=(String)(request.getAttribute("message"));

if(message!=null){
	out.print(message);
}


%>
</b>
  </div>
</body>
</html>
