package com.website.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.website.params.BaseParameters;
import com.sdb.bean.CodeBean;
import com.sdb.bean.MenuBean;
import com.sdb.bean.PageBean;
import com.sdb.dbwork.RunDB;

public class LinPageBean {

	private String keyField, pageField, theme, menuField;
	private String[] tableNames, unqField, unqFieldM, unqData = new String[1];

	private RunDB runDB;
	private ResultSet resultSet;
	private boolean dbQuery = false;
    //private String jndiName = "jdbc/jbcaDS";  
    private int dbSystem; //connType, 
    private BaseParameters p;
	
	private String errorString = "null errorString";
	private boolean isDebug = false;

	public LinPageBean()
	{
		p = new BaseParameters();
		p.setLangLoc();
        p.initParams();
        //dbSystem = p.dbSystem;
        //connType = p.connType;
        
		this.runDB = p.runDB;
    	
    	initBean();
	}

	public LinPageBean(RunDB runDB)
	{
    	this.runDB = runDB; 
    	
    	initBean();
	}

    public void initBean()
    {
    	tableNames = new String[] {"jbc_page","vt_jbc_page"}; // "jbc_page";
		keyField = "id";
		unqField = new String[] {"page_name","adr_path"};
		unqFieldM = new String[] {"menu_name","adr_path"};
		pageField = "page_data";
		menuField = "menu_data";
	}
	
	public String getLinPage(String linkName)
	{
		String pageData = null;
		String[] queryString = new String[1];
		PageBean pageBean = new PageBean(runDB, tableNames, keyField, unqField, pageField, dbSystem);
		
		try{
			queryString[0] = "select linked_page, theme from vt_jbc_page_link where link_name='"+linkName+"'"; 
			System.out.println(queryString[0]);
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery)
			{
				resultSet = runDB.getResultSet();
			
				if (resultSet.next())
				{
					unqData[0] = resultSet.getString(1);
					
					theme = resultSet.getString(2);
					
					System.out.println("unqData[0] : "+unqData[0]+", theme : "+theme);
					
					pageData = pageBean.getPage(null, false, unqData);
					
					if(isDebug && pageData != null) System.out.println("pageData : "+pageData);
					
					if(isDebug)  // For debugging
						System.out.println(pageBean.getErrorString()+"\n sql:"+queryString[0]); 
					
				}else
				{
					errorString = "Record did not found!";
				}
			}else
			{
				errorString = "Query did not work! SQL : " + queryString[0];
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			if(!runDB.getErrorString().equals("null errorString"))  
				errorString = runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
        }
		return pageData;
	}
	
	public String getThemePage(String position)
	{
		String pageData = null;
		String[] queryString = new String[1];
		PageBean pageBean = new PageBean(runDB, tableNames, keyField, unqField, pageField, dbSystem);

		try{
			queryString[0] = "select mapped_page from vt_jbc_page_map where theme='"+theme + 
							 "' and position='"+position+"'"; 
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery)
			{
				resultSet = runDB.getResultSet();
			
				if (resultSet.next())
				{
					unqData[0] = resultSet.getString(1);
					
					pageData = pageBean.getPage(null, false, unqData);
					
					if(isDebug) { // For debugging
						System.out.println(pageBean.getErrorString()+"\n sql:"+queryString[0]); 
					}
				}else
				{
					errorString = "Record did not found!";
				}
			}else
			{
				errorString = "Query did not work! SQL : " + queryString[0];
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			if(!runDB.getErrorString().equals("null errorString"))  
				errorString = runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
        }
		return pageData;
	}
	
	public String getMenuStr()
	{
		String menuData = null;
		String[] queryString = new String[1];
		tableNames = new String[] {"jbc_menu","vt_jbc_menu"};
		MenuBean menuBean = new MenuBean(runDB, tableNames, keyField, unqFieldM, menuField);
		
		try{
			queryString[0] = "select theme_menu from vt_jbc_theme where theme_name='"+theme+"'"; 
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery)
			{
				resultSet = runDB.getResultSet();
			
				if (resultSet.next())
				{
					unqData[0] = resultSet.getString(1);
					
					menuData = menuBean.getMenu(null, false, unqData);
					
					if(isDebug) { // For debugging
						System.out.println(menuBean.getErrorString()+"\n sql:"+queryString[0]); 
					}
					
				}else
				{
					errorString = "Record did not found!";
				}
			}else
			{
				errorString = "Query did not work! SQL : " + queryString[0];
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			if(!runDB.getErrorString().equals("null errorString"))  
				errorString = runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
        }
		return menuData;
	}
	
	public String getHeadLink(String hLName)
	{
		String codeData = null;
		CodeBean codeBean = new CodeBean(runDB, new String[] {"jbc_code","vt_jbc_code"}, "id", new String[] {"code_name","adr_path"}, 
										 "code_data", dbSystem);
		try{
			unqData[0] = hLName;
			
			codeData = codeBean.getCode(null, false, unqData);
			
			if(isDebug) { // For debugging
				System.out.println(codeBean.getErrorString()); 
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			errorString = "HeadLink Error: "+e;
        }
		return codeData;
	}
	
	public boolean checkCodeMap(String linkName, String hLName)
	{
		boolean isExist = false;
		String[] queryString = new String[1];
		
		try{
			queryString[0] = "select * from vt_jbc_code_map where page_link='"+linkName+"' and mapped_code='"+hLName+"'";
		
			isExist  = runDB.runQuery(queryString, 0, RunDB.QUERY);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			if(!runDB.getErrorString().equals("null errorString"))  
				errorString = runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
        }
		
		return isExist;
	}
	
	public void closeAll() 
	{
	  try
	  {
	    runDB.closeAll();
	  } 
	  catch(Exception e) 
	  { 
	    errorString = "close Error: "+e;
	    System.out.println(errorString);
	  }
	}
	
	public String getErrorString() {
		return errorString;
	}
}
