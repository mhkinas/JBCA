package com.jbca.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.RunDB;
import com.sdb.utility.ValueChecker;

public class LogBean {

	private RunDB runDB;
	private ResultSet resultSet;
	private boolean dbQuery;
	
	private String[] tableNames, fieldNames, refTableNames, refFieldNames, logData, refKeyFields;
	private int[] refFieldMatchs;
	
	private String errorString = "null errorString", queryStr = null; 

	public LogBean(RunDB runDB)
	{
		this.runDB = runDB;

		tableNames = new String[] {"jbc_log","vt_jbc_log"};
		fieldNames = new String[] {"id","rec_id","form_name","type_name","jbc_table_name","log_data","rec_user","rec_date"};
		refTableNames = new String[] {"jbc_log_form","jbc_log_type","jbc_log_table","jbc_user"};
		refFieldNames = new String[] {"log_form_name","log_type_name","log_table_name","user_code"};
		refFieldMatchs = new int[] {-1,-1,2,3,4,-1,6,-1};
		refKeyFields = new String[] {"id","id","id","id"};
		
		logData = new String[fieldNames.length];
		dbQuery = false;
	}
	
	public boolean setLog(BaseParameters p, int formSize)
	{
		String refID = null;
		String[] queryString = new String[1];
		
		
		logData[0] = "0";
		logData[1] = p.formData[0];
		logData[2] = p.jspTitle;
		logData[3] = p.action;
		logData[4] = p.tableNames[0];
		logData[5] = "'{";
		for(int i=0; i < formSize-2; i++)
		{
			if(i != p.invisibleFM[i])
			{
				logData[5] += "\""+p.fieldNames[i] + "\": \""+p.formData[i]+"\"";
				
				if(i < p.fieldNames.length-3)
					logData[5] += ",";
			}
		}
		logData[5] += "}'";
		if(p.dbSystem == RunDB.SQLSERVER) logData[5] = ValueChecker.remUnvChr4Log(logData[5]);
		logData[6] = p.formData[formSize-2];
		logData[7] = p.dateFormatter.getStringToDate(p.formData[formSize-1].trim());

		queryStr = logData[5];
		
		if(p.isDebug) System.out.println(queryStr);

		try{
			queryString[0] = "insert into "+tableNames[0]+" (";
			
			for(int i=1; i < fieldNames.length; i++)
			{
				queryString[0] += fieldNames[i];
				
				if(i < fieldNames.length-1)
					queryString[0] += ",";
			}
			queryString[0] += ") values(";
			
			int j=0;
			for(int i=1; i < fieldNames.length; i++)
			{
				if(i == refFieldMatchs[i])
				{
					refID = getRefID(j, logData[i]);
					
					if(refID != null)
						queryString[0] += refID;
					else 
					{
						errorString = "Error : Number "+i+" refID is null!";
						return false;
					}
					refID = null; j++;
				}else
				{
					queryString[0] += logData[i];
				}
				if(i < fieldNames.length-1)
					queryString[0] += ",";
			}
			queryString[0] += ")";
			
			queryStr = queryString[0];

			if(p.isDebug) System.out.println(queryStr);
			
			if(!errorString.equals("null errorString"))
			{
				System.out.println(errorString);
				System.out.println(queryStr);
			}
			
			runDB.runQuery(queryString, 0, RunDB.UPDATE);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			String eStr = runDB.getErrorString();
			
			if(!eStr.equals("null errorString"))  

				errorString = "RunDB "+eStr;
			else
				errorString = "Error : " + e.getMessage();

			errorString += ", SQL : " + queryStr;
			
			System.out.println(errorString);
			
			return false;
        } 
		return true;
	}
	
	private String getRefID(int i, String refData)
	{
		String refID = null;
		String[] queryString = new String[1];
		
		try{
			queryString[0] = "select "+refKeyFields[i]+" from "+refTableNames[i]+" where "+refFieldNames[i]+" = '"+refData+"'";
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery)
			{
				resultSet = runDB.getResultSet();
			
				if (resultSet.next())
				{
					refID = resultSet.getString(1);
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
		return refID;
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
	  }
	}
	
	public int getFieldLength()
	{
		return fieldNames.length;
	}
	
	public String getErrorString() {
		return errorString;
	}

	public void setRefKeyFields(String[] refKeyFields) {
		this.refKeyFields = refKeyFields;
	}

	public String getQueryStr() {
		return queryStr;
	}
}
