/*! v1.0 - 2018-05-19
* https://hayatikinas.com
* This code a part of JBCA project
* And usable under this license circumstances.
* Copyright Mehmet Hayati KINAŞ 
*/

package com.website.params;

import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.utility.DateFormatter;

public class ContactParams extends BaseParameters 
{
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_contact","vt_jbc_contact"};
		fieldNames = new String[] {"id","contact_name","e_mail","web_site","message_data","rec_date"};
		inputTypes = new String[] {"number", "text","email","url","textarea"};
		selectFields = new String[] {"contact_name","e_mail","web_site"};
		selectITs = new String[] {"text","text","text"};
		setLabels();
		equalityInt = new int[] {LK,LK,LK};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE};
		selectFTs = new int[] {STRING,STRING,STRING};
		dataType = STRING;
		orderBy = "id";
		dateFormatter = new DateFormatter(dbSystem);
		prepareQuery = new PrepareQuery();
		prepareQuery.convert2EQLs(equalityInt);
		executeTable = new ExecuteTable(runDB, tableNames, fieldNames, fieldTypes, orderBy, dateFormatter, 
										selectFields, selectFTs, messageBean);
		executeTable.isAfterCommit = false; executeTable.isDebug = isDebug; authorized = new String[] {"Admin","Supervisor"};
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
