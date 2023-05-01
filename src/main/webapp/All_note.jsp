<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker-All Note</title>
 <%@include file="all_js_css.jsp" %>

</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %>
   </div>
      <h1 style="text-align: center;">ALL NOTE HERE :</h1>
      
      <div class="row">
      <div class="col-12">
      
<%
Session s=FactoryProvider.getfactory().openSession();
    Query q= s.createQuery("from Note");
    
    List<Note>list = q.list();
    for(Note note:list){
    	
%>
<div class="container">
<div class="card mt-3" >
  <img src="img/notebook.png" style="height: 100px;width: 100px;margin: auto 30px;padding: 10px;" class="card-img-top" alt="looding img">
  <div class="card-body">
    <h5 class="card-title"><%= note.getTitle() %></h5>
    <p class="card-text"><%= note.getContent() %></p>
    <p style="text-align: right;color: blue;"><%=note.getAddDate() %></p>
    <a href="DeleteServlet?Note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
        <a href="edit.jsp?edit_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
    
  </div>
</div>
</div>


 <%
    	
    }
    
    s.close();

%>
      
      </div>
        </div>
      
   
</body>
</html>