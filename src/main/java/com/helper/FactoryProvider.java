
package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @author SUDIP
 *
 */
public class FactoryProvider {

	public static SessionFactory factory;
	
	public static SessionFactory getfactory() {
		
		if(factory==null) {
			factory= new Configuration().configure("hiber.org.xml").buildSessionFactory();
		}
		return factory;
	}
	public void closefactory() {
		if(factory.isOpen()) {
			factory.close();
		
		}
	}
	
}
