
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry, something Went Wrong!!</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class ="container text-center">
            <image src ="Images/error.png" class="img-fluid">
            <h3 class ="display">Sorry! Something went wrong....</h3>
            <%= exception %><br>
            <a href = "index.jsp" class ="btn primary-background text-white btn-lg mt-3">Go to Home Page</a>
        </div>
    </body>
</html>
