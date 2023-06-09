package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Session s= FactoryProvider.getfactory().openSession();
			Transaction tr = s.beginTransaction();
			
			Note note = (Note)s.get(Note.class, noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddDate(new Date());
			
			tr.commit();
			s.close();
			
			response.sendRedirect("All_note.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
