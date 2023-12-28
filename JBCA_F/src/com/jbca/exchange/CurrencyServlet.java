package com.jbca.exchange;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.jbca.base.BaseProcesses;
import com.sdb.utility.JsonConverter;

@WebServlet(urlPatterns = "/currencyServlet", 
loadOnStartup = 1,
asyncSupported = true)
@MultipartConfig (fileSizeThreshold = 1024*1024, 
		maxFileSize = 1024*1024*5, 
		maxRequestSize = 1024*1024*5*5) 
public class CurrencyServlet extends HttpServlet {
	
	private static final long serialVersionUID = -7355129809828963957L;
	
	private CurrencyParams p;
	
    @SuppressWarnings("unused")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        request.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json; charset=UTF-8"); 
        
        Collection<Part> parts = request.getParts();
	
        p = new CurrencyParams();
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
    	
    	PrintWriter out = response.getWriter();

    	try 
    	{
         	p.sessionBean.setCode(process.httpSession.getAttribute("ses_code").toString()); 
         	p.sessionBean.setName(process.httpSession.getAttribute("ses_name").toString()); 
         	p.sessionBean.setGroup(process.httpSession.getAttribute("ses_group").toString());

         	process.checkAuthorized(p);
         	
	    	if(p.action.equals("select"))
	    	{
	    		formSize = p.selectFields.length; 
	    		p.formData = new String[formSize];
	    		
	    		for(int i=0; i < formSize; i++) {
	    			p.formData[i] = request.getParameter(p.selectFields[i]);
	    		}
	    		dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);
	    		
	    		if(dbQuery)
	    			p.tableData = p.executeTable.selectData(p.dataType);
	    		else
	    			p.tableData = null;
	    		
	    		messages = p.executeTable.getMessages();
	    		
	    		p.executeTable.setMessages(messages);
	    		
	    		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.executeTable);
	    		jsonData = p.jsonConverter.convert2Json();
	    		
	    		out.write(jsonData);
	    	}
	    	else {
	    		formSize = p.fieldNames.length; 
	    		p.formData = new String[formSize]; 
	    		
	    		if(isInsert) {	p.formData[0] = "0"; n=1; }
	    		
	    		for(int i=n	; i < formSize; i++) {
	    			p.formData[i] = request.getParameter(p.fieldNames[i]);
	    		}
	    		dbQuery = p.executeTable.tableAction(p.action, p.formData, p.prepareQuery);
	    		
	    		if(dbQuery) {
	    			p.tableData = new String[1][formSize];
	    			
	    			if(isInsert)
	    			{
		    			int k=0;
		    			p.unqFieldData = new String[p.unqFields.length];
		    			p.tableData = new String[1][formSize];
		    			
		    			for(int i=0; i < formSize; i++)
		    			{
		    				if(i == p.unqMatchs[i])
		    				{
		    					p.unqFieldData[k] = p.formData[i];
		    					k++;
		    				}
		    			}
		    			p.tableData[0] = p.executeTable.getNewRecord(p.unqFields, p.unqFieldData, p.unqFieldTypes, p.prepareQuery);
    				}else
    	    			p.tableData[0] = p.formData;
	    		}else
	    			p.tableData = null;
	    		
	    		messages = p.executeTable.getMessages();

	    		msgStr += Integer.valueOf(formSize).toString();
	    		if(messages[1].equals("ExecuteTable null messageScript"))
	    			messages[1] = "";
	    		messages[1] += msgStr+", sqlString: "+p.executeTable.getQueryString();
	    		
	    		p.executeTable.setMessages(messages);

	    		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.executeTable);
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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	processRequest(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	processRequest(request, response);
    }
 }
