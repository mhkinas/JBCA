package com.website.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.sdb.utility.JsonConverter;
import com.sdb.utility.ValueChecker;
import com.website.params.ContactParams;

@WebServlet(urlPatterns = "/contactServlet", 
			loadOnStartup = 1,
			asyncSupported = true)
@MultipartConfig (fileSizeThreshold = 1024*1024, 
				  maxFileSize = 1024*1024*5, 
				  maxRequestSize = 1024*1024*5*5) // location = StaticParams.mPLocation,
public class ContactServlet extends HttpServlet
{
	private static final long serialVersionUID = -4049416888867770885L;

	private ContactParams p;
	
    @SuppressWarnings("unused")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json; charset=UTF-8"); 
        
        Collection<Part> parts = request.getParts();
        
        p = new ContactParams();
        p.isLocale = request.getParameter("isLocale").equals("true");
		p.initParams();

        p.action = request.getParameter("action");

        boolean dbQuery = false, isInsert = p.action.equals("insert");
        String jsonData = "", msgStr = "", fileNP = "", errorString = null, filePath = null, sqlStr = null; 
    	String[] messages;
    	int formSize = 0, n=0;
    	
    	DateTimeFormatter dateTF = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    	LocalDateTime now = LocalDateTime.now();
    	
    	PrintWriter out = null;

    	try 
    	{
         	if(p.action == null)
	    		return;
         	
    		if(!isInsert)
    			return;
	    	else  // New record for db, update and delete records to/from db
	    	{
	    		System.out.println("Contactservlet: debug 11");
	    		out = response.getWriter();
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize];
	    		p.dateFormatter.setIsForm(true);
	    		p.tableData = new String[1][formSize];

	    		if(isInsert) {	p.formData[0] = "0"; n=1; }
	    		
	    		for(int i=n; i < formSize-1; i++) {
	    			
	    			p.formData[i] = request.getParameter(p.fieldNames[i]); // Get form values.
	    			System.out.println("p.fieldNames[i]: "+p.fieldNames[i]+": "+p.formData[i]);
	    		}
	    		p.formData[formSize-1] = dateTF.format(now);
	    		System.out.println("p.formData["+(formSize-1)+"]: "+p.formData[formSize-1]);
	    		
	    		p.formData[4] = ValueChecker.remUnvChr(p.formData[4]);
	    		System.out.println("Contactservlet: debug 12"+"\n p.formData[4]: "+p.formData[4]);

	    		dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);
	    		
	    		if(p.isDebug) {
	    			sqlStr = ("SQL:"+ p.prepareQuery.getQueryStr());
	    			System.out.println(sqlStr); 
	    		}
	    		if(dbQuery) {
	    			
	    			p.tableData[0] = p.formData;
	    		}	    		
	    		messages = p.executeTable.getMessages();

	    		p.executeTable.setMessages(messages);
	    		
	    		if(errorString != null)
	    		{
	    			if(messages[2].equals("null errorString"))
	    				messages[2] = errorString;
	    			else
	    				messages[2] += errorString;
	    		}
	    		//Convert data to json
	    		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.executeTable);
	    		jsonData = p.jsonConverter.convert2Json();
	    		
	    		out.write(jsonData);
	    	}
    		out.flush();
	    } 
    	catch(Exception ex) 
    	{
	    	ex.printStackTrace();
	    }
	  	finally 
	  	{
	        if(out != null)
	        {
	            out.close();
	        }
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
