package com.jbca.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sdb.bean.KeyDataBean;
import com.sdb.dbwork.RunDB;

public class GeneralParamBean {

	private String tableName, keyField, keyData, valueField;
	private String[] unqField;
	
	private RunDB runDB;
	private ResultSet resultSet;
	private boolean dbQuery = false;
	
	private String errorString = "null errorString"; 

	public GeneralParamBean(RunDB runDB, String tableName, String keyField, String[] unqField, String valueField)
	{
		this.runDB = runDB;
		this.tableName = tableName;
		this.keyField = keyField;
		this.unqField = unqField;
		this.valueField = valueField;
	}
	
	public void getKeyData(String[] unqData)
	{
		KeyDataBean keyDataBean = new KeyDataBean(runDB, tableName, keyField, unqField);
		
		keyData = keyDataBean.getKeyData(unqData);
		
		keyDataBean.closeRS();
	}
	
	public String getParamVal(String keyData, boolean isKey, String[] unqData)
	{
		String valueData = null;
		String[] queryString = new String[1];
		
		try{
			if(!isKey)
				getKeyData(unqData);
			else
				this.keyData = keyData;
			
			queryString[0] = "select "+valueField+" from "+tableName+" where "+keyField+"="+this.keyData; 
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery)
			{
				resultSet = runDB.getResultSet();
			
				if (resultSet.next())
				{
					valueData = resultSet.getString(1);
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
		return valueData;
	}
	
	
	public boolean setParamVal(String keyData, boolean isKey, String[] unqData, String valueData) 
	{
		String[] queryString = new String[1];
		
		try{
			if(!isKey)
				getKeyData(unqData);
			else
				this.keyData = keyData;

			queryString[0] = "update "+tableName+" set "+valueField+"="+valueData+" where "+keyField+"="+this.keyData;
			
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
