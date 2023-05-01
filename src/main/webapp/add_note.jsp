<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker- Add_note</title>
<%@include file="all_js_css.jsp"  %>
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %>
    
   </div>
   
   <div class="container">
   <h1>Please Fill Your Note Details</h1>
   <br>
   <form action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Note Title</label>
    <input required type="text"  name="title"  class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Note Title">
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea required name="content" id="content" placeholder="Enter Your Note Content" class="form-control" style="height: 250px;"></textarea>
  </div>
 <div class="container  text-center">
  <button type="submit" class="btn btn-primary " id="Add" >ADD</button>
 
 </div>
</form>
   </div>
   <script >
   $(document).ready(function () {
	 $("#Add").click(function () {
		alert("Succesfully added your Note...")
	})  
	
})
   
   </script>
</body>
</html>