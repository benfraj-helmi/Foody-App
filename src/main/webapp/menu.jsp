<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="firsttry.DBConnection"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Foody</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Oswald:wght@500;600;700&family=Pacifico&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Topbar Start -->
    <div class="container-fluid px-0 d-none d-lg-block">
        <div class="row gx-0">
            <div class="col-lg-4 text-center bg-secondary py-3">
                <div class="d-inline-flex align-items-center justify-content-center">
                    <i class="bi bi-envelope fs-1 text-primary me-3"></i>
                    <div class="text-start">
                        <h6 class="text-uppercase mb-1">Email Us</h6>
                        <span>IsimsTD2TP1@gmail.com</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center bg-primary border-inner py-3">
                <div class="d-inline-flex align-items-center justify-content-center">
                    <a href="index.jsp" class="navbar-brand">
                        <h1 class="m-0 text-uppercase text-white"></i>Foody</h1>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 text-center bg-secondary py-3">
                <div class="d-inline-flex align-items-center justify-content-center">
                    <i class="bi bi-phone-vibrate fs-1 text-primary me-3"></i>
                    <div class="text-start">
                        <h6 class="text-uppercase mb-1">Call Us</h6>
                        <span>+216 29 554 089</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->
<!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="index.jsp" class="navbar-brand d-block d-lg-none">
            <h1 class="m-0 text-uppercase text-white"><i class="fa fa-birthday-cake fs-1 text-primary me-3"></i>CakeZone</h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto mx-lg-auto py-0">
                <a href="index.jsp" class="nav-item nav-link active">Home</a>
                <a href="about.jsp" class="nav-item nav-link">About Us</a>
                <a href="menu.jsp" class="nav-item nav-link">Menu & Pricing</a>
                
                </div>
              
            </div>
        </div>
    </nav>
    <!-- Navbar End -->



    <!-- Page Header Start -->
    <div class="container-fluid bg-dark bg-img p-5 mb-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-4 text-uppercase text-white">Menu & Pricing</h1>
                <a href="">Home</a>
                <i class="far fa-square text-primary px-2"></i>
                <a href="">Menu & Pricing</a>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Products Start -->
    <div class="container-fluid about py-5">
        <div class="container">
            <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
                <h2 class="text-primary font-secondary">Menu & Price</h2>
                <h1 class="display-4 text-uppercase">Bon Appetit!</h1>
            </div>
                   <!-- product mark -->
       <div class="container">
        <div class="tab-class text-center">
            <div class="tab-content">
                <% 
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;
                    try {
                        con = DBConnection.getConnection();
                        String sql = "SELECT * FROM dishes";
                        pst = con.prepareStatement(sql);
                        rs = pst.executeQuery();
                        
                        while (rs.next()) {
                            String dishName = rs.getString("dish_name");
                            String description = rs.getString("description");
                            double price = rs.getDouble("price");
                            String imageUrl = rs.getString("image");
                %>
                            <div class="row g-3">
                                <div class="col-lg-6">
                                    <div class="d-flex h-100">
                                        <div class="flex-shrink-0">
                                            <img class="img-fluid" src="img/<%=imageUrl%>" alt="" style="width: 150px; height: 85px;">
                                            <h4 class="bg-dark text-primary p-2 m-0">$<%=price%></h4>
                                        </div>
                                        <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                            <h5 class="text-uppercase"><%=dishName%></h5>
                                            <span><%=description%></span> 
                                            <a href="" class="btn btn-primary border-inner py-3 px-5 me-3">Buy</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                <% 
                        }
                    } catch (SQLException e) {
                        out.println("Database connection problem: " + e.getMessage());
                    } finally {
                        try { if (rs != null) rs.close(); } catch (Exception e) {};
                        try { if (pst != null) pst.close(); } catch (Exception e) {};
                        try { if (con != null) con.close(); } catch (Exception e) {};
                    }
                %>
            </div>
        </div>
    </div>
        <!-- product mark -->
    </div>
    <!-- Products End -->


    <!-- Offer Start -->
    <div class="container-fluid bg-offer my-5 py-5">
        <div class="container py-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-7 text-center">
                    <div class="section-title position-relative text-center mx-auto mb-4 pb-3" style="max-width: 600px;">
                        <h2 class="text-primary font-secondary">Special combo Pack</h2>
                        <h1 class="display-4 text-uppercase text-white">Chapaty Mahdia</h1>
                    </div>
                    
                    <a href="" class="btn btn-primary border-inner py-3 px-5 me-3">Shop Now</a>
                    <a href="" class="btn btn-dark border-inner py-3 px-5">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->
    

      <!-- Footer Start -->
    <div class="container-fluid bg-img text-secondary" style="margin-top: 90px">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-4 col-md-6 mb-lg-n5">
                    <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary border-inner p-4">
                        <a href="index.jsp" class="navbar-brand">
                            <h1 class="m-0 text-uppercase text-white"></i>Foody</h1>
                        </a>
                        <p class="mt-3"></p>
                    </div>
                </div>
                <div class="col-lg-8 col-md-6">
                    <div class="row gx-5">
                        <div class="col-lg-4 col-md-12 pt-5 mb-5">
                            <h4 class="text-primary text-uppercase mb-4">Get In Touch</h4>
                            <div class="d-flex mb-2">
                                <i class="bi bi-geo-alt text-primary me-2"></i>
                                <p class="mb-0">ISIMS , sakiet ezzyt , sfax , tunisia</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-envelope-open text-primary me-2"></i>
                                <p class="mb-0">isimsTD2TP1@gmail.com</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-telephone text-primary me-2"></i>
                                <p class="mb-0">+216 29 554 089</p>
                            </div>
                            <div class="d-flex mt-4">
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            <h4 class="text-primary text-uppercase mb-4">Quick Links</h4>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                                <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                                <a class="text-secondary mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                                
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            <h4 class="text-primary text-uppercase mb-4">Newsletter</h4>
                            <p>if you want to recieve notifications from  our app please sing up in the newsletter service</p>
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control border-white p-3" placeholder="Your Email">
                                    <button class="btn btn-primary">Sign Up</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid text-secondary py-4" style="background: #111111;">
        <div class="container text-center">
            <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Foody</a>. All Rights Reserved to P-IINFO ISIMS
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-inner py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- [Rest of your HTML content as previously written] -->

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>
