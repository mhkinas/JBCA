/**
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

package com.jbca.start;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Timer;
import java.util.TimerTask;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebListener;

import com.jbca.bean.ExcRateBean;
import com.jbca.exchange.ExcRateParams;
import com.jbca.exchange.ExchangeRates;

@WebListener
public class ApplContListener implements ServletContextListener {

	private TimerTask task;
	private Timer timer;
	
    @Override
    public void contextInitialized (ServletContextEvent event) {
        
    	System.out.println("context initialized " + this);
        
    	// Exchange Rate is optional. You can use if you want
    	/*DateTimeFormatter dateTF = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    	LocalDateTime now = LocalDateTime.now();
    	
    	LocalDate localDate = LocalDate.now();
        System.out.println("Current date: " + localDate);
        
        LocalTime localTime = LocalTime.now();
        System.out.println("Current time: " + localTime.toString());
        
    	ExcRateParams p = new ExcRateParams();
    	p.isLocale = true; 
 		p.initParams();
 		
 		try {task = new TimerTask() {
    			
    			boolean isUpdated = false;
		    	
    			@Override
    			public void run() {
    	            
    				if(p.isDebug) System.out.println("date time: "+now.toString() +"\n"+
    	        					"timer thread: "+Thread.currentThread().getName());
    	        	
    	        	if (localTime.toSecondOfDay() > (15*60+45)*60 && localTime.toSecondOfDay() < (23*60+59)*60) { 
    	        		
    	        		if(isUpdated) return;
    	        		
    	        		if(p.isDebug) System.out.println("local time seconds: "+localTime.toSecondOfDay());
    	        		
    	        		String[] doubleField = new String[] {"fx_buy","fx_sel","bn_buy","bn_sel"};
    		    		ExchangeRates excRate = new ExchangeRates();
    		    		ExcRateBean excRateB = new ExcRateBean(p.runDB, p.tableNames, p.unqFields, p.fieldNames, doubleField);
    		    		
    		    		String[][] excRateDatas = null;

						try {
							excRateDatas = excRate.getExchangeRates();
						} 
						catch (IOException e) {

							e.printStackTrace();
						}
    		    		for(String[] data : excRateDatas) {
    		    			
    		    			String[] unqData = new String[] { data[0]};
    		    			
    		    			String[] excData = new String[] { data[1], data[2], data[3], data[4]};
    		    			
    		    			excRateB.setExcRate("", false, unqData, excData);
    		    		}
    		    		isUpdated = true;
    	        	}
    	        	else
    	        		isUpdated = false;
    	        }
    	    };
    	    timer = new Timer("Currency Timer");
    	    long delay = 60 * 60 * 1000L;
    	    
    	    timer.schedule(task, delay);
    	}
    	catch(Exception ex) {
    		
	    	ex.printStackTrace();
	    }*/
    }
    
    @Override
    public void contextDestroyed (ServletContextEvent sce) {
    	
    	/*task.cancel();
    	timer.cancel();
    	timer.purge();
		*/
    	System.out.println("context destroyed " + this);
    }
}
