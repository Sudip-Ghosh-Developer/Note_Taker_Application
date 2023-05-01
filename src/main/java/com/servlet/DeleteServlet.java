package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("Note_id").trim());
			
			Session s= FactoryProvider.getfactory().openSession();
			Transaction tr = s.beginTransaction();
			Note note =(Note) s.get(Note.class,id);
			s.delete(note);
			tr.commit();
			s.close();
			response.sendRedirect("All_note.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
