package com.jbca.reference;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.utility.DateFormatter;

public class PathParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_path","jbc_path"};
		fieldNames = new String[] {"id","path_name"};
		labelNames = new String[] {"ID","Adres Yolu"};
		inputTypes = new String[] {"number","text"};
		selectFields = new String[] {"id","path_name"};
		selectITs = new String[] {"number","text"};
		setLabels();
		equalityInt = new int[] {EQ, LK};
		colWidths = new int[] {10,20};
		readOnlyFM = new int[] {0,-1};
		requiredFM = new int[] {-1,1};
		invisibleFM = new int[] {-1,-1};
		unqFields = new String[] {"path_name"}; 
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
			jspTitle = "Yol";
			labelNames = new String[] {"ID","Adres Yolu"};
		}
		else 
		{
			jspTitle = "Path";
			labelNames = new String[] {"ID","Address Path"};
		}
	}
}
