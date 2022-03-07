package com.jbca.file;

import java.io.IOException;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jbca.base.BaseParameters;
import com.jbca.base.BaseProcesses;
import com.sdb.utility.JsonConverter;

@WebServlet(urlPatterns = "/fileServlet", 
			loadOnStartup = 1,
			asyncSupported = true)
@MultipartConfig (fileSizeThreshold = 1024*1024, 
				  maxFileSize = 1024*1024*5, 
				  maxRequestSize = 1024*1024*5*5) // location = StaticParams.mPLocation,
public class FileServlet extends HttpServlet
{
	private static final long serialVersionUID = -4049416888867770885L;

	private FileParams p;
	
    @SuppressWarnings("unused")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json; charset=UTF-8"); 
        
        Collection<Part> parts = request.getParts();
        
        p = new FileParams();
        p.isLocale = request.getParameter("isLocale").equals("true");
		p.initParams();

        p.action = request.getParameter("action");

    	if(p.action == null || p.action.equals("empty"))
    		return;

    	BaseProcesses process = new BaseProcesses(request, response, p);
    	 
    	process.checkSession();

    	String jsonData = "", msgStr = "", fileNP = "", errorString = null, filePath = null; 
    	boolean dbQuery = false, isInsert = p.action.equals("insert"), isUpdate = p.action.equals("update");
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
	    		
	    		//Convert data to json
	    		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.execTableWR);
	    		jsonData = p.jsonConverter.convert2Json();
	    		
	    		out.write(jsonData);
	    		out.flush();
	    	}else
    		if(p.action.equals("download")) // File download from db
	    	{
    			response.setContentType("application/octet-stream"); 
    	        
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize];

	    		for(int i=n; i < formSize-2; i++) {
	    			p.formData[i] = request.getParameter(p.fieldNames[i]); // Get form values.
	    		}
	    		p.outStream = response.getOutputStream();
	    		
				p.execFileData.setKeyData(p.formData[0]);
				
				p.execFileData.tableAction(p.action, true);
				
				p.inpStream = p.execFileData.getInpStream();
	    		
				byte[] buffer = new byte[1024];
		        int bytesRead = -1;
		 
	           while ((bytesRead = p.inpStream.read(buffer)) != -1) 
	           {
	               p.outStream.write(buffer, 0, bytesRead); // Write file data to response.
	           }
               p.outStream.flush();
	    	}
	    	else  // New record for db, update and delete records to/from db
	    	{
	    		out = response.getWriter();
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize];
	    		p.dateFormatter.setIsForm(true);

	    		if(isInsert) {	p.formData[0] = "0"; n=1; }
	    		
	    		for(int i=n; i < formSize-2; i++) {
	    			p.formData[i] = request.getParameter(p.fieldNames[i]); // Get form values.
	    		}
	    		p.formData[formSize-2] = p.sessionBean.getCode();
	    		p.formData[formSize-1] = dateTF.format(now);

	    		dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);
	    		
	    		if(dbQuery) {
	    			if(!isInsert) p.logBean.setLog(p, formSize);
	    			
	    			p.tableData = new String[1][formSize];
	    			
	    			if(isInsert)
	    			{
	    				int k=0;
		    			p.unqFieldData = new String[p.unqFields.length];
		    			
		    			for(int i=0; i < formSize-2; i++)
		    			{
		    				if(i == p.unqMatchs[i])
		    				{
		    					p.unqFieldData[k] = p.formData[i];
		    					k++;
		    				}
		    			}
		       			p.tableData[0] = p.execTableWR.getNewRecord(p.unqFields, p.unqFieldData, p.unqFieldTypes, p.prepQueryWR);
		       			
		       			p.formData[0] = (String)p.tableData[0][0];
		       			
		       			p.logBean.setLog(p, formSize);
    				}else
    				{
    	    			p.formData[formSize-2] = p.sessionBean.getCode();
    	    			p.tableData[0] = p.formData;
    				}
	       			
	    			if(isUpdate)
	    			{
		       			if(p.tableData[0] != null && p.tableData[0][7] != null)
		       				p.tableData[0][7] = p.dateFormatter.changeDateFormat((String) p.tableData[0][7]);
		       			else
		       				msgStr += ", Attention: p.tableData[0][7] is null";
	    			}
	    			if(isInsert || isUpdate)
	    			{
	    				p.inpStream = request.getPart(p.fileField).getInputStream();
	    				
	    				if(p.inpStream != null)
	    				{
		    				p.execFileData.setInpStream(p.inpStream);
		    				p.execFileData.setKeyData((String)p.tableData[0][0]);
		    				
		    				if(!p.execFileData.tableAction(p.action, true))
		    					errorString = p.execFileData.getErrorString();
	    				}else
	    					fileNP = "Can't find stream";
	    				
	    				if(!p.execFileData.getMessageScript().equals("null messageScript"))
	    					msgStr += ","+p.execFileData.getMessageScript();
	    			}
	    		}else
	    			p.tableData = null;
	    		
	    		messages = p.execTableWR.getMessages();

	    		if(p.tableData != null)
	    			msgStr += ", fileNP = " + fileNP + ", p.tableData[0][0] = " + p.tableData[0][0].toString();
	    		if(messages[1].equals(p.execTableWR.getDefMsgScr()))
	    			messages[1] = " ";
	    		messages[1] += msgStr+", sqlString: "+p.execTableWR.getQueryString();

	    		System.out.println(messages[1]);
	    		
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
	    		out.flush();
	    	}
	    } 
    	catch(Exception ex) 
    	{
	    	ex.printStackTrace();
	    }
	  	finally 
	  	{
            if (p.inpStream != null) 
            {
                p.inpStream.close();
            }
            if (p.outStream != null) 
            {
                p.outStream.close();
            }
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
