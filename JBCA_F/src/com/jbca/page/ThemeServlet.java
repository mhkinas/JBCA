package com.jbca.page;

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

@WebServlet(urlPatterns = "/themeServlet", 
			loadOnStartup = 1,
			asyncSupported = true)
@MultipartConfig (fileSizeThreshold = 1024*1024, 
				 maxFileSize = 1024*1024*5, 
				 maxRequestSize = 1024*1024*5*5)
public class ThemeServlet extends HttpServlet
{
	private static final long serialVersionUID = 592694135462052763L;

	private ThemeParams p;
	
    @SuppressWarnings("unused")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json; charset=UTF-8"); 
        
        Collection<Part> parts = request.getParts();
        
        p = new ThemeParams();
        p.isLocale = request.getParameter("isLocale").equals("true");
		p.initParams();

        p.action = request.getParameter("action");

    	if(p.action == null || p.action.equals("empty"))
    		return;

    	BaseProcesses process = new BaseProcesses(request, response, p);
    	 
    	process.checkSession();

    	String jsonData = "", msgStr = ""; 
    	boolean dbQuery = false, isInsert = p.action.equals("insert");
    	String[] messages;
    	int formSize = 0, n=0;
    	
    	DateTimeFormatter dateTF = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    	LocalDateTime now = LocalDateTime.now();
    	
    	PrintWriter out = response.getWriter();

    	try 
    	{
         	p.sessionBean.setCode(process.httpSession.getAttribute("ses_code").toString()); 
         	p.sessionBean.setName(process.httpSession.getAttribute("ses_name").toString()); 
         	p.sessionBean.setGroup(process.httpSession.getAttribute("ses_group").toString());

         	process.checkAuthorized(p);
         	
    		if(p.action.equals("select")) // Record search from db
	    	{
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
	    	else  // New record for db, update and delete records to/from db
	    	{
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize];
	    		p.dateFormatter.setIsForm(true);

	    		if(isInsert) { p.formData[0] = "0"; n=1; }
	    		
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
	    			if(!isInsert)
	    			{
		       			if(p.tableData[0] != null && p.tableData[0][5] != null)
		       				p.tableData[0][5] = p.dateFormatter.changeDateFormat((String) p.tableData[0][5]);
		       			else
		       				msgStr += ", Attention: p.tableData[0][5] is null";
	    			}
	    		}else
	    			p.tableData = null;
	    		
	    		messages = p.execTableWR.getMessages();

	    		msgStr += ", " + Integer.valueOf(formSize).toString();
	    		if(messages[1].equals(p.execTableWR.getDefMsgScr()))
	    			messages[1] = " ";
	    		messages[1] += msgStr+", sqlString: "+p.execTableWR.getQueryString();
	    		
	    		p.execTableWR.setMessages(messages);
	    		
	    		//Convert data to json
	    		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.execTableWR);
	    		jsonData = p.jsonConverter.convert2Json();
	    		
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
