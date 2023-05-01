package com.servlet;

import com.entities.*;
import com.helper.FactoryProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content,new Date());
			System.out.println(note.getId()+":"+note.getTitle()+":"+note.getContent());
			 Session ses = FactoryProvider.getfactory().openSession();
			 Transaction tr = ses.beginTransaction();
			 ses.save(note);
			 tr.commit();
			 ses.close();
			 response.setContentType("text/html");
			 PrintWriter out= response.getWriter();
			 response.sendRedirect("All_note.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
