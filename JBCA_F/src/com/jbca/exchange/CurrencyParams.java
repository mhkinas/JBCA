package com.jbca.exchange;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.utility.DateFormatter;

public class CurrencyParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_currency","jbc_currency"};
		fieldNames = new String[] {"id","currency_code","currency_name"};
		inputTypes = new String[] {"number","text","text"};
		selectFields = new String[] {"id","currency_code"};
		selectITs = new String[] {"number","text"};
		setLabels();
		equalityInt = new int[] {EQ, LK};
		colWidths = new int[] {10,10,30};
		readOnlyFM = new int[] {0,-1,-1};
		requiredFM = new int[] {-1,1,2};
		invisibleFM = new int[] {-1,-1,-1};
		unqFields = new String[] {"cur_code"}; 
		unqFieldTypes = new int[] {STRING};
		unqMatchs = new int[] {-1,1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING};
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
			jspTitle = "Döviz Türü";
			labelNames = new String[] {"ID","Döviz Kodu","Döviz İsmi"};
		}
		else
		{
			jspTitle = "Currency Type";
			labelNames = new String[] {"ID","Currency Code","Currency Name"};
		}
	}
}
