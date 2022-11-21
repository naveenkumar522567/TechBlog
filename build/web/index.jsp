<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Tech Blog</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link href="CSS/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
            rel="stylesheet"
            />

        <style>
            .banner-background{
                -webkit-clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);
                clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);

            </style>
        </head>
        <body>
            <!--NavBar-->
            <%@include file = "Normal_navBar.jsp" %>

            <!--banner-->

            <div class =" container-fluid p-0 m-0">
                <div class ="jumbotron primary-background text-white banner-background">
                    <div class ="container">
                        <h3 class ="display-3">Welcome to TechBlog</h3>

                        <p>Welcome to Technical blog, Programming is writing computer code to create a 
                            program, to solve a problem. Programs are created to implement algorithms.
                            Algorithms can be represented as pseudocode or a flowchart, and programming
                            is the translation of these into a computer program.</p>
                        <p>There are many different programming languages,
                            some more complicated and complex than others.
                            Among the most popular languages are: Python, Java, C++, BASIC, Scratch, 
                            Different languages work in different ways.
                            For example, in Python all instructions are written in lowercase, 
                            but in BASIC they tend to be written in uppercase.</p>
                        <a href="registerPage.jsp" class ="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start It's Free</a>
                        <a href="loginPage.jsp" class ="btn btn-outline-light btn-lg"><i class="fa fa-sign-in" aria-hidden="true"></i> LogIn</a>
                    </div>

                </div>

            </div>

            <!--Cards-->

            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card" >

                            <div class="card-body">
                                <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                                <h5 class="card-title">JAVA Programming</h5>
                                <p class="card-text">Java is a general-purpose, class-based, 
                                    object-oriented programming language designed for having lesser implementation dependencies.
                                    It is a computing platform for application development.
                                    Java is fast, secure, and reliable, therefore. It is widely used for developing 
                                </p>
                                <a href="#" class="btn btn-primary">Read More</a>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">

                            <div class="card-body">
                                <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                                <h5 class="card-title">Python</h5>
                                <p class="card-text">Python is a computer programming language often used to build websites
                                    and software, automate tasks, and conduct data analysis. Python is a general-purpose language,
                                    meaning it can be used to create a variety of different programs
                                    and isn't specialized for any specific problems.</p>
                                <a href="#" class="btn btn-primary">Read More</a>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">

                            <div class="card-body">
                                <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                                <h5 class="card-title">Data Structure And Algorithms</h5>
                                <p class="card-text">A data structure is a named location that can be used to store and organize data.
                                    And, an algorithm is a collection of steps to solve a particular problem.
                                    Learning data structures and algorithms allow us to write efficient and optimized computer programs.</p>
                                <a href="#" class="btn btn-primary">Read More</a>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="row mt-4">
                    <div class="col-md-4">
                        <div class="card">

                            <div class="card-body">
                                <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                                <h5 class="card-title">JavaScript</h5>
                                <p class="card-text">
                                    JavaScript (often shortened to JS) is a lightweight, interpreted,
                                    object-oriented language with first-class functions, and is best known as
                                    the scripting language for Web pages, but it's used in many non-browser environments as well.
                                </p>
                                <a href="#" class="btn btn-primary">Read More</a>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">

                            <div class="card-body">
                                <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                                <h5 class="card-title">DevOps</h5>
                                <p class="card-text">
                                    DevOps is the combination of cultural philosophies, practices, and
                                    tools that increases an organization's ability to deliver applications
                                    and services at high velocity: evolving and improving products at a
                                    faster pace than organizations using traditional software development
                                    and infrastructure management processes.
                                </p>
                                <a href="#" class="btn btn-primary">Read More</a>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">

                            <div class="card-body">
                                <!--<img class="card-img-top" src="..." alt="Card image cap">-->
                                <h5 class="card-title">Database</h5>
                                <p class="card-text">
                                    A database is an organized collection of structured information,
                                    or data, typically stored electronically in a computer system.
                                    A database is usually controlled by a database management system (DBMS).
                                </p>
                                <a href="#" class="btn btn-primary">Read More</a>
                            </div>

                        </div>
                    </div>

                </div>

            </div>

            <%@include file = "footer.jsp" %>

            <!--JavaScript-->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <!-- MDB -->
            <script
                type="text/javascript"
                src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
            ></script>
            <script src="JavaScript/index.js" type="text/javascript"></script>


        </body>
    </html>
