package com.jbca.user;

import java.nio.charset.StandardCharsets;

import com.jbca.base.BaseParameters;
import com.sdb.bean.PasswordBean;

import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManagePassword;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class UserParams extends BaseParameters 
{
	public PasswordBean passwordBean;
	public ManagePassword managePassword;

	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
        tableNames = new String[] {"jbc_user","vt_jbc_user_s"};
		fieldNames = new String[] {"id","user_name","user_code","user_psw","user_group","e_mail","rec_status","page_size","rec_user",
									"rec_date"};
		inputTypes = new String[] {"number","text","text","password","text","email","text","number","text","datetime-local"};
		selectFields = new String[] {"id","user_name","user_group","e_mail","rec_user","rec_date1","rec_date2"};
		selectITs = new String[] {"number","text","text","email","text","date","date"};
		setLabels();
		colWidths = new int[] {10,30,10,10,10,30,10,10,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,-1,-1,-1,-1,8,9};
		invisibleFM = new int[] {-1,-1,-1,3,-1,-1,-1,-1,-1,-1};
		requiredFM = new int[] {-1,1,2,3,4,5,-1,-1,-1,-1};
		equalityInt = new int[] {EQ,LK,EQ,LK,EQ,BGE,SME};
		unqFields = new String[] {"user_code"}; 
		unqFieldTypes = new int[] {STRING};
		unqMatchs = new int[] {-1,-1,2,-1,-1,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,STRING,STRING,STRING,STRING,STRING,INTEGER,STRING,DATE};
		selectFTs = new int[] {INTEGER,STRING,STRING,STRING,STRING,DATE,DATE};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"vt_jbc_group_s","jbc_status","vt_jbc_user_s"};
		refFieldNames = new String[] {"group_name","status_name","user_code"};
		refFieldMatchs = new int[] {-1,-11,-1,-1,4,-1,6,-1,8,-1};
		dateFormatter = new DateFormatter(dbSystem);
		dateFormatter.setHourFormat(HM); 
		dateFormatter.setIsCast(true);
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
		prepQueryWR.isDebug = isDebug;
		execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs, 
												dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean); 
		passwordBean = new PasswordBean(runDB, tableNames[0], fieldNames[0], fieldNames[3]);
		managePassword = new ManagePassword(defPasw, algorithm, passwordBean, defMask);
		managePassword.setCharset(StandardCharsets.UTF_8); // Set charset for different then StandardCharsets.UTF_8
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug;  authorized = new String[] {"Admin","Supervisor"};
		isModal = true; isWithRefs = true;
	}
	
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
	
	public void setPasX(int col)
	{
		if(tableData != null && tableData.length > 0)
			for(String[] row : (String[][]) tableData) 
				row[col] = defMask;  
	}
}
