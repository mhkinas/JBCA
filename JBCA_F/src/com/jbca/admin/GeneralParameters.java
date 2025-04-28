package com.jbca.admin;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.utility.DateFormatter;

public class GeneralParameters extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_parameters","jbc_parameters"};
		fieldNames = new String[] {"id","param_key","param_value"};
		inputTypes = new String[] {"number","text","text"};
		selectFields = new String[] {"id","param_key","param_value"};
		selectITs = new String[] {"number","text","text"};
		setLabels();
		equalityInt = new int[] {EQ,LK,LK};
		colWidths = new int[] {10,20,30};
		readOnlyFM = new int[] {0,1,-1};
		requiredFM = new int[] {-1,1,2};
		invisibleFM = new int[] {-1,-1,-1};
		unqFields = new String[] {"param_key"}; 
		unqFieldTypes = new int[] {STRING};
		unqMatchs = new int[] {-1,1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING};
		selectFTs = new int[] {INTEGER,STRING,STRING};
		dataType = STRING;
		orderBy = "id";
		dateFormatter = new DateFormatter(dbSystem);
		prepareQuery = new PrepareQuery();
		prepareQuery.convert2EQLs(equalityInt);
		executeTable = new ExecuteTable(runDB, tableNames, fieldNames, fieldTypes, orderBy, dateFormatter, 
										selectFields, selectFTs, messageBean);
		executeTable.isAfterCommit = isCommit; executeTable.isDebug = isDebug; authorized = new String[] {"Admin","Supervisor"};
		isModal = true; isWithRefs = false;
	}

	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Genel Parametreler";
			labelNames = new String[] {"ID","Parametre","Değeri"};
		}
		else
		{
			jspTitle = "General Parameters";
			labelNames = new String[] {"ID","Parameter","Value"};
		}
	}
}
