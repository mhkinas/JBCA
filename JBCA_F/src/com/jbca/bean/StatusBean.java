package com.jbca.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sdb.bean.KeyDataBean;
import com.sdb.dbwork.RunDB;

public class StatusBean {

	private String tableName, keyField, keyData, statusField;
	private String[] unqField;
	
	private RunDB runDB;
	private ResultSet resultSet;
	private boolean dbQuery = false;
	
	private String errorString = "null errorString"; 

	public StatusBean(RunDB runDB, String tableName, String keyField, String[] unqField, String statusField)
	{
		this.runDB = runDB;
		this.tableName = tableName;
		this.keyField = keyField;
		this.unqField = unqField;
		this.statusField = statusField;
	}
	
	public void getKeyData(String[] unqData)
	{
		KeyDataBean keyDataBean = new KeyDataBean(runDB, tableName, keyField, unqField);
		
		keyData = keyDataBean.getKeyData(unqData);
		
		keyDataBean.closeRS();
	}
	
	public String getStatus(String keyData, boolean isKey, String[] unqData)
	{
		String statusData = null;
		String[] queryString = new String[1];
		
		try{
			if(!isKey)
				getKeyData(unqData);
			else
				this.keyData = keyData;
			
			queryString[0] = "select "+statusField+" from "+tableName+" where "+keyField+"="+this.keyData; 
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery)
			{
				resultSet = runDB.getResultSet();
			
				if (resultSet.next())
				{
					statusData = resultSet.getString(1);
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
				errorString = "RunDB "+runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
        }
		return statusData;
	}
	
	
	public boolean setStatus(String keyData, boolean isKey, String[] unqData, String statusData) 
	{
		String[] queryString = new String[1];
		
		try{
			if(!isKey)
				getKeyData(unqData);
			else
				this.keyData = keyData;

			queryString[0] = "update "+tableName+" set "+statusField+"="+statusData+" where "+keyField+"="+this.keyData;
			
			runDB.runQuery(queryString, 0, RunDB.UPDATE);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			if(!runDB.getErrorString().equals("null errorString"))  

				errorString = "RunDB "+runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
			return false;
        } 
		return true;
	}
	
	public void closeAll() 
	{
	  try
	  {
	    if (resultSet != null) resultSet.close();

	    runDB.closeAll();
	  } 
	  catch(SQLException e) 
	  { 
	    errorString = "close Error: "+e;
	  }
	}
	
	public String getErrorString() {
		return errorString;
	}
}
