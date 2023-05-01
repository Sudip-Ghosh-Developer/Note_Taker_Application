<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker-update your note</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>


<%
int editId= Integer.parseInt(request.getParameter("edit_id").trim());
  
Session s= FactoryProvider.getfactory().openSession();

Note note = (Note)s.get(Note.class, editId);
s.update(note);

s.close();
%>


<div class="container">
   <h1>Edit Your Note Details</h1>
   <br>
   <form action="UpdateServlet" method="post">
   <input value=" <%=note.getId() %> " name="noteId" type="hidden" >
  <div class="form-group">
    <label for="exampleInputEmail1">Note Title</label>
    <input required type="text"  
    name="title" 
     class="form-control" 
     value="<%=note.getTitle() %>"
     id="title"  aria-describedby="emailHelp" 
     placeholder="Enter Note Title">
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea required name="content" id="content" placeholder="Enter Your Note Content" class="form-control" style="height: 250px;"><%= note.getContent() %>
    </textarea>
  </div>
 <div class="container  text-center">
  <button type="submit" class="btn btn-success " >Save Your Note</button>
 
 </div>
</form>
   </div>

</body>
</html>