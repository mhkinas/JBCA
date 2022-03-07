package com.jbca.bean;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.sdb.bean.KeyDataBean;
//import com.sdb.bean.KeyDataBean;
import com.sdb.dbwork.RunDB;

public class ExcRateBean {

	private String keyField, keyData;
	private String[] tableName, fieldNames, unqField, doubleField;
	
	private RunDB runDB;
	private ResultSet resultSet;
	private boolean dbQuery;
	
	private String errorString = "null errorString"; 

	public ExcRateBean(RunDB runDB, String[] tableName, String[] unqField, String[] fieldNames, String[] doubleField) {
		
		this.runDB = runDB;
		this.tableName = tableName;
		keyField = "id";
		this.unqField = unqField;
		this.fieldNames = fieldNames;
		this.doubleField = doubleField;
		dbQuery = false;
	}
	
	public void getKeyData(String[] unqData)
	{
		KeyDataBean keyDataBean = new KeyDataBean(runDB, tableName[1], keyField, unqField);
		
		keyData = keyDataBean.getKeyData(unqData);
		
		keyDataBean.closeRS();
	}
	
	public BigDecimal[] getExcRateDec(String keyData, boolean isKey, String[] unqData) {
		
		BigDecimal[] excData = null;
		String[] queryString = new String[1];
		
		try{
			if(!isKey)
				getKeyData(unqData);
			else
				this.keyData = keyData;
			
			queryString[0] = "select ";
			
			for(int i = 0; i < doubleField.length; i++) {
				
				if(i != 0) queryString[0] += ",";
				
				queryString[0] += doubleField[i];
			}
			
			queryString[0] += " from "+tableName[0]+" where ";
			
			queryString[0] += keyField+"=" + this.keyData;
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery) {
				
				excData = new BigDecimal[doubleField.length];
				
				resultSet = runDB.getResultSet();
			
				if (resultSet.next()) {
					
					for(int i = 0; i < excData.length; i++) {
					
						excData[i] = resultSet.getBigDecimal(i+1);
					}
				}
				else {
					
					errorString = "Record did not found!";
				}
			}else {
				
				errorString = "Query did not work! SQL : " + queryString[0];
			}
		}
		catch(SQLException e) {
			
			e.printStackTrace();
			
			if(!runDB.getErrorString().equals("null errorString"))  
				errorString = "RunDB "+runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
        }
		return excData;
	}
	
	public String[] getExcRateStr(String keyData, boolean isKey, String[] unqData) {
		
		String[] excData = null;
		String[] queryString = new String[1];
		
		try{
			if(!isKey)
				getKeyData(unqData);
			else
				this.keyData = keyData;
			
			queryString[0] = "select ";
			
			for(int i = 0; i < doubleField.length; i++) {
				
				if(i != 0) queryString[0] += ",";
				
				queryString[0] += doubleField[i];
			}
			
			queryString[0] += " from "+tableName[1]+" where ";
			
			queryString[0] += keyField + "=" + this.keyData;
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.QUERY);
        	
			if(dbQuery) {
				
				excData = new String[doubleField.length];
				
				resultSet = runDB.getResultSet();
			
				if (resultSet.next()) {
					
					for(int i = 0; i < excData.length; i++) {
					
						excData[i] = resultSet.getString(i+1);
					}
				}
				else {
					
					errorString = "Record did not found!";
				}
			}else {
				
				errorString = "Query did not work! SQL : " + queryString[0];
			}
		}
		catch(SQLException e) {
			
			e.printStackTrace();
			
			if(!runDB.getErrorString().equals("null errorString"))  
				errorString = "RunDB "+runDB.getErrorString();
			else
				errorString = "SQL Error : " + e.getMessage();

			errorString += ", SQL : " + queryString[0];
        }
		return excData;
	}
	
	public boolean setExcRate(String keyData, boolean isKey, String[] unqData, String[] excData) {
		
		String[] queryString = new String[1];
		
		DateTimeFormatter dateTF = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    	LocalDateTime now = LocalDateTime.now();
    	
    	try{
    		if(!isKey)
				getKeyData(unqData);
			else
				this.keyData = keyData;
			
			int formSize = fieldNames.length;
			
    		queryString[0] = "update "+tableName[0]+ " set ";
			
			for(int i = 0; i < doubleField.length; i++) {
				
				//if(i != 1) queryString[0] += ",";
				
				queryString[0] += doubleField[i] + "=" + excData[i]+", ";
			}
			
			queryString[0] += fieldNames[formSize-2]+"=(select id from jbc_user where user_code = 'merkezbank'), "+
								fieldNames[formSize-1]+"='"+dateTF.format(now)+"' where ";
			
			queryString[0] += keyField + "=" + this.keyData;

			System.out.println("queryString[0]: " + queryString[0]);
			
			dbQuery = runDB.runQuery(queryString, 0, RunDB.UPDATE);
		}
		catch(SQLException e) {
			
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
	
	public void closeAll() {
		
		try {
			
			if (resultSet != null) resultSet.close();

			runDB.closeAll();
		} 
		catch(SQLException e) {
			
			errorString = "close Error: "+e;
		}
	}
	
	public String getErrorString() {
		return errorString;
	}
}
