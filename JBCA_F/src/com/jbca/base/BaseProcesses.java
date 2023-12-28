package com.jbca.base;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BaseProcesses
{
	HttpServletRequest request;
	HttpServletResponse response;
	
	public HttpSession httpSession;
	
	BaseParameters p;
	
	public BaseProcesses(HttpServletRequest request, HttpServletResponse response, BaseParameters p){
		
		this.request = request;
		this.response = response;
		this.p = p;
	}
	
	public BaseProcesses(HttpServletRequest request){
		
		this.request = request;
	}
	
	public void checkSession()
	{
		httpSession = request.getSession(false);
		
	    if (httpSession == null) 
	    {
	        try {
	        	if(p.isLocale)
	        		request.getRequestDispatcher("start/oturum-sonu.jsp").forward(request, response);
	        	else
	        		request.getRequestDispatcher("start/session-end.jsp").forward(request, response);
		    } 
	        catch(Exception ex) {
		    	ex.printStackTrace();
		    }
		}
	}
	
	public void checkAuthorized(BaseParameters p)
	{
		this.p = p;
		
		for(String auth : p.authorized)
    	{
    		if(p.sessionBean.getGroup().equals(auth))
    			p.isAuth = true;
    	}
    	if(!p.isAuth)
    	{
			try {
	      		if(p.isLocale)
					request.getRequestDispatcher("start/yetkisiz-giris.jsp").forward(request, response);
				else
	      			request.getRequestDispatcher("start/unauthorized-entry.jsp").forward(request, response);
			} 
			catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
      	}
	}

	public void checkSes4JSP()
	{
		httpSession = request.getSession(false);
		
	    if (httpSession == null) 
	    {
	        try {
	        	if(p.isLocale)
	        		request.getRequestDispatcher("/start/oturum-sonu.jsp").forward(request, response);
	        	else
	        		request.getRequestDispatcher("/start/session-end.jsp").forward(request, response);
		    } 
	        catch(Exception ex) {
		    	ex.printStackTrace();
		    }
		}
	}
	
	public void checkAuth4JSP(BaseParameters p)
	{
		this.p = p;
		
		for(String auth : p.authorized)
    	{
    		if(p.sessionBean.getGroup().equals(auth))
    			p.isAuth = true;
    	}
    	if(!p.isAuth)
    	{
			try {
	      		if(p.isLocale)
					request.getRequestDispatcher("/start/yetkisiz-giris.jsp").forward(request, response);
				else
	      			request.getRequestDispatcher("/start/unauthorized-entry.jsp").forward(request, response);
			} 
			catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
      	}
	}

	public void setP(BaseParameters p) {
		this.p = p;
	}
}
