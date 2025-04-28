package com.jbca.page;


import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.filework.ExecuteFileData;
import com.sdb.filework.RecordFileToDB;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class PageParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_page","vt_jbc_page"};
		fieldNames = new String[] {"id","page_name","adr_path","page_type","rec_status","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","text","text","text","text","datetime-local"};
		selectFields = new String[] {"id","page_name","adr_path","page_type","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","text","date","date"};
		setLabels();
		fileField = "page_data";
		colWidths = new int[] {10,30,30,10,10,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,-1,5,6};
		invisibleFM = new int[] {-1,-1,-1,-1,-1,-1,-1};
		requiredFM = new int[] {-1,1,2,3,-1,-1,-1};
		equalityInt = new int[] {EQ,LK,EQ,EQ,EQ,BGE,SME};
		unqFields = new String[] {"page_name","adr_path"}; 
		unqFieldTypes = new int[] {STRING,STRING};
		unqMatchs = new int[] {-1,1,2,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_path","jbc_page_type","jbc_status","jbc_user"};
		refFieldNames = new String[] {"path_name","page_type_name","status_name","user_code"};
		refFieldMatchs = new int[] {-1,-1,2,3,4,5,-1};
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM); // T
		dateFormatter.setIsCast(true);
		//dateFormatter.setSourceDF(DateTimeFormatter.ofPattern(("yyyy-MM-dd HH:mm:ss"));
		//dateFormatter.setTargetDF(DateTimeFormatter.ofPattern(("dd.MM.yyyy HH:mm:ss"));
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
		execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs, 
										   dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
		execFileData = new ExecuteFileData(runDB, tableNames, fieldNames[0], fileField, unqFields, unqFieldTypes, 
										   ExecuteFileData.CLOB);
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug;  authorized = new String[] {"Admin","Supervisor"}; //,"Normal"};
		isModal = true; isWithRefs = true;
		execTableWR.setDebug(true);
	}
	
	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Sayfa";
			labelNames = new String[] {"ID","Sayfa Adı","Yol","Tip","Durum","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Sayfa Adı","Yol","Tip","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "Page";
			labelNames = new String[] {"ID","Page Name","Path","Type","Status","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Page Name","Path","Type","Recorder","Start Date", "End Date"};
		}
	}
}
