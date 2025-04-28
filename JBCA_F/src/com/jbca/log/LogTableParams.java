package com.jbca.log;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.utility.DateFormatter;

public class LogTableParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_log_table","jbc_log_table"};
		fieldNames = new String[] {"id","log_table_name"};
		inputTypes = new String[] {"number","text"};
		selectFields = new String[] {"id","log_table_name"};
		selectITs = new String[] {"number","text"};
		setLabels();
		equalityInt = new int[] {EQ, LK};
		colWidths = new int[] {10,20};
		readOnlyFM = new int[] {0,-1};
		requiredFM = new int[] {-1,1};
		invisibleFM = new int[] {-1,-1};
		unqFields = new String[] {"log_table_name"}; 
		unqFieldTypes = new int[] {STRING};
		unqMatchs = new int[] {-1,1};
		fieldTypes = new int[] {INTEGER,STRING};
		selectFTs = new int[] {INTEGER,STRING};
		dataType = STRING;
		orderBy = "id";
		dateFormatter = new DateFormatter(dbSystem);
		prepareQuery = new PrepareQuery();
		prepareQuery.convert2EQLs(equalityInt);
		executeTable = new ExecuteTable(runDB, tableNames, fieldNames, fieldTypes, orderBy, dateFormatter, 
										selectFields, selectFTs, messageBean);
		executeTable.isAfterCommit = false; executeTable.isDebug = isDebug; authorized = new String[] {"Admin","Supervisor"};
		isModal = true; isWithRefs = false;
	}

	public void setLabels() 
	{
		if(isLocale) 
		{
			jspTitle = "Log Tablo";
			labelNames = new String[] {"ID","Log Tablo"};
		}
		else 
		{
			jspTitle = "Log Table";
			labelNames = new String[] {"ID","Log Table"};
		}
	}
}
