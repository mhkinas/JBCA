package com.jbca.code;


import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.filework.ExecuteFileData;
import com.sdb.filework.RecordFileToDB;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class CodeParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_code","vt_jbc_code"};
		fieldNames = new String[] {"id","code_name","adr_path","code_type","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","text","text","text","datetime-local"};
		selectFields = new String[] {"id","code_name","adr_path","code_type","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","text","date","date"};
		setLabels();
		fileField = "code_data";
		colWidths = new int[] {10,30,30,10,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,5,6};
		invisibleFM = new int[] {-1,-1,-1,-1,-1,-1};
		requiredFM = new int[] {-1,1,2,3,-1,-1,-1};
		equalityInt = new int[] {EQ,LK,EQ,EQ,EQ,BGE,SME};
		unqFields = new String[] {"code_name","adr_path"}; 
		unqFieldTypes = new int[] {STRING,STRING};
		unqMatchs = new int[] {-1,1,2,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_path","jbc_code_type","jbc_user"};
		refFieldNames = new String[] {"path_name","code_type_name","user_code"};
		refFieldMatchs = new int[] {-1,-1,2,3,4,-1};
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
		execFileData = new ExecuteFileData(runDB, tableNames, fieldNames[0], fileField, unqFields, unqFieldTypes, 
										   ExecuteFileData.CLOB);
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug; authorized = new String[] {"Admin"};
		isModal = true; isWithRefs = true;
	}

	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Kod";
			labelNames = new String[] {"ID","Kod Adı","Yol","Tip","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Kod Adı","Yol","Tip","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "Code";
			labelNames = new String[] {"ID","Code Name","Path","Type","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Code Name","Path","Type","Recorder","Start Date", "End Date"};
		}
	}
}
