/** 
* BCBCA - v1.0 - 2021-09-09
* https://www.hayatikinas.com
* This code is part of the BCBCA project
* And it can be used under license terms.
* Copyright Mehmet Hayati KINAŞ
*/

/*! messages */

function putMessages()
{
	let alerts = "";
	
	if(jsObjData.resultMessage != undefined)
	{
		alerts += "<div id=\"alertrm\" class=\"alert alert-info\">"+
					"<strong>resultMessage: </strong>"+jsObjData["resultMessage"]+
				  "</div>";
	}
	if(jsObjData.messageScript != undefined)
	{
		alerts += "<div id=\"alertms\" class=\"alert alert-warning\">"+
					"<strong>messageScript: </strong>"+jsObjData["messageScript"]+
				  "</div>";
	}
	if(jsObjData.errorString != undefined)
	{
		alerts += "<div id=\"alertes\" class=\"alert alert-danger\">"+
					"<strong>errorString: </strong>"+jsObjData["errorString"]+
				  "</div>";
	}
	if(alerts !== "")
		document.getElementById("alerts").innerHTML = alerts;
}

//________________________________________________________________________________________________________________________________________

/*! logging */

//For sending form data to the console logging
function logFD(formData)
{
	for (let key of formData.keys()) 
	{
	   console.log(key); 
	}
	for (let value of formData.values()) 
	{
	   console.log(value); 
	}	
}

//For sending json to console logging
function logJD(jsonD)
{
	console.log(JSON.stringify(jsonD));
}

//For sending string to the console logging
function logStr(str)
{
	console.log(str);
}

//_______________________________________________________________________________________________________________________________________

/*! action */

// For sending insertion form data with ajax
function sendInsert(url, formId)
{
	var formData = getInsFormData(formId);
	
	sendForm(url, insertResponse, formData);
}

function getInsFormData(formId)
{
	var formElement = document.getElementById(formId);
	
	var formData = new FormData(formElement);

	if(isWithRefs)
		setSelectData(formData, formId);
	
	formData.append("action","insert");

	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	return formData;
}

// For setting insertion response data
function insertResponse(xhr)
{
	var dataRow = null;
	
	if(xhr.responseText !== "")
	{
		logStr(xhr.responseText);
		
		window.jsObjData = JSON.parse(xhr.responseText); 	
		dataRow = window.jsObjData.data;

		putMessages();
	}else
		logStr("json data is empty!");
	
	logStr(jsObjData);
	logStr(dataRow);
	
	if(dataRow != undefined && dataRow !== "")
		insertRow(dataRow);
}

function insertRow(dataRow)
{
	if(window.dataList != undefined && window.dataList !== "")
	
		window.dataList.push(dataRow[0]);
	else
		window.dataList = dataRow;
	
	window.totRow = window.dataList.length;
		
	if (window.lastProp == window.fieldNames[0])
		sortById();
	else
		sortByProp(window.lastProp); 
}

function sendForm(url, callFunc, formData) 
{
  var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
  
  xhr.open("POST", url, true);

  xhr.onreadystatechange = function() 
  {
    if (xhr.readyState == 4 && xhr.status == 200) 
	{
      callFunc(xhr);
    }
  };
  xhr.send(formData);
}

//For sending form data with fetch
async function sendFormWF(url, formId, action)   
{
	var formData = null;
	var dataRow = null;
	
	logStr(action);
	
	switch (action) 
	{
		//case "select": formData = getSelFormData(formId); break;
		case "insert": formData = getInsFormData(formId); break;
		//case "update": formData = getUpdFormData(formId); break;
		//case "delete": formData = getDelFormData(formId); break;
		//case "currency": formData = getCurFormData(formId); break;
		default: logStr("incorrect action type!"); return;
	}		
	logStr(url);

	const response = await fetch(url,  
	{
	    method: 'POST', 
	    body: formData 
	});
	
	window.jsObjData = await response.json();  
	
	/*if(action == "select" || action == "currency")
	{
		window.dataList = window.jsObjData.data;
		window.pageNo = 1;

		if(window.dataList)
			window.totRow = window.dataList.length;
				
		putMessages();
	}
	else
	{*/
		dataRow = window.jsObjData.data;
		
		logJD(window.jsObjData);

		putMessages();
	/*}

	switch (action) 
	{
		//case "select": setSelectList(); break;
		case "insert": insertRow(dataRow); break;
		//case "update": updateRow(dataRow); break;
		//case "delete": deleteRow(dataRow); break;
		//case "currency": setSelectList(); break;
		default: logStr("incorrect action type!"); return;
	}*/		
}

function sleep(milliseconds) {
  
  const date = Date.now();
  let currentDate = null;
  
  do {
    currentDate = Date.now();
	
  } while (currentDate - date < milliseconds);
}
