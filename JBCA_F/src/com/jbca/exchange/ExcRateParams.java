package com.jbca.exchange;

import com.jbca.base.BaseParameters;
import com.sdb.dbwork.ExecTableWithRef;
import com.sdb.dbwork.PrepQueryWithRef;
import com.sdb.management.ManageSelList;
import com.sdb.utility.DateFormatter;

public class ExcRateParams extends BaseParameters {

	public void initParams() {

		super.initParams();
		
		isDebug = true;
		tableNames = new String[] {"jbc_exc_rate","vt_jbc_exc_rate"};
		fieldNames = new String[] {"id","cur_code","fx_buy","fx_sel","bn_buy","bn_sel","unit","rec_user","rec_date"};
		inputTypes = new String[] {"number","text","number","number","number","number","number","text","datetime-local"};
		selectFields = new String[] {"cur_code"};
		selectITs = new String[] {"text"};
		setLabels();
		equalityInt = new int[] {LK};
		colWidths = new int[] {10,10,10,10,10,10,10,10,15};
		readOnlyFM = new int[] {0,-1,-1,-1,-1,-1,-1,7,8};
		requiredFM = new int[] {-1,1,2,3,4,5,6,-1,-1};
		invisibleFM = new int[] {-1,-1,-1,-1,-1,-1,-1,-1,-1};
		unqFields = new String[] {"cur_code"}; 
		unqFieldTypes = new int[] {STRING};
		unqMatchs = new int[] {-1,1,-1,-1,-1,-1,-1,-1,-1};
		fieldTypes = new int[] {INTEGER,STRING,NUMBER,NUMBER,NUMBER,NUMBER,INTEGER,STRING,DATE};
		selectFTs = new int[] {STRING};
		dataType = STRING;
		orderBy = "id";
		refTableNames = new String[] {"jbc_currency","jbc_user"};
		refFieldNames = new String[] {"currency_code","user_code"};
		refFieldMatchs = new int[] {-1,1,-1,-1,-1,-1,-1,7,-1};
		dateFormatter = new DateFormatter(dbSystem);
		prepQueryWR = new PrepQueryWithRef();
		prepQueryWR.convert2EQLs(equalityInt);
		prepQueryWR.isDebug = isDebug;
		execTableWR = new ExecTableWithRef(runDB, tableNames, fieldNames, fieldTypes, orderBy, selectFields, selectFTs, 
										   dateFormatter, refTableNames, refFieldNames, refFieldMatchs, messageBean);
		manageSelList = new ManageSelList(runDB, refTableNames, refFieldNames);
		execTableWR.isAfterCommit = false; execTableWR.isDebug = isDebug; authorized = new String[] {"Admin","Supervisor"};
		isModal = true; isWithRefs = false;
	}

	public void setLabels() {

		if(isLocale) {

			jspTitle = "Döviz Kurları";
			labelNames = new String[] {"ID","Döviz Cinsi","Döviz Alış","Döviz Satış","Efektif Alış","Efektif Satış","Birim","Kaydeden",
										"Kayıt Tarihi"};
			selectLabels = new String[] {"Döviz Cinsi"};
		}
		else {

			jspTitle = "Exchange Rates";
			labelNames = new String[] {"id","cur_code","fx_buy","fx_sel","bn_buy","bn_sel","unit","rec_user","rec_date"};
			selectLabels = new String[] {"cur_code"};
		}
	}
}
