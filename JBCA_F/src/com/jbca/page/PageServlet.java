package com.jbca.page;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
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

@WebServlet(urlPatterns = "/pageServlet", 
			loadOnStartup = 1,
			asyncSupported = true)
@MultipartConfig (fileSizeThreshold = 1024*1024, 
				  maxFileSize = 1024*1024*5, 
				  maxRequestSize = 1024*1024*5*5) // location = StaticParams.mPLocation,
public class PageServlet extends HttpServlet
{
	private static final long serialVersionUID = -4049416888867770885L;

	private PageParams p;
	
    @SuppressWarnings("unused")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json; charset=UTF-8"); 
        
        Collection<Part> parts = request.getParts();
        
        p = new PageParams();
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
	    		p.writer = new OutputStreamWriter(response.getOutputStream());
	    		
				p.execFileData.setKeyData(p.formData[0]);
				
				p.execFileData.tableAction(p.action, true);
				
				p.reader = p.execFileData.getReader();
	    		
				char[] buffer = new char[1]; 
		        //int bytesRead = -1;
		 
	           while (p.reader.read(buffer) > 0) 
	           {
	               p.writer.write(buffer); // Write file data to response.
	           }
               p.writer.flush();
	    	}
	    	else  // New record for db, update and delete records to/from db
	    	{
	    		out = response.getWriter();
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize];
	    		p.dateFormatter.setIsForm(true);

	    		if(isInsert) { p.formData[0] = "0"; n=1; }
	    		
	    		for(int i=n; i < formSize-2; i++) {
	    			p.formData[i] = request.getParameter(p.fieldNames[i]); // Get form values.
	    		}
	    		p.formData[formSize-2] = p.sessionBean.getCode();
	    		p.formData[formSize-1] = dateTF.format(now);

	    		//System.out.println("Database process begin!");
	    		
	    		dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);
	    		
	    		if(dbQuery) {
	    			//System.out.println("Logging process begin!");
	    			
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
		       			if(p.tableData[0] != null && p.tableData[0][6] != null)
		       				p.tableData[0][6] = p.dateFormatter.changeDateFormat((String) p.tableData[0][6]);
		       			else
		       				msgStr += ", Attention: p.tableData[0][6] is null";
	    			}
	    			if(isInsert || isUpdate)
	    			{
	    				//System.out.println("Filedata process begin!!");
	    				
	    				p.reader = new InputStreamReader(request.getPart(p.fileField).getInputStream(), StandardCharsets.UTF_8);
	    				
	    				if(p.reader != null)
	    				{
		    				p.execFileData.setReader(p.reader);//.setInpStream(p.inpStream);
		    				p.execFileData.setKeyData((String)p.tableData[0][0]);
		    				
		    				if(!p.execFileData.tableAction(p.action, true))
		    					errorString = p.execFileData.getErrorString();
	    				}else
	    				{
	    					fileNP = "Can't find stream";
	    					System.out.println(fileNP);
	    				}
	    				
	    				if(!p.execFileData.getMessageScript().equals("null messageScript"))
	    					msgStr += ","+p.execFileData.getMessageScript();
	    			}
	    		}else
	    		{
	    			p.tableData = null;
	    			System.out.println("Database process failed!");
	    		}
	    		
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
	    		out.flush();
	    	}
	    } 
    	catch(Exception ex) 
    	{
	    	ex.printStackTrace();
	    }
	  	finally 
	  	{
            if (p.reader != null) 
            {
                p.reader.close();
            }
            if (p.writer != null) 
            {
                p.writer.close();
            }
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
