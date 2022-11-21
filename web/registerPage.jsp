
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link href="CSS/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                -webkit-clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);
                clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 100%, 74% 95%, 47% 100%, 24% 95%, 0 100%, 0 0);
            </style>

        </head>
        <body>

            <%@include file ="Normal_navBar.jsp" %>
            <main class = "d-flex align-items-center primary-background banner-background text" style=" padding-top: 50px;
                  padding-bottom:100px">
                      <div class ="container">
                          <div class ="col-md-6 offset-md-3">

                              <div class ="card" style ="-webkit-box-shadow: 0px 0px 52px 1px rgba(0,0,0,0.91);
                              -moz-box-shadow: 0px 0px 52px 1px rgba(0,0,0,0.91);
                              box-shadow: 0px 0px 52px 1px rgba(0,0,0,0.91);" >
                              <div class ="card-header text-center primary-background text-white">
                                  <span class = "fa fa-3x fa-user-circle"></span>
                                  <br>
                                  Register Here
                              </div>
                              <div class ="card-body">

                                  <form id ="register_form" action = "registerServlet" type = "POST">

                                      <div class="form-group">
                                          <label for="user_name">User Name</label>
                                          <input name ="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Your name">
                                      </div>

                                      <div class="form-group">
                                          <label for="exampleInputEmail1">Email address</label>
                                          <input name = "user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                          <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                      </div>


                                      <div class="form-group">
                                          <label for="exampleInputPassword1">Password</label>
                                          <input name ="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                      </div>

                                      <div class="form-group">
                                          <label for="gender">Select gender</label>
                                          <br>
                                          <input  type="radio" id="gender" name ="gender" value = "male">Male
                                          <input type="radio" id="gender" name ="gender" value = "female">Female
                                      </div>

                                      <div class ="form-group">
                                          <textarea name ="about" class ="form-control" rows ="3" placeholder ="Enter something about yourself"></textarea>

                                      </div>

                                      <div class="form-check">
                                          <input name ="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                          <label class="form-check-label" for="exampleCheck1">Agree terms and Conditions</label>
                                      </div>
                                      <br>

                                      <div class ="container text-center" id="loader" style="display:none">
                                              <span class = "fa fa-refresh fa-spin fa-3x"></span>
                                              <h4>Please Wait</h4>
                                          </div>
                                          <button type="submit" id ="submit-btn" class="btn btn-primary">Submit</button>
                                      </form>

                                  </div>
                                  <div class ="card-footer">

                                  </div>
                              </div>

                          </div>
                      </div>
                  </main>

                  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
                  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                  <script src="JavaScript/index.js" type="text/javascript"></script>
                  <script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
                  <script>
                      $(document).ready(function () {

                          $("#register_form").on('submit', function (event) {
                              event.preventDefault();

                              let form = new FormData(this);

                              $("#loader").show();
                              $("#submit-btn").hide();
                              $.ajax({
                                  //url of servlet it is submiting request
                                  url: "registerServlet",
                                  //data that is inside our form
                                  data: form,

                                  //what is the type of request
                                  type: 'POST',

                                  success: function (data, textStatus, jqXHR) {
                                      $("#loader").hide();
                                      $("#submit-btn").show();
                                      //reseting form 
                                      $("#register_form")[0].reset();
//                                      if everything is fine then print the success msg
                                      if (data.trim() === "Done") {
                                          swal({
                                              title: "Registered Successfully",
                                              text: "We are redirecting you to Login Page",
                                              icon: "success",
                                              button: "Okay"
                                          }).then((value) => {
                                              window.location = "loginPage.jsp";
                                          });
                                      } else {
                                          swal({
                                              title: data,
                                              icon: "warning",
                                              dangerMode: true
                                          })
                                      }

                                  },
                                  error: function (jqXHR, textStatus, errorThrown) {

                                      $("#loader").hide();
                                      $("#submit-btn").show();
                                      $("#myorm")[0].reset();

                                      swal({
                                          title: "Sorry, Something Went Wrong",
                                          icon: "warning",
                                          dangerMode: true
                                      })

                                  },
                                  processData: false,
                                  contentType: false
                              })
                          })

                      })

                  </script>
            </body>
        </html>
