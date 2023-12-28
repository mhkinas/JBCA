package com.jbca.user;

import java.nio.charset.StandardCharsets;

import com.jbca.base.BaseParameters;
import com.sdb.bean.PasswordBean;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.management.ManagePassword;
import com.sdb.utility.DateFormatter;

public class PasswordChangeParams extends BaseParameters 
{
	public PasswordBean passwordBean;
	public ManagePassword managePassword;
	
	public void initParams()
	{
		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_user","jbc_user"};
		fieldNames = new String[] {"user_code","old_user_psw","user_psw","again_user_psw"};
		inputTypes = new String[] {"text","password","password","password"};
		selectFields = new String[] {"user_code"};
		selectITs = new String[] {"text"};
		setLabels();
		equalityInt = new int[] {EQ};
		readOnlyFM = new int[] {-1,-1,-1,-1};
		requiredFM = new int[] {-1,-1,-1,-1};
		invisibleFM = new int[] {-1,-1,-1,-1};
		unqFields = new String[] {"user_code"}; 
		unqFieldTypes = new int[] {STRING};
		unqMatchs = new int[] {0,-1,-1,-1};
		fieldTypes = new int[] {STRING,STRING,STRING,STRING};
		selectFTs = new int[] {STRING};
		dataType = STRING;
		orderBy = "user_code";
		dateFormatter = new DateFormatter(dbSystem);
		prepareQuery = new PrepareQuery();
		prepareQuery.convert2EQLs(equalityInt);
		//executeTable = new ExecuteTable(runDB, tableNames, fieldNames, fieldTypes, orderBy, dateFormatter, 
										//selectFields, selectFTs, messageBean);
		passwordBean = new PasswordBean(runDB, tableNames[0], "id", fieldNames[2], unqFields);
		managePassword = new ManagePassword(defPasw, algorithm, passwordBean, defMask);
		//managePassword.setCharset(StandardCharsets.UTF_8); // Set charset for different then StandardCharsets.UTF_8
		//executeTable.isAfterCommit = false; executeTable.isDebug = isDebug; 
		authorized = new String[] {"Admin","Supervisor","Normal"};
		isModal = false; isWithRefs = false;
	}
	
	public void setLabels() 
	{
		if(isLocale)
		{
			jspTitle = "Şifre";
			labelNames = new String[] {"Kullanıcı Kodu","Eski Şifre","Yeni Şifre","Yeni Şifre Tekrar"};
		}else {
			jspTitle = "Password";
			labelNames = new String[] {"Code","Old Password","New Password","New Password Again"};
		}
	}
}
