/*! v1.0 - 2018-05-19
* https://hayatikinas.com
* This code a part of JBCA project
* And usable under this license circumstances.
* Copyright Mehmet Hayati KINAŞ 
*/

package com.jbca.admin;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.utility.DateFormatter;

public class GroupParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_group","jbc_group"};
		fieldNames = new String[] {"id","group_name"};
		inputTypes = new String[] {"number", "text"};
		selectFields = new String[] {"id","group_name"};
		selectITs = new String[] {"number","text"};
		setLabels();
		equalityInt = new int[] {EQ,LK};
		colWidths = new int[] {10,20};
		readOnlyFM = new int[] {0,-1};
		requiredFM = new int[] {-1,1};
		invisibleFM = new int[] {-1,-1};
		unqFields = new String[] {"group_name"}; 
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
		 
		executeTable.isAfterCommit = false; executeTable.isDebug = isDebug; authorized = new String[] {"Admin"};
		isModal = true; isWithRefs = false;
	}

	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Grup";
			labelNames = new String[] {"ID","Grup"};
		}
		else
		{
			jspTitle = "Group";
			labelNames = new String[] {"ID","Group"};
		}
	}
}
