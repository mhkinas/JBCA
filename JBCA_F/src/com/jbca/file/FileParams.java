package com.jbca.file;


import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.filework.ExecuteFileData;
import com.sdb.filework.RecordFileToDB;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class FileParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_file","vt_jbc_file"};
		fieldNames = new String[] {"id","file_name","adr_path","file_type","file_size","mime_type","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","text","text","number","txt","text","datetime-local"};
		selectFields = new String[] {"id","file_name","adr_path","file_type","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","text","date","date"};
		setLabels();
		fileField = "file_data";
		colWidths = new int[] {10,30,30,10,10,10,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,-1,-1,6,7};
		invisibleFM = new int[] {-1,-1,-1,-1,-1,-1,-1,-1};
		requiredFM = new int[] {-1,1,2,3,-1,-1,-1,-1};
		equalityInt = new int[] {EQ,LK,EQ,EQ,EQ,BGE,SME};
		unqFields = new String[] {"file_name","adr_path"}; 
		unqFieldTypes = new int[] {STRING,STRING};
		unqMatchs = new int[] {-1,1,2,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,INTEGER,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_path","jbc_file_type","jbc_user"};
		refFieldNames = new String[] {"path_name","file_type_name","user_code"};
		refFieldMatchs = new int[] {-1,-1,2,3,-1,-1,6,-1};
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM); // T
		dateFormatter.setIsCast(true);
		//dateFormatter.setSourceDF(DateTimeFormatter.ofPattern(("yyyy-MM-dd HH:mm:ss"));
		//dateFormatter.setTargetDF(DateTimeFormatter.ofPattern(("dd.MM.yyyy HH:mm:ss"));
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
		prepQueryWR.isDebug = isDebug;
		execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs, 
										   dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
		execFileData = new ExecuteFileData(runDB, tableNames, fieldNames[0], fileField, unqFields, unqFieldTypes, ExecuteFileData.BLOB);
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug;  authorized = new String[] {"Admin","Supervisor","Normal"};
		isModal = true; isWithRefs = true; 
	}
	
	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Dosya";
			labelNames = new String[] {"ID","Dosya Adı","Yol","Tip","Büyüklük","Medya Tip","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Dosya Adı","Yol","Tip","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "File";
			labelNames = new String[] {"ID","File Name","Path","Type","Size","Media Type","Recorder","Record Date"};
			selectLabels = new String[] {"ID","File Name","Path","Type","Recorder","Start Date", "End Date"};
		}
	}
}
