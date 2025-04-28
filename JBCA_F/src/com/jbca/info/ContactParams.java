/*! v1.0 - 2018-05-19
* https://hayatikinas.com
* This code a part of JBCA project
* And usable under this license circumstances.
* Copyright Mehmet Hayati KINAŞ 
*/

package com.jbca.info;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class ContactParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_contact","vt_jbc_contact"};
		fieldNames = new String[] {"id","contact_name","e_mail","web_site","message_data","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","email","url","textarea","text","datetime-local"};
		selectFields = new String[] {"id","contact_name","e_mail","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","text","date","date"};
		setLabels();
		equalityInt = new int[] {EQ,LK,LK,EQ,BGE,SME};
		colWidths = new int[] {10,30,30,30,100,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,-1,5,6};
		requiredFM = new int[] {-1,1,-1,-1,4,-1,-1};
		invisibleFM = new int[] {-1,-1,-1,-1,4,-1,-1};
		unqFields = new String[] {"id"}; 
		unqFieldTypes = new int[] {INTEGER};
		unqMatchs = new int[] {0,-1,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_user"};
		refFieldNames = new String[] {"user_code"};
		refFieldMatchs = new int[] {-1,-1,-1,-1,-1,5,-1};
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM); // T
		dateFormatter.setIsCast(true);
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
		execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs, 
										   dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug; authorized = new String[] {"Admin"};
		isModal = true; isWithRefs = true;
	}

	public void setLabels() 
	{
		if(isLocale) {
			jspTitle = "Contact";
			labelNames = new String[] {"ID","İsim","E-posta","Web Sitesi","Mesaj","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","İsim","E-posta","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else{
			jspTitle = "İletişim";
			labelNames = new String[] {"ID","Name","E-mail","Web Site","Message","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Name","E-mail","Recorder","Start Date", "End Date"};
		}
	}
}
