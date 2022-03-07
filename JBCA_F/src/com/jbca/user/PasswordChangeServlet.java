package com.jbca.user;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.jbca.base.BaseProcesses;
import com.sdb.utility.JsonConverter;
import com.sdb.utility.ValueChecker;

@WebServlet(urlPatterns = "/passwordChangeServlet", 
			loadOnStartup = 1,
			asyncSupported = true)
@MultipartConfig (fileSizeThreshold = 1024*1024, 
					maxFileSize = 1024*1024*5, 
					maxRequestSize = 1024*1024*5*5) // location = StaticParams.mPLocation,
public class PasswordChangeServlet extends HttpServlet
{
	private static final long serialVersionUID = 592694135462052763L;

	private PasswordChangeParams p;
	
    @SuppressWarnings("unused")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json; charset=UTF-8"); 
        
        Collection<Part> parts = request.getParts();
	
        p = new PasswordChangeParams();
        p.isLocale = request.getParameter("isLocale").equals("true");
		p.initParams();

        p.action = request.getParameter("action");

    	if(p.action == null || p.action.equals("empty"))
    		return;

    	BaseProcesses process = new BaseProcesses(request, response, p);
    	 
    	process.checkSession();

    	String jsonData = "", msgStr = "", keyData, hashedPasw; 
    	boolean dbQuery = false;
    	String[] messages = new String[3];
    	int formSize = 0, n=0;
    	
    	PrintWriter out = response.getWriter();

    	try 
    	{
         	p.sessionBean.setCode(process.httpSession.getAttribute("ses_code").toString()); 
         	p.sessionBean.setGroup(process.httpSession.getAttribute("ses_group").toString());

         	process.checkAuthorized(p);
         	
	    	if(p.action.equals("update"))
	    	{
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize]; 
	    		
	    		p.formData[0] = p.sessionBean.getCode();
	    		System.out.println(p.formData[0]);
	    		
	    		for(int i=1	; i < formSize; i++) {
	    			p.formData[i] = request.getParameter(p.fieldNames[i]);
	    			System.out.println(p.formData[i]);
	    		}
	    		keyData = p.passwordBean.getKeyData(new String[] {p.formData[0]});
	    		System.out.println(keyData);
	    		
	    		hashedPasw = p.managePassword.hashPasw(keyData, p.formData[1], false);
	    		System.out.println(hashedPasw);
	    		
	    		if(p.formData[1] != null && hashedPasw.equals(p.passwordBean.getPassword(keyData)) &&
	    				p.formData[2] != null && p.formData[2].length() >= 8 && !ValueChecker.isNumeric(p.formData[2])) {
	    			if(p.formData[2] != null && p.formData[2].equals(p.formData[1]))
	    			{
	    				messages[1]= p.messageBean.getPasswordNotEqual();
	    			}
	    			else if(p.formData[2] != null && p.formData[3] != null && p.formData[2].equals(p.formData[3]))
					{
	    				p.formData[2] = p.managePassword.hashPasw(keyData, p.formData[2], false);
	    				
	    				p.passwordBean.setPassword(keyData, p.formData[2]);
	    				
	    				messages[0] = p.messageBean.getPasswordIsChanged();
					}
					else
						messages[1]= p.messageBean.getPasswordNotEqual();
	    		}
	    		else
	    			messages[1]= p.messageBean.getInvalidPassword();
	    		
	    		if(!p.passwordBean.getErrorString().equals("null errorString"))
	    			messages[2] = p.passwordBean.getErrorString();

	    		if(messages[1] == null)
	    			messages[1] = Integer.valueOf(formSize).toString();
	    		
	    		messages[1] += " sqlString: "+p.passwordBean.getQueryString();
	    		
	    		p.jsonConverter = new JsonConverter(messages);
	    		jsonData = p.jsonConverter.getMessageList(false);
	    		System.out.println(jsonData);
	    		
	    		out.write(jsonData);
	    	}
	    	out.flush();
	    } 
    	catch(Exception ex) {
	    	ex.printStackTrace();
	    }
	  	finally {
	        out.close();
	        p.runDB.closeAll();
        }
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	processRequest(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	processRequest(request, response);
    }
}
