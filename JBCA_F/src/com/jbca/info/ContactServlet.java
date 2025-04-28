package com.jbca.info;

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

import com.jbca.base.BaseParameters;
import com.jbca.base.BaseProcesses;
import com.sdb.utility.JsonConverter;
import com.sdb.utility.ValueChecker;

@WebServlet(urlPatterns = "/contactServlet", 
			loadOnStartup = 1,
			asyncSupported = true)
@MultipartConfig (fileSizeThreshold = 1024*1024, 
				  maxFileSize = 1024*1024*5, 
				  maxRequestSize = 1024*1024*5*5) // location = StaticParams.mPLocation,
public class ContactServlet extends HttpServlet
{
	private static final long serialVersionUID = 3854735151614295643L;

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

    	if(p.action == null || p.action.equals("empty"))
    		return;

    	BaseProcesses process = new BaseProcesses(request, response, p);
    	 
    	process.checkSession();

    	String jsonData = "", msgStr = "", fileNP = "", errorString = null, filePath = null; 
    	boolean dbQuery = false, isUpdate = p.action.equals("update");
    	String[] messages;
    	int formSize = 0, n=0;
    	
    	DateTimeFormatter dateTF = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    	LocalDateTime now = LocalDateTime.now();
    	
    	PrintWriter out = null;

    	try 
    	{
         	p.sessionBean.setCode(process.httpSession.getAttribute("ses_code").toString()); 
         	p.sessionBean.setName(process.httpSession.getAttribute("ses_name").toString()); 
         	p.sessionBean.setGroup(process.httpSession.getAttribute("ses_group").toString());

         	process.checkAuthorized(p);
         	
    		if(p.action.equals("select")) // Record search from db
	    	{
        		out = response.getWriter();
	    		formSize = p.selectFields.length;
	    		p.formData = new String[formSize];
	    		p.dateFormatter.setIsForm(true);
	    		p.dateFormatter.setHourFormat(BaseParameters.NO);
	    		
	    		for(int i=0; i < formSize; i++) {
	    			p.formData[i] = request.getParameter(p.selectFields[i]); // Get form values.
	    		}
	    		dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);
	    		
	    		if(dbQuery) {
	    			p.tableData = p.execTableWR.selectData(p.dataType);
	    			//p.setPasX(3);
	    		}
	    		else
	    			p.tableData = null;
	    		
	    		messages = p.execTableWR.getMessages();
	    		
	    		msgStr = Integer.valueOf(formSize).toString();
	    		if(messages[1].equals(p.execTableWR.getDefMsgScr()))
	    			messages[1] = " ";
	    		messages[1] += msgStr+", sqlString: "+p.execTableWR.getQueryString();

	    		p.execTableWR.setMessages(messages);
	    		
	    		//Convert data to json
	    		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.execTableWR);
	    		jsonData = p.jsonConverter.convert2Json();
	    		
	    		out.write(jsonData);
	    	}
	    	else if( p.action.equals("update") || p.action.equals("delete"))  // Update and delete records to/from db
	    	{
	    		out = response.getWriter();
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize];
	    		p.dateFormatter.setIsForm(true);

	    		for(int i=n; i < formSize-2; i++) {
	    			p.formData[i] = request.getParameter(p.fieldNames[i]); // Get form values.
	    		}
	    		p.formData[4] = ValueChecker.remUnvChr(p.formData[4]);

	    		p.formData[formSize-2] = p.sessionBean.getCode();
	    		p.formData[formSize-1] = dateTF.format(now);

	    		dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);
	    		
	    		if(dbQuery) {
	    			p.logBean.setLog(p, formSize);
	    			
	    			p.tableData = new String[1][formSize];
	    			
   	    			p.tableData[0] = p.formData;
	       			
	    			if(isUpdate)
	    			{
		       			if(p.tableData[0] != null && p.tableData[0][formSize-1] != null)
		       				p.tableData[0][formSize-1] = p.dateFormatter.changeDateFormat((String) p.tableData[0][formSize-1]);
		       			else
		       				msgStr += ", Attention: p.tableData[0]["+(formSize-1)+"] is null";
	    			}
	    		}else
	    			p.tableData = null;
	    		
	    		messages = p.execTableWR.getMessages();

	    		if(p.tableData != null)
	    			msgStr += ", fileNP = " + fileNP + ", p.tableData[0][0] = " + p.tableData[0][0].toString();
	    		if(messages[1].equals(p.execTableWR.getDefMsgScr()))
	    			messages[1] = " ";
	    		messages[1] += msgStr+", sqlString: "+p.execTableWR.getQueryString();

	    		p.execTableWR.setMessages(messages);
	    		
	    		if(errorString != null) {
	    			if(messages[2].equals("null errorString"))
	    				messages[2] = errorString;
	    			else
	    				messages[2] += errorString;
	    		}
	    		
	    		//Convert data to json
	    		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.execTableWR);
	    		jsonData = p.jsonConverter.convert2Json();
	    		
	    		out.write(jsonData);
	    	}
	    } 
    	catch(Exception ex) 
    	{
	    	ex.printStackTrace();
	    }
	  	finally 
	  	{
	        if(out != null)
	        {
		    	out.flush();
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
