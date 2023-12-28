package com.jbca.log;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.utility.DateFormatter;

public class LogTypeParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_log_type","jbc_log_type"};
		fieldNames = new String[] {"id","log_type_name"};
		inputTypes = new String[] {"number","text"};
		selectFields = new String[] {"id","log_type_name"};
		selectITs = new String[] {"number","text"};
		setLabels();
		equalityInt = new int[] {EQ, LK};
		colWidths = new int[] {10,20};
		readOnlyFM = new int[] {0,-1};
		requiredFM = new int[] {-1,1};
		invisibleFM = new int[] {-1,-1};
		unqFields = new String[] {"log_type_name"}; 
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
			jspTitle = "Log Tip";
			labelNames = new String[] {"ID","Log Tipi"};
		}
		else
		{
			jspTitle = "Log Type";
			labelNames = new String[] {"ID","Log Type"};
		}
	}
}
