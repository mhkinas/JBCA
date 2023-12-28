/**
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */
package com.jbca.base;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;

import com.sdb.bean.CodeBean;
import com.jbca.bean.LogBean;
import com.sdb.bean.PageBean;
import com.sdb.bean.MenuBean;
import com.sdb.bean.MessageBean;
import com.sdb.bean.SessionBean;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.ExecuteTable;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.dbwork.PrepareQuery;
import com.sdb.dbwork.RunDB;
import com.sdb.filework.ExecuteFileData;
import com.sdb.filework.RecordFileToDB;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;
import com.sdb.utility.JsonConverter;

public class BaseParameters {

	public static final int	 STRING = PrepareQuery.STRING   // String Data
					  	  , INTEGER	= PrepareQuery.INTEGER  // Integer Data
					  		 , DATE	= PrepareQuery.DATE     // Date Data
					  	   , NUMBER	= PrepareQuery.NUMBER;  // Number Data
	
	public static final int	EXECUTE	= RunDB.EXECUTE  // Execute Multi
					  		, QUERY	= RunDB.QUERY    // Select
					  	   , UPDATE	= RunDB.UPDATE   // Insert, Update, Delete
					  	    , BATCH = RunDB.BATCH;   // Batch processes
	 
	public static final int DATASOURCE = RunDB.DATASOURCE
				  	   , DRIVERMANAGER = RunDB.DRIVERMANAGER;
	
	public static final int	  MYSQL  = RunDB.MYSQL  	// MySQL RDBMS
						, SQLSERVER	 = RunDB.SQLSERVER  // SQL Server RDBMS
						, ORACLE	 = RunDB.ORACLE 	// Oracle RDBMS
						, POSTGRESQL = RunDB.POSTGRESQL // Postgresql RDBMS
						, DB2		 = RunDB.DB2  		// DB2 RDBMS
						, HANA		 = RunDB.HANA		// HANA RDBMS
						, MARIADB	 = RunDB.MARIADB;	// MARIADB RDBMS

   	public static final int   TURK_DATE = DateFormatter.TURK_DATE  // Türk (German) format 104
							, US_DATE   = DateFormatter.US_DATE    // U.S. format 101
							, ANSI_DATE = DateFormatter.ANSI_DATE  // ANSI format 102
							, BF_DATE   = DateFormatter.BF_DATE    // Biritish French 103
							, DEF_PMS   = DateFormatter.DEF_PMS    // Default 109
							, HHMMSS	= DateFormatter.HHMMSS     // HHMMSS 108
							, HMSM		= DateFormatter.HMSM       // HMSM 114
							, TMSTMP    = DateFormatter.TMSTMP;    // TimeStamp 120
				
	public static final int		POINT = DateFormatter.POINT  // .
							  , SLASH = DateFormatter.SLASH  // /
							  , DASH  = DateFormatter.DASH   // -
							  , SPACE = DateFormatter.SPACE; // 
	
	public static final int		DMY = DateFormatter.DMY  // DateMonthYear
							  , MDY = DateFormatter.MDY  // MonthDateYear
							  , YMD = DateFormatter.YMD; // YearMonthDate
	
	public static final int 	NO = DateFormatter.NO // No HourMinute
							  , HM = DateFormatter.HM // HourMinute
							  , T  = DateFormatter.T; // HourMinuteSecond

	public static final int	  EQ  = PrepareQuery.EQ   // Equal
							, SM  = PrepareQuery.SM   // Smaller
							, BG  = PrepareQuery.BG   // Bigger
							, SME = PrepareQuery.SME  // Smaller or Equal
							, BGE = PrepareQuery.BGE  // Bigger or Equal
							, NEQ = PrepareQuery.NEQ  // Not Equal
							, LK  = PrepareQuery.LK;  // Like

	public RunDB runDB;
	public String[] tableNames, formData, fieldNames, labelNames, inputTypes, selectFields, selectLabels, selectITs;
	public int[] fieldTypes, equalityInt, selectFTs, readOnlyFM, invisibleFM, requiredFM, colWidths;
	public String orderBy, action, jndiName, contextRoot;
	public DateFormatter dateFormatter;
	public int dbSystem, brackets, dateFormat, hourFormat, sqlDF, connType, dataType;
	public boolean isSimple, isModal, isWithRefs, isCommit; 
	public PrepareQuery prepareQuery;
	public ExecuteTable executeTable;
	
	public PrepQueryWithRef prepQueryWR;
	public ExecTableWithRef execTableWR;
	public String[] refTableNames, refFieldNames;  
	public int[] refFieldMatchs; 

	public Object[][] tableData;
	public String[][] selLists;
	
	public SessionBean sessionBean;
	public MenuBean menuBean;
	public PageBean pageBean;
	public CodeBean codeBean;
	public ManageSelList manageSelList;
	public JsonConverter jsonConverter;
	public MessageBean messageBean;
	public LogBean logBean;
	
	public String[] unqFields, unqFieldData;
	public int[] unqFieldTypes, unqMatchs;
	
	public String fileField, defPasw, algorithm, defMask, jspTitle;
	public InputStream inpStream;
	public Reader reader;
	public Writer writer;
	public OutputStream outStream;
	public ExecuteFileData execFileData;
	
	public String[] authorized; //, logData;
	public boolean isAuth, isLocale, isDebug;
	
	public String[] strAry;
	
	public void initParams()
	{
		//runDB = new RunDB(); // If dbSystem is MYSQL and connType is DATASOURCE
		dbSystem = MARIADB;
		connType = DATASOURCE;
		runDB = new RunDB(dbSystem, connType);
		jndiName = "jdbc/jbcaDS";
		runDB.setDB(jndiName);
		algorithm = "SHA-256";
		action = "empty";
		isAuth = false; isCommit = false; isDebug = false;
		sessionBean = new SessionBean();
		messageBean = new MessageBean(isLocale);
		logBean = new LogBean(runDB);
		menuBean = new MenuBean(runDB, new String[] {"jbc_menu","vt_jbc_menu"}, "id", new String[] {"menu_name","adr_path"}, "menu_data");
		pageBean = new PageBean(runDB, new String[] {"jbc_page","vt_jbc_page"}, "id", new String[] {"page_name","adr_path"}, "page_data", dbSystem);
		codeBean = new CodeBean(runDB, new String[] {"jbc_code","vt_jbc_code"}, "id", new String[] {"code_name","adr_path"}, "code_data", dbSystem);
		menuBean.setMulti(true); pageBean.setMulti(true); codeBean.setMulti(true);
		defPasw = "your_DefPsw4Login";//
		contextRoot = "JBCA_F";
		defMask = "XXXXXXXX";
	}
	
	public void setLangEN()
	{
		isLocale = false;
	}

	public void setLangLoc()
	{
		isLocale = true;
	}
}
