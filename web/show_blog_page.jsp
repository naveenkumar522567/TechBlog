
<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage ="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("loginPage.jsp");
    }

%>
<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link href="CSS/index.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/profile_page.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.4.0/styles/atom-one-dark.min.css">
        <style>
            body{
                background: url(Images/cool-background.png);
                background-size: cover;
                background-attachment: fixed;
            }
            .banner-background{
                -webkit-clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);
                clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);
            }

            .post-title{
                font-weight: 150;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-userinfo{
                font-weight: 300;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top : 15px;
            }

        </style>

    
</head>
<body>
    <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark  primary-background">
        <a  class="navbar-brand" href="index.jsp"><span class ="fa fa-star"></span> Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-info-circle" aria-hidden="true"></i> About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class  = "fa fa-mortar-board"> </span> Category
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structure and Algorithm</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-address-book" aria-hidden="true"></i> Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"  data-toggle = "modal" data-target ="#add-post-modal"><i class="fa fa-plus-square" aria-hidden="true"></i> Create Post</a>
                </li>

            </ul>
            <ul class ="navbar-nav mr-right">

                <li class="nav-item active">
                    <a href="#!" data-toggle="modal" data-target="#profile-modal" class ="nav-link"><i class="fa fa-user-circle" aria-hidden="true"></i> <%= user.getName()%></a>
                </li>

                <li class="nav-item">
                    <a href="LogoutServlet" class ="nav-link"><i class="fa fa-sign-out" aria-hidden="true"></i> Log Out</a>
                </li>

            </ul>
        </div>
    </nav> 

    <!--Navbar ends here-->

    <!--Main content-->

    <div class ="container mt-4">

        <div class ="row">
            <div class ="col-md-8 offset-md-2">
                <div class ="card">
                    <div class ="card-header primary-background text-white">
                        <h4 class="post-title"><%= p.getpTitle()%></h4>
                    </div>
                    <div class ="card-body">
                        <img class="img-card card-img-top my-3" src="Blog_pics/<%= p.getpPic()%>" alt="Card image cap">

                        <div class = "row my-3 row-user">
                            <div class = "col-md-8">
                                <%
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                %>
                                <p class ="post-userinfo">
                                    <a href ="User_profile.jsp?uid=<%=p.getUserId()%>">
                                        <%= ud.getUserByUserId(p.getUserId()).getName()%>
                                    </a>has posted:
                                </p>
                            </div>
                            <div class = "col-md-4">
                                <p class = "post-date"><%= p.getpDate().toLocaleString()%></p>
                            </div>
                        </div>

                        <p class = "post-content"><%= p.getpContent()%></p>
                        <br><br>

                        <div class ="post-code">
                            <pre><code class ="lang-java"><%= p.getpCode()%></code></pre>
                            </div>

                        </div>
                        <div class = "card-footer text-center primary-background" style="width: 100%">
                            
                        <%
                            likeDao ld = new likeDao(ConnectionProvider.getConnection());

                        %>
                            <a href ="#!" onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>)" class =" btn btn-outline-light btn-sm text-center"><i class ="fa fa-thumbs-up"></i><span class ="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
                            <a href ="#!" class =" btn btn-outline-light btn-sm text-center"><i class ="fa fa-commenting-o"></i><span>10 </span></a>
                       
                        </div>
                            
                    </div>
                </div>
            </div>

        </div>

        <!--Main content ends here-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">



                        <div class = "container text-center">

                            <!--Profile Details-->

                            <div id ="profile-details">

                                <img src ="Pics/<%= user.getProfile()%>" class ="img-fluid " style ="border-radius: 50%; width: 150px; height : 150px">
                                <br><br>
                                <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                                <br><br>
                                <!--Details-->

                                <table class="table table-striped">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Id</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%=user.getGender()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Status</th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Registered Date</th>
                                            <td><%=DateFormat.getDateTimeInstance().format(p.getpDate())%></td>

                                        </tr>

                                    </tbody>
                                </table>
                            </div>


                            <!--Profile Details Ends Here-->


                            <!--profile edit-->

                            <div id ="profie-edit" style="display : none">



                                <form action ="profileEditServlet" method ="POST" enctype="multipart/form-data">


                                    <div class="profile-pic">
                                        <label class="-label" for="file">
                                            <span class="glyphicon glyphicon-camera"></span>
                                            <span>Change Image</span>
                                        </label>
                                        <input id="file" name ="image" type="file" onchange="loadFile(event)"/>
                                        <img src ="Pics/<%= user.getProfile()%>" id="output"  title="" style ="border-radius: 50%; width: 150px; height: 150px">
                                        <br><br>
                                    </div>

                                    <table class ="table table-striped">


                                        <tr>
                                            <th> ID: </th>
                                            <td> <%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th> Name </th>
                                            <td> <input type = "text" class ="form-control" name = "name" value ="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <th> Email: </th>
                                            <td> <input type = "email" class ="form-control" name = "email" value ="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <th> Password: </th>
                                            <td> <input type = "password" class ="form-control" name = "password" value ="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <th> Gender: </th>
                                            <td> <%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <th> Status </th>
                                            <td> 
                                                <textarea class ="form-control" name="about" rows ="3"><%= user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="container">
                                        <button type ="submit" class ="btn btn-outline-primary">Save Changes</button>
                                    </div>
                                </form>

                            </div>

                            <!--Profile Edit Ends Here-->

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id ="edit-profile-botton" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--End of Profile Modal-->


        <!--Add POst MOdal Starts-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id ="add-post-form" action = "AddPostServlet" method = "POST">

                            <div class ="form-group">
                                <div class="input-group mb-3">

                                    <select class="custom-select" name ="cid" id="inputGroupSelect01">
                                        <option selected disabled>Select Post Category </option>

                                    <%
                                        PostDao postD = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postD.getAllCategories();
                                        for (Category c : list) {

                                    %>

                                        <option  value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                    </select>
                                </div>
                            </div>

                            <div class ="form-group">
                                <input name ="pTitle" type ="text" placeholder ="Enter post Title" class ="form-control"/>
                            </div>
                            <div class ="form-group">
                                <textarea name ="pShortDes" class ="form-control" placeholder ="Short description(300 character)" style="height: 100px"></textarea>
                            </div>
                            <div class ="form-group">
                                <textarea name ="pContent" class ="form-control" placeholder ="Enter your Content" style="height: 200px"></textarea>
                            </div>
                            <div class ="form-group">
                                <textarea name ="pCode" class ="form-control" placeholder ="Enter your Code (if any)" style="height: 200px"></textarea>
                            </div>
                            <div class ="form-group">
                                <div class="input-group mb-3">
                                    <div class="custom-file">
                                        <input name="postPic" type="file" class="custom-file-input" id="inputGroupFile01">
                                        <label class="custom-file-label" for="inputGroupFile01">Select your picture</label>
                                    </div>
                                </div>
                            </div>
                            <div class="container text-center">

                                <button type="submit" class="btn btn-primary">Post</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>


        <!--Post Modal ends here-->


        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="JavaScript/index.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="JavaScript/profile.js" type="text/javascript"></script><!-- comment -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.4.0/highlight.min.js"></script>
        <script>hljs.highlightAll();</script>
    </body>
</html>
