package com.jbca.exchange;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.io.InputStream;

public class ExchangeRates {
	
	URL xmlURL;
	String[] excCodes;
	String urlStr;

	public ExchangeRates() {

		urlStr = "https://www.tcmb.gov.tr/kurlar/today.xml";
		
		initialize();
	}

	public ExchangeRates(String urlStr) {

		this.urlStr = urlStr;
		
		initialize();
	}
	
	private void initialize() {

		try {
			xmlURL = new URL(urlStr);
		} 
		catch (MalformedURLException e) {

			e.printStackTrace();
		}
		excCodes = new String[] {"USD", "EUR"};
	}

	public String[][] getExchangeRates() throws IOException {
		
		String[][] excRA = null;
		InputStream xmlIS = null;

		try {
			xmlIS = xmlURL.openStream();
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = factory.newDocumentBuilder();
			Document document = docBuilder.parse(xmlIS);
			
			document.getDocumentElement().normalize();

			System.out.println("Root element: " + document.getDocumentElement().getNodeName());

			NodeList nodeList = document.getElementsByTagName("Currency");

			for (int i = 0; i < nodeList.getLength(); i++) {
				
				Node node = (Element) nodeList.item(i);
				 
				if (node.getNodeType() == Node.ELEMENT_NODE) {

					Element element = (Element) node;
					
					System.out.println("\nCurrent Element: " + element.getNodeName());
	
					String curCode = element.getAttribute("CurrencyCode");
					
					for(int j = 0; j < excCodes.length; j++) {
					
						if(curCode.equals(excCodes[j])) {
							
							if(excRA == null)
								excRA = new String[excCodes.length][6];
							
							excRA[j][0] = curCode;
							excRA[j][1] = element.getElementsByTagName("ForexBuying").item(0).getTextContent();
							excRA[j][2] = element.getElementsByTagName("ForexSelling").item(0).getTextContent();
							excRA[j][3] = element.getElementsByTagName("BanknoteBuying").item(0).getTextContent();
							excRA[j][4] = element.getElementsByTagName("BanknoteSelling").item(0).getTextContent();
							excRA[j][5] = element.getElementsByTagName("Unit").item(0).getTextContent();
						}
					}
				}
			}
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			if(xmlIS != null) xmlIS.close();
		}
			
		return excRA;
	}

	public String[] getExcCodes() {
		return excCodes;
	}

	public void setExcCodes(String[] excCodes) {
		this.excCodes = excCodes;
	}

	public void setUrlStr(String urlStr) {
		this.urlStr = urlStr;
	}
}