package com.jbca.user;


import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.filework.ExecuteFileData;
import com.sdb.filework.RecordFileToDB;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class MessageParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_message","vt_jbc_message"};
		fieldNames = new String[] {"id","msg_name","message_type","rec_status","msg_data","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","text","text","textarea","text","datetime-local"};
		selectFields = new String[] {"id","msg_name","message_type","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","date","date"};
		setLabels();
		colWidths = new int[] {10,30,10,10,100,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,-1,5,6};
		invisibleFM = new int[] {-1,-1,-1,-1,4,-1,-1};
		requiredFM = new int[] {-1,1,2,3,4,-1,-1};
		equalityInt = new int[] {EQ,LK,EQ,EQ,BGE,SME};
		unqFields = new String[] {"msg_name"}; 
		unqFieldTypes = new int[] {STRING};
		unqMatchs = new int[] {-1,1,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_message_type","jbc_status","jbc_user"};
		refFieldNames = new String[] {"msg_type_name","status_name","user_code"};
		refFieldMatchs = new int[] {-1,-1,2,3,-1,5,-1};
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM); // T
		dateFormatter.setIsCast(true);
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
		prepQueryWR.isDebug = isDebug;
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
			jspTitle = "Mesaj";
			labelNames = new String[] {"ID","Mesaj Adı","Tip","Durum","Kayıt","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Mesaj Adı","Tip","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "Message";
			labelNames = new String[] {"ID","Message Name","Type","Status","Record","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Message Name","Type","Recorder","Start Date", "End Date"};
		}
	}
}
