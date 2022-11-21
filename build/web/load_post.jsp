<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao" %>
<div class ="row">
    <%
        User uu = (User)session.getAttribute("currentUser");
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> list = null;

        if (cid == 0) {
            list = d.getAllPosts();
        } else {
            list = d.getPostByCatId(cid);
        }

        if (list.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category</h3>");
            return;
        }

        for (Post p : list) {
    %>
    <div class = "col-md-6 mt-4 d-flex align-items-stretch">
        <div class ="card d-flex align-items-end ">
            <a  href ="show_blog_page.jsp?post_id=<%= p.getPid()%>" style="width: 100%">
                <img class="img-card card-img-top" src="Blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            </a>
            <div class ="card-body card-content">
                <a href ="show_blog_page.jsp?post_id=<%= p.getPid()%>">
                    <b class ="card-title"><%= p.getpTitle()%></b>
                </a>
                <p><%= p.getpShortDes()%></p>
                
            </div>
                
            <div class = "card-footer text-center primary-background" style="width: 100%">
                
                <%
                    likeDao ld = new likeDao(ConnectionProvider.getConnection());
                %>
                <a href ="#!" onclick="doLike(<%= p.getPid() %>, <%= uu.getId() %>)" class =" btn btn-outline-light btn-sm text-center"><i class ="fa fa-thumbs-up"></i><span class ="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
                <a href ="#!" class =" btn btn-outline-light btn-sm text-center"><i class ="fa fa-commenting-o"></i><span>10 </span></a>
                <a href ="show_blog_page.jsp?post_id=<%= p.getPid()%>" class =" btn btn-outline-light btn-sm text-center">Read More </a>
            </div>
        </div>
    </div>

    <%
        }

    %>

</div>

