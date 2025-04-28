package com.jbca.log;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class LogParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_log","vt_jbc_log"};
		fieldNames = new String[] {"id","rec_id","form_name","type_name","table_name","log_data","rec_user","rec_date"};
		inputTypes = new String[] {"number","number","text","text","text","textarea","text","datetime-local"};
		selectFields = new String[] {"rec_id","form_name","type_name","table_name","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","text","date","date"};
		setLabels();
		colWidths = new int[] {10,10,20,10,20,100,10,15};
		readOnlyFM = new int[] {0,1,2,3,4,5,6,7};
		invisibleFM = new int[] {-1,-1,-1,-1,-1,5,-1,-1};
		requiredFM = new int[] {-1,-1,-1,-1,-1,-1,-1,-1};
		equalityInt = new int[] {EQ,EQ,EQ,EQ,EQ,BGE,SME};
		unqFields = new String[] {"id"}; 
		unqFieldTypes = new int[] {INTEGER};
		unqMatchs = new int[] {0,-1,-1,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,INTEGER,STRING,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_log_form","jbc_log_type","jbc_log_table","jbc_user"};
		refFieldNames = new String[] {"log_form_name","log_type_name","log_table_name","user_code"};
		refFieldMatchs = new int[] {-1,-1,2,3,4,-1,6,-1};
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM); // T
		dateFormatter.setIsCast(true);
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
		prepQueryWR.isDebug = isDebug;
		runDB.setMaxRecord(1000);
		execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs, 
												dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean); 
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug;  authorized = new String[] {"Admin","Supervisor"};
		isModal = true; isWithRefs = true;
	}
	
	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Log";
			labelNames = new String[] {"ID","Kayıt ID","Form Adı","Log Tipi","Log Tablosu","Kayıt","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"Kayıt ID","Form Adı","Log Tipi","Log Tablosu","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "Log";
			labelNames = new String[] {"ID","Record ID","Form Name","Log Type","Log Table","Record","Recorder","Record Date"};
			selectLabels = new String[] {"Record ID","Form Name","Log Type","Log Table","Recorder","Start Date", "End Date"};
		}
	}
}
