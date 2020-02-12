<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="common.ErrorDetail" %>
<jsp:include page="/elements/header.jsp"></jsp:include>
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <h1>Register</h1>
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign In</h5>
            <font color="red">
            <%
              ErrorDetail error = (ErrorDetail)request.getAttribute("error");
            if(error!=null)
              out.println(error.getMessage());
            %>
            </font>
            <form class="form-signin" action="/Question-Generation-System/register" method="Post">
              <div class="form-label-group">
                 <label for="inputEmail">Email address</label>
                <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
              </div>

              <div class="form-label-group">
                <label for="inputPassword">Password</label>
                <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="/elements/footer.jsp"></jsp:include>