<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage ="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int uid = Integer.parseInt(request.getParameter("uid"));
    PostDao postD = new PostDao(ConnectionProvider.getConnection());
    User user = (User) session.getAttribute("currentUser");
    UserDao ud = new UserDao(ConnectionProvider.getConnection());
    User user1 = ud.getUserByUserId(uid);

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- CSS only -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link href="CSS/index.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/profile_page.css" rel="stylesheet" type="text/css"/>
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
        <link href="CSS/User_profile.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                -webkit-clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);
                clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);

            </style>
            <title>Profile Page</title>
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


            <!--Navbar Ends Here -->



            <!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"> -->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div id="content" class="content content-full-width">
                            <!-- begin profile -->
                            <div class="profile">
                                <div class="profile-header">
                                    <!-- BEGIN profile-header-cover -->
                                    <div class="profile-header-cover"></div>
                                    <!-- END profile-header-cover -->
                                    <!-- BEGIN profile-header-content -->
                                    <div class="profile-header-content">
                                        <!-- BEGIN profile-header-img -->
                                        <div class="profile-header-img">
                                            <img
                                                src="Pics/<%= user1.getProfile()%>"
                                                alt=""
                                                />
                                        </div>
                                        <!-- END profile-header-img -->
                                        <!-- BEGIN profile-header-info -->
                                        <div class="profile-header-info">
                                            <h4 class="m-t-10 m-b-5"><%= user1.getName()%></h4>
                                            <p class="m-b-10">UXUI + Frontend Developer</p>
                                            <a href="#" class="btn btn-sm btn-info mb-2"
                                               >Edit Profile</a
                                            >
                                        </div>
                                        <!-- END profile-header-info -->
                                    </div>
                                    <!-- END profile-header-content -->
                                    <!-- BEGIN profile-header-tab -->
                                    <ul class="profile-header-tab nav nav-tabs">
                                        <li class="nav-item">
                                            <a
                                                href="https://www.bootdey.com/snippets/view/bs4-profile-with-timeline-posts"
                                                target="__blank"
                                                class="nav-link_"
                                                >POSTS</a
                                            >
                                        </li>
                                        <li class="nav-item">
                                            <a
                                                href="https://www.bootdey.com/snippets/view/bs4-profile-about"
                                                target="__blank"
                                                class="nav-link_"
                                                >ABOUT</a
                                            >
                                        </li>
                                        <li class="nav-item">
                                            <a
                                                href="https://www.bootdey.com/snippets/view/profile-photos"
                                                target="__blank"
                                                class="nav-link_"
                                                >PHOTOS</a
                                            >
                                        </li>
                                        <li class="nav-item">
                                            <a
                                                href="https://www.bootdey.com/snippets/view/profile-videos"
                                                target="__blank"
                                                class="nav-link_"
                                                >VIDEOS</a
                                            >
                                        </li>
                                        <li class="nav-item">
                                            <a
                                                href="https://www.bootdey.com/snippets/view/bs4-profile-friend-list"
                                                target="__blank"
                                                class="nav-link_ active show"
                                                >FRIENDS</a
                                            >
                                        </li>
                                    </ul>
                                    <!-- END profile-header-tab -->
                                </div>
                            </div>
                            <!-- end profile -->
                            <!-- begin profile-content -->
                            <!-- end profile-content -->
                        </div>
                    </div>
                </div>


            </div>

            <!--Profile Modal-->
            <main>

                <%

                    List<Post> postList = null;

                    if (uid == 0) {
                        postList = postD.getAllPosts();
                    } else {
                        postList = postD.getPostByUserId(uid);
                    }

                    if (postList.size() == 0) {
                        out.println("<h3 class='display-3 text-center'>No Posts are posted by this user</h3>");
                        return;
                    }

                    for (Post p : postList) {
                %>

                <div class="profile-content">
                    <!-- begin tab-content -->
                    <div class="tab-content p-0">
                        <!-- begin #profile-post tab -->
                        <div class="tab-pane fade active show" id="profile-post">
                            <!-- begin timeline -->
                            <ul class="timeline">
                                <li>
                                    <!-- begin timeline-time -->
                                    <div class="timeline-time">

                                        <!--fetching date and formatting it-->
                                        <%
                                            SimpleDateFormat dateForm = new SimpleDateFormat("MMMM,dd,Y");
                                            SimpleDateFormat dateForm1 = new SimpleDateFormat("hh:mm a");
                                        %>

                                        <span class="date"><%= dateForm.format(p.getpDate()).toString()%></span>
                                        <span class="time"><%= dateForm1.format(p.getpDate()).toString()%></span>
                                    </div>
                                    <!-- end timeline-time -->
                                    <!-- begin timeline-icon -->
                                    <div class="timeline-icon">
                                        <a href="javascript:;">&nbsp;</a>
                                    </div>
                                    <!-- end timeline-icon -->
                                    <!-- begin timeline-body -->
                                    <div class="timeline-body">
                                        <div class="timeline-header">
                                            <span class="userimage"
                                                  ><img
                                                    src="Pics/<%= user1.getProfile()%>"
                                                    alt=""
                                                    /></span>
                                            <span class="username"
                                                  ><a href="User_profile.jsp?uid=<%=uid%>"><%= user1.getName()%></a> <small></small
                                                ></span>
                                            <span class="pull-right text-muted">18 Views</span>
                                        </div>
                                        <div class="timeline-content">

                                            <h3><a href = "show_blog_page.jsp?post_id=<%= p.getPid()%>"><%= p.getpTitle()%></a></h3>
                                            <p style="font-size: 20px">
                                                <%= p.getpShortDes()%>
                                            </p>
                                        </div>
                                        <div class="timeline-likes">
                                            <div class="stats-right">
                                                <span class="stats-text">259 Shares</span>
                                                <span class="stats-text">21 Comments</span>
                                            </div>
                                            <div class="stats">
                                                <span class="fa-stack fa-fw stats-icon">
                                                    <i
                                                        class="fa fa-circle fa-stack-2x text-danger"
                                                        ></i>
                                                    <i
                                                        class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"
                                                        ></i>
                                                </span>
                                                <span class="fa-stack fa-fw stats-icon">
                                                    <i
                                                        class="fa fa-circle fa-stack-2x text-primary"
                                                        ></i>
                                                    <i
                                                        class="fa fa-thumbs-up fa-stack-1x fa-inverse"
                                                        ></i>
                                                </span>
                                                <span class="stats-total">4.3k</span>
                                            </div>
                                        </div>
                                        <div class="timeline-footer">
                                            <a
                                                href="javascript:;"
                                                class="m-r-15 text-inverse-lighter"
                                                ><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i>
                                                Like</a
                                            >
                                            <a
                                                href="javascript:;"
                                                class="m-r-15 text-inverse-lighter"
                                                ><i class="fa fa-comments fa-fw fa-lg m-r-3"></i>
                                                Comment</a
                                            >
                                            <a
                                                href="javascript:;"
                                                class="m-r-15 text-inverse-lighter"
                                                ><i class="fa fa-share fa-fw fa-lg m-r-3"></i>
                                                Share</a
                                            >
                                        </div>
                                        <!--Comment Box-->
                                        <div class="timeline-comment-box ">
                                            <div class="user">
                                                <img
                                                    src="Pics/<%= user1.getProfile()%>"
                                                    />
                                            </div>
                                            <div class="input">
                                                <form action="">
                                                    <div class="input-group">
                                                        <input
                                                            type="text"
                                                            class="form-control rounded-corner"
                                                            placeholder="Write a comment..."
                                                            />
                                                        <span class="input-group-btn p-l-10">
                                                            <button
                                                                class="btn btn-primary f-s-12 rounded-corner"
                                                                type="button"
                                                                >
                                                                Comment
                                                            </button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <!--Comment box ends here-->
                                    </div>
                                    <!-- end timeline-body -->
                                </li>
                            </ul>
                            <!-- end timeline -->
                        </div>
                        <!-- end #profile-post tab -->
                    </div>
                    <!-- end tab-content -->
                </div>
                <%
                    }

                %>
            </main>
            <!-- Modal -->
        <nav-profile>
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

                                    <img src ="Pics/<%= user.getProfile()%>" class ="img-fluid" style ="border-radius: 50%;
                                         width: 150px;
                                         height : 150px">
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
                                                     <td><%=user.getDateTime().toString()%></td>

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
                                                <img src ="Pics/<%= user.getProfile()%>" id="output"  title="" style ="border-radius: 50%;
                                                width: 150px;
                                                height: 150px">
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
            </nav-profile>
            <!-- JavaScript Bundle with Popper -->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="JavaScript/index.js" type="text/javascript"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <!-- MDB -->
            <script
                type="text/javascript"
                src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
                crossorigin="anonymous"
            ></script>
            <script src="JavaScript/profile.js" type="text/javascript"></script>
        </body>
    </html>
