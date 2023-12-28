package com.jbca.page;

import com.jbca.base.BaseParameters;

//import java.time.format.DateTimeFormatter;

import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class ThemeParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_theme","vt_jbc_theme"};
		fieldNames = new String[] {"id","theme_name","adr_path","theme_menu","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","text","text","text","datetime-local"};
		selectFields = new String[] {"id","theme_name","adr_path","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","date","date"};
		setLabels();
		colWidths = new int[] {10,30,30,30,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,4,5};
		invisibleFM = new int[] {-1,-1,-1,-1,-1,-1};
		requiredFM = new int[] {-1,1,2,3,-1,-1};
		equalityInt = new int[] {EQ,LK,EQ,EQ,BGE,SME};
		unqFields = new String[] {"theme_name","adr_path"}; 
		unqFieldTypes = new int[] {STRING,STRING};
		unqMatchs = new int[] {-1,1,2,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_path","jbc_menu","jbc_user"};
		refFieldNames = new String[] {"path_name","menu_name","user_code"};
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
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug;  authorized = new String[] {"Admin","Supervisor","Normal"};
		isModal = true; isWithRefs = true;
	}
	
	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Tema";
			labelNames = new String[] {"ID","Tema Adı","Yol","Menü","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Tema Adı","Yol","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "Theme";
			labelNames = new String[] {"ID","Theme Name","Path","Menu","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Theme Name","Path","Recorder","Start Date", "End Date"};
		}
	}
}
