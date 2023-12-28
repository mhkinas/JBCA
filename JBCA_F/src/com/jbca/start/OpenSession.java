package com.jbca.start;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.*;
//import javax.sql.*;
//import java.util.*;
//import oracle.jdbc.driver.*;

import com.jbca.base.BaseParameters;
import com.sdb.bean.MessageBean;
import com.sdb.dbwork.*;//
//import com.sdb.management.*;
//import com.sdb.utility.*;
import com.sdb.utility.SHAConverter;

@WebServlet(urlPatterns = "/openSession",
			loadOnStartup = 1,
			asyncSupported = true)
public class OpenSession extends HttpServlet 
{
	private static final long serialVersionUID = 406070615950217372L;

	String userName, userCode, userPassword, userGroup, pageSize, lang;
    String errorString="null errorString", messageString="null messageString";

    boolean dbQuery;
	String[] queryString;
    ResultSet resultSet; 
    
    BaseParameters p;
    RunDB runDB;
    /*If you want to don't use BaseParameters */
	//String jndiName = "jdbc/jbcaDS";  
    //int dbSystem = RunDB.MARIADB, connType = RunDB.DATASOURCE;  
    MessageBean messageBean;
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        queryString = new String[1];
        
        request.setCharacterEncoding("UTF-8");
        userCode = request.getParameter("login_name");
        
        if (userCode != null && userCode.length() > 0) 
        {
			lang = request.getParameter("lang");
			
            userPassword = request.getParameter("login_password");
            String hashedPsw = SHAConverter.getEncoded("SHA-256", userPassword.trim(), StandardCharsets.UTF_8);

            queryString[0] = "select * from vt_jbc_user where user_code='"+userCode.trim()+
            					"' and user_psw='"+hashedPsw+"' and rec_status='Active'";
            
            try{
            	messageBean = new MessageBean(true);
            	p = new BaseParameters();
            	p.setLangLoc();
            	p.initParams();
            	runDB = p.runDB;
            	p.isDebug = true;
            	/*If you want to don't use BaseParameters */
            	//runDB = new RunDB(dbSystem, connType); 
            	//runDB.setDB(jndiName);

            	if(p.isDebug) System.out.println(queryString[0]);
                
            	if(runDB.runQuery(queryString, 0, RunDB.QUERY))
            	{
	    			resultSet = runDB.getResultSet();
	    			
	    			 if (resultSet.next())
	    			 {
	    				 userName = resultSet.getString("user_name");
	    				 userGroup = resultSet.getString("user_group");
	    			     pageSize = resultSet.getString("page_size");
	    			     
	    			     dbQuery = true;
	    			 }/*else if(userCode.equals("yourName") && userPassword.equals("your_Passw4Login"))
	    			 {
	    				 userName = "Your Name";
	    				 userGroup = "Admin";
	    				 pageSize = "100";

	    			     dbQuery = true; 
	    			 }*/
	    			 else {
	    				 dbQuery = false;
	    				 messageString = messageBean.getInvalidPassword();
	    			 }
            	}else {
            		dbQuery = false;
            		messageString = messageBean.getSelectExecErr();
					errorString = runDB.getErrorString();
            	}
            	if(p.isDebug) {
            		//if(!messageString.equals("null messageString")) 
            			System.out.println(messageString);
            		//if(!errorString.equals("null errorString")) 
            			System.out.println(errorString);
            	}
            }
            catch(SQLException e)
            {
    			e.printStackTrace();
                dbQuery = false;
            }
            if (dbQuery)
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("ses_name", userName);
                session.setAttribute("ses_code", userCode);
                session.setAttribute("ses_group", userGroup);
                session.setAttribute("ses_psize", pageSize);

				try {
					if(lang.equals("en"))
					{
						if(userGroup.equals("Admin"))
							response.sendRedirect(request.getContextPath() + "/admin/admin.jsp");
						else if(userGroup.equals("Supervisor"))
							response.sendRedirect(request.getContextPath() + "/user/user.jsp");
						else if(userGroup.equals("Normal"))
							response.sendRedirect(request.getContextPath() + "/user/mesaj-rew.jsp");
					}else
					{
						if(userGroup.equals("Admin"))
							response.sendRedirect(request.getContextPath() + "/admin/yonetim.jsp");
						else if(userGroup.equals("Supervisor"))
							response.sendRedirect(request.getContextPath() + "/user/kullanici.jsp");
						else if(userGroup.equals("Normal"))
							response.sendRedirect(request.getContextPath() + "/user/mesaj-bak.jsp");
					}
                } catch(Exception ex) {
                	ex.printStackTrace();
                }
            }else {
                try {
					request.setAttribute("u_name", userCode);
					
					if(!errorString.equals("null errorString"))
						request.setAttribute("error_string", errorString);
					
					request.setAttribute("sql_string", queryString[0]);
					
					if(!messageString.equals("null messageString"))
						request.setAttribute("msg_string", messageString);
              		
					if(lang.equals("en"))
						request.getRequestDispatcher("start/login-error.jsp").forward(request, response);
					else
						request.getRequestDispatcher("start/giris-hatasi.jsp").forward(request, response);
                } 
                catch(Exception ex) {
                	ex.printStackTrace();
                }
            }
        }
        else {
            try {
            	if(lang.equals("en"))
            		request.getRequestDispatcher("start/login.jsp").forward(request, response);
            	else
            		request.getRequestDispatcher("start/giris.jsp").forward(request, response);
            } catch(Exception ex) {
            	ex.printStackTrace();
            }
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
