<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Foody Admin</title>
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
    }
    
    .admin-container h2 {
      margin-bottom: 20px;
    }
    
    .admin-container button {
      background-color: orange;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      margin: 10px;
    }
    
    .admin-container button:hover {
      background-color: #ff8000;
    }
  </style>
</head>
<body>
  <div class="admin-container">
    <h2>Foody Admin Panel</h2>
    <form action="addFood.jsp" method="post">
      <button type="submit">Add Food</button>
    </form>
    <form action="DeleteFoodServlet" method="post">
      <button type="submit">Delete Food</button>
    </form>
    <form action="ViewMenuServlet" method="post">
      <button type="submit">View Menu</button>
    </form>
    <form action="SearchFoodServlet" method="post">
      <button type="submit">Search Food</button>
    </form>
    <form action="ViewCommandsServlet" method="post">
      <button type="submit">View Commands</button>
    </form>
    <form action="AddCommandServlet" method="post">
      <button type="submit">Add Command</button>
    </form>
    <form action="ApproveCommandServlet" method="post">
      <button type="submit">Approve Command</button>
    </form>
    <form action="DeleteCommandServlet" method="post">
      <button type="submit">Delete Command</button>
    </form>
  </div>
          <b style="color:red;">
<%
String message1 =(String)(request.getAttribute("message1"));

if(message1!=null){
	out.print(message1);
}


%>
</b>
          <b style="color:green;">
<%
String message=(String)(request.getAttribute("message"));

if(message!=null){
	out.print(message);
}


%>
</b>
</body>
</html>
