package com.jbca.utility;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.jbca.base.BaseParameters;

public class DateCompare {
	
	private BaseParameters p;
	//private String parameter;
	
	public DateCompare (BaseParameters p) { // , String parameter
		
		this.p = p;
		//this.parameter = parameter;
	}
	
	public String[][] getTableData(String parameter, DateTimeFormatter dateTF, LocalDateTime now) {
		
		int dataLength = p.tableData.length; 
		int fieldsLength = p.fieldNames.length;
		String[][] tableData = new String[dataLength][fieldsLength];
		
		String resultLimit = "15",
				rLx = p.genParamBean.getParamVal(null, false, new String[]{parameter}); //"Sonuç Uyarı Sınırı"
		if(!rLx.isBlank()) resultLimit = rLx;
		
		long limit = Long.parseLong(resultLimit);
				
		LocalDateTime fromRow = null, nowMinus = now.minusDays(limit);
				
		for(int i=0; i < dataLength; i++) {
			
			for(int j=0; j < fieldsLength; j++) {
				
				if(j == fieldsLength-1) {
					
					//if(p.isDebug) System.out.println("p.tableData[i][j-3] :"+p.tableData[i][j-3]);
					
					fromRow = LocalDateTime.parse((String)p.tableData[i][j-3], dateTF);
					
					if(p.tableData[i][6].equals("Yapıldı") || fromRow.compareTo(nowMinus) > 0)

						tableData[i][j] = "false";
					else 
						tableData[i][j] = "true";
				}
				else {
					tableData[i][j] = (String)p.tableData[i][j];
				}
			}
		}
		
		return tableData;
	}
	
	public String[] getFieldNames (String fieldName) {
		
		String[] fNPlus = new String[p.fieldNames.length+1];
		
		for(int i=0; i < fNPlus.length; i++) {
			
			if(i == fNPlus.length-1)
				fNPlus[i] = fieldName; //"attention";
			else
				fNPlus[i] = p.fieldNames[i];
		}
		
		return fNPlus;
	}
}
