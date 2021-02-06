package com.radio.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class MiniListener
 *
 */

public class MiniListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public MiniListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	ServletContext app = sce.getServletContext();
    	
        String contextRoot = app.getContextPath();
        
        app.setAttribute("root", contextRoot);
    }
	
}
