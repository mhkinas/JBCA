package com.jbca.page;

import com.jbca.base.BaseParameters;

//import java.time.format.DateTimeFormatter;

import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class PageLinkParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_page_link","vt_jbc_page_link"};
		fieldNames = new String[] {"id","link_name","adr_path","linked_page","position","theme","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","text","text","text","text","text","datetime-local"};
		selectFields = new String[] {"id","link_name","adr_path","linked_page","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","text","date","date"};
		setLabels();
		colWidths = new int[] {10,20,30,30,10,20,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,-1,-1,6,7};
		invisibleFM = new int[] {-1,-1,-1,-1,-1,-1,-1,-1};
		requiredFM = new int[] {-1,1,2,3,4,5,-1,-1};
		equalityInt = new int[] {EQ,LK,EQ,EQ,EQ,BGE,SME};
		unqFields = new String[] {"link_name","adr_path"}; 
		unqFieldTypes = new int[] {STRING,STRING};
		unqMatchs = new int[] {-1,1,2,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_path","jbc_page","jbc_position","jbc_theme","jbc_user"};
		refFieldNames = new String[] {"path_name","page_name","pos_name","theme_name","user_code"};
		refFieldMatchs = new int[] {-1,-1,2,3,4,5,6,-1};
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
			jspTitle = "Sayfa Link";
			labelNames = new String[] {"ID","Link Adı","Yol","Sayfa","Pozisyon","Tema","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Link Adı","Yol","Sayfa","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "Page Link";
			labelNames = new String[] {"ID","Link Name","Path","Page","Position","Theme","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Link Name","Path","Page","Recorder","Start Date", "End Date"};
		}
	}
}
