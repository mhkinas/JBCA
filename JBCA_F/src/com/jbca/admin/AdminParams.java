/**
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */
package com.jbca.admin;

import java.nio.charset.StandardCharsets;

import com.jbca.base.BaseParameters;
import com.sdb.bean.PasswordBean;

import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManagePassword;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class AdminParams extends BaseParameters 
{
	// Some extra beans for AdminParams
	public PasswordBean passwordBean;
	public ManagePassword managePassword;

	// For initializing admin parameters
	public void initParams()
	{
		isDebug = false;
		tableNames = new String[] {"jbc_user","vt_jbc_user"}; // Array for table names
		fieldNames = new String[] {"id","user_name","user_code","user_psw","user_group","e_mail","rec_status","page_size","rec_user",
									"rec_date"}; // Array for field names
		inputTypes = new String[] {"number","text","text","password","text","email","text","number","text","datetime-local"}; // Array for html input types
		selectFields = new String[] {"id","user_name","user_group","e_mail","rec_user","rec_date1","rec_date2"};// Array for search field names
		selectITs = new String[] {"number","text","text","email","text","date","date"}; // Array for search html input types
		setLabels(); // For setting labale names
		colWidths = new int[] {10,30,10,10,10,30,10,10,10,15};
		
		// Matching check is like : if(myArray[i] == i)
		readOnlyFM = new int[] {0,-1,-1,-1,-1,-1,-1,-1,8,9};// Integer array for matching read only fields
		invisibleFM = new int[] {-1,-1,-1,3,-1,-1,-1,-1,-1,-1};// Integer array for matching invisible fields.
		requiredFM = new int[] {-1,1,2,3,4,5,-1,-1,-1,-1}; // Integer array for matching required fields.
		equalityInt = new int[] {EQ,LK,EQ,LK,EQ,BGE,SME}; // Integer array for equality fields
		unqFields = new String[] {"user_code"}; // String array for unique fields.
		unqFieldTypes = new int[] {STRING}; // Integer array for unique field types.
		unqMatchs = new int[] {-1,-1,2,-1,-1,-1,-1,-1,-1,-1}; // Integer array for matching unique fields.
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,STRING,STRING,INTEGER,STRING,DATE}; // Integer array for field types.
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE,DATE}; // Integer array for search field types.
		dataType = STRING;// Integer for data type
		orderBy = "id";  // Field name for ordering
		refTableNames = new String[] {"jbc_group","jbc_status","jbc_user"}; // String array for reference table names.
		refFieldNames = new String[] {"group_name","status_name","user_code"}; // String array for reference field names.
		refFieldMatchs = new int[] {-1,-1,-1,-1,4,-1,6,-1,8,-1};// Integer array for matching reference fields.
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM);
		dateFormatter.setIsCast(true);
		//dateFormatter.setSourceDF(DateTimeFormatter.ofPattern(("yyyy-MM-dd HH:mm:ss"));
		//dateFormatter.setTargetDF(DateTimeFormatter.ofPattern(("dd.MM.yyyy HH:mm:ss"));
		prepQueryWR = new PrepQueryWithRef(); // For setting DateFormatter.
		prepQueryWR.convert2EQLs(equalityInt);// For converting to sql comparison operators
		prepQueryWR.isDebug = isDebug;
		//runDB.setMaxRecord(10000);
		
		// The constructor for ExecTableWithRef
		execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs, 
												dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
		// The constructor for PasswordBean
		passwordBean = new PasswordBean(runDB, tableNames[0], fieldNames[0], fieldNames[3]);
		// The constructor for ManagePassword
		managePassword = new ManagePassword(defPasw, algorithm, passwordBean, defMask);
		managePassword.setCharset(StandardCharsets.UTF_8); // Set charset for different then StandardCharsets.UTF_8
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; 
		execTableWR.isDebug = isDebug; 
		authorized = new String[] {"Admin"}; // String array for authorized groups
		isModal = true; 
		isWithRefs = true;
	}
	
	// For setting label names as English or local language
	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Kullanıcı";
			labelNames = new String[] {"ID","Ad Soyad","Kod","Şifre","Grup","E-posta","Durum","Sayfa Boyutu","Kaydeden","Kayıt Tarihi"};
			selectLabels = new String[] {"ID","Ad Soyad","Grup","E-posta","Kaydeden","Başlangıç Tarih", "Bitiş Tarih"};
		}else {
			jspTitle = "User";
			labelNames = new String[] {"ID","Name Surename","Code","Password","Group","E-mail","Status","Page Size","Recorder","Record Date"};
			selectLabels = new String[] {"ID","Name Surename","Group","E-mail","Recorder","Start Date", "End Date"};
		}
	}

	// For setting password values as default mask
	public void setPasX(int col)
	{
		if(tableData != null && tableData.length > 0)
			for(String[] row : (String[][]) tableData) 
				row[col] = defMask;  
	}
}
