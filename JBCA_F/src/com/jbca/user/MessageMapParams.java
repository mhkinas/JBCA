package com.jbca.user;

import com.jbca.base.BaseParameters;

//import java.time.format.DateTimeFormatter;

import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class MessageMapParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_message_map","vt_jbc_message_map"};
		fieldNames = new String[] {"id","mapped_msg","user_group","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","text","text","datetime-local"};
		selectFields = new String[] {"id","mapped_msg","user_group","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","date","date"};
		setLabels();
		colWidths = new int[] {10,30,10,10,15};
		readOnlyFM = new int[] {0,-1,-1,3,4};
		invisibleFM = new int[] {-1,-1,-1,-1,-1};
		requiredFM = new int[] {-1,1,2,-1,-1};
		equalityInt = new int[] {EQ,EQ,EQ,EQ,BGE,SME};
		unqFields = new String[] {"mapped_msg","user_group"}; 
		unqFieldTypes = new int[] {STRING,STRING};
		unqMatchs = new int[] {-1,1,2,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_message","jbc_group","jbc_user"};
		refFieldNames = new String[] {"msg_name","group_name","user_code"};
		refFieldMatchs = new int[] {-1,1,2,3,-1};
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM); // T
		dateFormatter.setIsCast(true);
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
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
			jspTitle = "Mesaj Map";
			labelNames = new String[] {"ID","Mesaj","Grup","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Mesaj","Grup","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "Message Map";
			labelNames = new String[] {"ID","Message","Group","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Message","Group","Recorder","Start Date", "End Date"};
		}
	}
}
