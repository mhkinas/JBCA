/** 
* jbca.js - v1.0 - 2018-11-28
* https://www.hayatikinas.com
* This code is part of the JBCA project
* And it can be used under license terms.
* Copyright Mehmet Hayati KINAŞ
*/

/*! global variables */

var isLog = false, isAtt = false;
var index = 0;
var myModal, qrModal;
var updCollapse;

function setIsLog(isLog)
{
	this.isLog = isLog;
}

function setIndex(index)
{
	this.index = index;
}

/*! messages */

// To set HTML scripts for messages
function putMessages()
{
	let alerts = "";
	let messages = "";
	
	let isDbg = (typeof window.isDebug  !== "undefined" && window.isDebug);
	logStr("putMessages() isDbg: "+isDbg);
	
	if(window.jsObjData.resultMessage != undefined)
	{
		if(isDbg)
			alerts += "<div id=\"alertrm\" class=\"alert alert-info\">"+
						"<strong>resultMessage: </strong>"+window.jsObjData["resultMessage"]+
					  "</div>";
		else
			messages += " resultMessage:"+window.jsObjData["resultMessage"];
	}
	if(window.jsObjData.messageScript != undefined)
	{
		if(isDbg)
			alerts += "<div id=\"alertms\" class=\"alert alert-warning\">"+
						"<strong>messageScript: </strong>"+window.jsObjData["messageScript"]+
					  "</div>";
		else
			messages += " messageScript:"+window.jsObjData["messageScript"];
	}
	if(window.jsObjData.errorString != undefined)
	{
		if(isDbg)
			alerts += "<div id=\"alertes\" class=\"alert alert-danger\">"+
						"<strong>errorString: </strong>"+window.jsObjData["errorString"]+
					  "</div>";
		else
			messages += " errorString:"+window.jsObjData["errorString"];
	}
	if(alerts != "" && isDbg)
		document.getElementById("alerts").innerHTML = alerts;
	
	if(messages != "")
		window.alert(messages);
}

//________________________________________________________________________________________________________________________________________

/*! logging */

// For sending form data to the console logging
function logFD(formData)
{
	for (const pair of formData.entries()) {

	  console.log(pair[0], pair[1]);
	}		
}

// For sending json to console logging
function logJD(jsonD)
{
	console.log(JSON.stringify(jsonD));
}

// For sending string to the console logging
function logStr(str)
{
	console.log(str);
}

//_______________________________________________________________________________________________________________________________________

/*! listing */

// For setting reference lists
function setList(listNames, selectLists)
{
	let listStr;
	let listName;
	
	for(i=0; i < listNames.length; i++)
	{
		listStr = "";
		listName = listNames[i].name;
		
		for(j=0; j < selectLists[listName].length; j++)
		{
			listStr += "<option value=\""+selectLists[listName][j]+"\">";
		}
		document.getElementById(listNames[i].id).innerHTML = listStr;
	}
}

// For sorting html table by id
function sortById()
{
	let byId = dataRegister.slice(0);
	
	byId.sort(function(a,b) {
		return a.id - b.id;
	});
	
	window.dataRegister = byId;
	setPage();

	window.lastProp = window.fieldNames[0];
}

// For sorting html table by name
function sortByName()
{
	let byName = dataRegister.slice(0);
	
	byName.sort(function(a,b) {
		let x = a.name.toLowerCase();
		let y = b.name.toLowerCase();
		return x<y ? -1: x>y ? 1 : 0;
	});
	
	window.dataRegister = byName;
	setPage();
}

// For sorting html table by property
function sortByProp(prop)
{
	let byProp = dataRegister.slice(0);
	
	byProp.sort(function(a,b) {
		let x = a[prop].toLowerCase();
		let y = b[prop].toLowerCase();
		return x<y ? -1: x>y ? 1 : 0;
	});
	
	window.dataRegister = byProp;
	setPage();

	window.lastProp = prop;
}

// For sorting html table by date
function sortByDate(date, isDT)
{
	let byDate = dataRegister.slice(0);
	
	byDate.sort(function(a,b) 
	{
		let dateA = new Date(dateTimeFormat(a[date], isDT));
		let dateB = new Date(dateTimeFormat(b[date], isDT));
		
		return dateA > dateB ? 1 : -1; 
	});
	
	window.dataRegister = byDate;
	setPage();
}

//________________________________________________________________________________________________________________________________________

/*! pegination */

// For setting html table line size and calling getPage function
function setPage()
{
	if(window.dataRegister !== "") 
	{
		window.lineSize = document.getElementById("p_size").value;

		getPage(window.pageNo);
	}
}

// For setting html table page value and calling getPage function
function paging(pageB)
{
	let page = document.getElementById("page"+pageB).value;
	
	logStr("page: "+page);
	
	getPage(page); 
}

// For setting html table page lines 
function getPage(page) 
{
	let i=0, j=0, order=0, elem, c;
	let k = 0, n= 0;
	let tableStr = "";
	
	if(page=="O")
 	{
		if(window.pageNo > 1)
			page = window.pageNo - 1;
		else
			page = 1;
		
		if(document.getElementById("page1").value > 1)
		{
			for(i=1; i<=5; i++)
			{
				elem = document.getElementById("page"+i);
				c = elem.value -1;
				elem.value = c;
				elem.innerHTML = c;
			}
		}
	}
	else if(page=="S")
	{
		if(window.pageNo <= ((window.totRow/window.lineSize)-1)+2)
			page = (window.pageNo - 1) + 2;

		if(document.getElementById("page5").value <= ((window.totRow/window.lineSize)-1)+2)
		{
			for(i=1; i<=5; i++)
			{
				elem = document.getElementById("page"+i);
				c = (elem.value -1)+2;
				elem.value = c;
				elem.innerHTML = c;
			}
		}
	}
	window.pageNo = page;

	if(window.totRow >= page * window.lineSize)
	{
		k = page * window.lineSize;
		n = k - window.lineSize ;
	}
	else if(window.totRow >= (page-1) * window.lineSize)
	{
		k = window.totRow;
		n = (page-1) * window.lineSize;
	}
	else
	{
		return;
	}
	logStr("n: "+n+", k: "+k);
	
	if(k > 0 && window.totRow > 0)
	{
		order = 1;
		for(i = n; i < k; i++)
		{
			for(j = 0; j < window.fieldNames.length; j++)
			{				
				if(j == 0)
				{
					if(window.isModal)
						tableStr += "<tr><td>"+order+"</td><td onclick = \"getModal("+window.dataRegister[i][fieldNames[j]]+
									")\"";
					else
						tableStr += "<tr><td>"+order+"</td><td onclick = \"setUpdateForm("+window.dataRegister[i][fieldNames[j]]+
									")\"";
				}	
				else
					tableStr += "<td";
				
				if(j == window.invisibleFM[j])
					tableStr += " style=\"display:none;\"";
				
				tableStr += ">"+window.dataRegister[i][window.fieldNames[j]]+"</td>";
			}
			tableStr += "</tr>";
			order++;
		}
		document.getElementById("listTb").innerHTML = tableStr;
	}
}

// For refreshing current page with timeout
function pageRefresh(timeOut)
{
	if(timeOut == undefined || timeOut == 0)
		
		window.location.reload(true);
	else
		setTimeout("window.location.reload(true);", timeOut);
}

//________________________________________________________________________________________________________________________________________

/*! modal */

// For formatting date time values
function dateTimeFormat(dateStr, isDateTime)
{
	let D="00", M="00", Y="0000", h="00", m="00", s="00";
	
	if(window.dateF == "MDY")
	{
		M = dateStr.substring(0,2);
		D = dateStr.substring(3,5);
		Y = dateStr.substring(6,10);
	}else
	if(window.dateF == "YMD")
	{
		Y = dateStr.substring(0,4);
		M = dateStr.substring(5,7);
		D = dateStr.substring(8,10);
	}else
	{
		D = dateStr.substring(0,2);
		M = dateStr.substring(3,5);
		Y = dateStr.substring(6,10);
	}
	if(!isDateTime)
		return Y+"-"+M+"-"+D;
	
	if(window.timeF == "T")
	{
		h = dateStr.substring(11,13);
		m = dateStr.substring(14,16);
		s = dateStr.substring(17,19);

		return Y+"-"+M+"-"+D+"T"+h+":"+m+":"+s;
	}else
	{
		h = dateStr.substring(11,13);
		m = dateStr.substring(14,16);
		
		return Y+"-"+M+"-"+D+"T"+h+":"+m;
	}
}

// For preparing modal html form 
function getModal(id)
{
	let k = window.fieldNames.length;
	let m = 0, n = 0;
	let tableStr = "", logDataStr = "";
	
	let h=0, p=0;
	let isList = false, isDate = false;
	
	if(window.dataRegister != undefined && window.dataRegister && window.dataRegister.length > 0)
		m = window.dataRegister.length;
	
	if(window.listN4Modal != undefined && window.listN4Modal && window.listN4Modal.length > 0)
		n = window.listN4Modal.length;
	
	if(window.msgNdx != undefined && window.msgNdx > 0)
	{
		for(let i=0; i<m; i++)
		{
			if(window.dataRegister[i][window.fieldNames[0]] == id)
			{
				tableStr = "<tr><td><h5>"+window.dataRegister[i][window.fieldNames[msgNdx]]+"</h5></td></tr>";
			}
		}
		document.getElementById("modalTb").innerHTML = tableStr;
	}
	else
	{
	  for(let i=0; i<m; i++)
	  {
		if(window.dataRegister[i][window.fieldNames[0]] == id)
		{
		  for(let j=0; j<k; j++)
		  {
			 if(window.inputTypes[j] == "textarea")
			 {	 
				tableStr += "<div class=\"row\"><div class=\"col-md-auto col-8\"><label for=\"g_"+(j+1)+"\">"+window.labelNames[j]+":</label>"+
							"<textarea   id=\"g_"+(j+1)+"\""+
							" rows=10 cols=70  name=\""+window.fieldNames[j]+"\""; 
							
				 if(j == window.readOnlyFM[j])
					 tableStr += " readonly";
				 
				 if(j == window.requiredFM[j])
					 tableStr += " required";
				
				if(isLog)
				{
					logDataStr = JSON.stringify(window.dataRegister[i][window.fieldNames[index]]);
					logStr(logDataStr);
					tableStr += ">"+logDataStr+"</textarea></div></div>";
				}		
				else
					tableStr += ">"+window.dataRegister[i][window.fieldNames[j]]+"</textarea></div></div>";
			 }
			 else
			 {
				if((j % mCols) == 0) // is even 
					tableStr += "<div class=\"row\">";				
				
				 tableStr += "<div class=\"col-md-auto col-4\"><label for=\"g_"+(j+1)+"\" >"+window.labelNames[j]+":</label>"+
							 "<input class=\"form-control form-control-sm\" id=\"g_"+(j+1)+"\"";
				 
				 if(window.inputTypes[j] == "datetime-local")
				   tableStr += " value=\""+dateTimeFormat(window.dataRegister[i][window.fieldNames[j]], true)+"\" name=\""+window.fieldNames[j]+"\"";
				 else 
				 if(window.inputTypes[j] == "date")
				   tableStr += " value=\""+dateTimeFormat(window.dataRegister[i][window.fieldNames[j]], false)+"\" name=\""+window.fieldNames[j]+"\"";
				 else
				 if(window.inputTypes[j] == "number" && window.numStep != undefined)
				   tableStr += " value=\""+window.dataRegister[i][window.fieldNames[j]]+"\" name=\""+window.fieldNames[j]+"\""+
								" step=\""+window.numStep+"\"";
				 else
				   tableStr += " value=\""+window.dataRegister[i][window.fieldNames[j]]+"\" name=\""+window.fieldNames[j]+"\"";
				 
				 if(j == window.readOnlyFM[j])
					 tableStr += " readonly";
				 
				 if(j == window.requiredFM[j])
					 tableStr += " required";
					
				 tableStr += " type=\""+window.inputTypes[j]+"\"";
				 
				 isList = false;
				 
				 if(window.listN4Modal != undefined && window.listN4Modal)
				 {
					 for(h=0; h < n; h++)
					 {
						if(window.listN4Modal[h].name == window.fieldNames[j])
						{
							tableStr += " list=\""+window.listN4Modal[h].id+"\"><datalist id=\""+
										window.listN4Modal[h].id+"\"></datalist></div>";
							isList = true;
						}
					 }
				 }
				 if(!isList)
					tableStr += "></div>";
								
				 if(j > 0 && ((j % mCols) == (mCols-1) || j == k-1)) // is odd or last
					tableStr += "</div>";
			 }					
		  }
		  document.getElementById("modalBody").innerHTML = tableStr;
		  
		  if(n > 0)
			setList(window.listN4Modal, window.selectLists);
		}
	  }
	}
	if(tableStr !== "")
	{
		var myModal;
		
		if(window.isLocale) 
		  myModal = new bootstrap.Modal(document.getElementById('guncM'));
		else 
		  myModal = new bootstrap.Modal(document.getElementById('updM'));
		myModal.show();
	}
}

//________________________________________________________________________________________________________________________________________

/*! update */

// For getting update form instead modal
function setUpdateForm(id)
{
	let k = window.fieldNames.length;
	let m = 0;
	let n = 0;
	let tableStr = "";
	
	let h=0, p=0;
	let isList = false, isDate = false;
	
	if(window.dataRegister != undefined && window.dataRegister && window.dataRegister.length > 0)
		m = window.dataRegister.length;
	
	for(let i=0; i<m; i++)
	{
		if(window.dataRegister[i][window.fieldNames[0]] == id)
		{
		  for(let j=0; j<k; j++)
		  {
			 if(window.inputTypes[j] == "datetime-local")
			   document.getElementById("g_"+(j+1)).value = dateTimeFormat(window.dataRegister[i][window.fieldNames[j]], true);
			 else 
			 if(window.inputTypes[j] == "date")
			   document.getElementById("g_"+(j+1)).value = dateTimeFormat(window.dataRegister[i][window.fieldNames[j]], false);
			 else
			   document.getElementById("g_"+(j+1)).value = window.dataRegister[i][window.fieldNames[j]];
			 
		  }
		}
	}
	var updCollapse = new bootstrap.Collapse(window.updButId, {
						  toggle: false, show: true, hide: false
						});
	updCollapse.show(); //toggle");
}

//________________________________________________________________________________________________________________________________________

/*! actions */

// For setting selection data value
function setSelectData(formData, formId)
{
	let inpIds = selInpIds[formId];
	
	if(inpIds)
	{
		for(let j=0; j < inpIds.length; j++)
		{
			formData.set(inpIds[j].name, document.getElementById(inpIds[j].id).value);
			
			logStr("getElementById-value:" + document.getElementById(inpIds[j].id).value);
		}
	}
}

// For sending selection form data with ajax
function sendSelect(url, formId)
{
	var formData = getSelFormData(formId);
	
	sendForm(url, selectResponse, formData);
}

function getSelFormData(formId)
{
	var formElement = document.getElementById(formId);
	
	var formData = new FormData(formElement);

	if(window.isWithRefs)
		setSelectData(formData, formId);
	
	formData.append("action","select");
	
	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	return formData;
}

// For setting selection response data
function selectResponse(xhr) 
{
	if(xhr.responseText)  
	{
		logStr(xhr.responseText); //logJD

		window.jsObjData = JSON.parse(xhr.responseText);

		window.dataRegister = window.jsObjData.data; 
		window.pageNo = 1;

		if(window.dataRegister)
			window.totRow = window.dataRegister.length;
				
		putMessages();
	}
	setSelectList();
}

function setSelectList()
{
	if(window.dataRegister) 
    {
		logStr("dataRegister[0][fieldNames[0]] : "+window.dataRegister[0][fieldNames[0]]+
			", dataRegister[0][fieldNames[1]] : "+window.dataRegister[0][fieldNames[1]]+
			", pageNo : "+ 1 + ", totRow : "+window.dataRegister.length);
		setPage();
    }
    else
    {
		logStr("json data is empty!");
		document.getElementById("listTb").innerHTML = "";
    }
}

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
	if(window.dataRegister != undefined && window.dataRegister !== "")
	
		window.dataRegister.push(dataRow[0]);
	else
		window.dataRegister = dataRow;
	
	window.totRow = window.dataRegister.length;
		
	if (window.lastProp == window.fieldNames[0])
		sortById();
	else
		sortByProp(window.lastProp); 
}

// For sending update form data with ajax
function sendUpdate(url, formId)
{
	var formData = getUpdFormData(formId);
	
	sendForm(url, updateResponse, formData);
}

function getUpdFormData(formId)
{
	var formElement = document.getElementById(formId);
	
	var formData = new FormData(formElement);

	if(isWithRefs)
		setSelectData(formData, formId);
	
	formData.append("action","update");
	
	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	return formData;
}

// For setting update response data
function updateResponse(xhr)
{
	var dataRow = null; 

	if(xhr.responseText !== "")
	{
		window.jsObjData = JSON.parse(xhr.responseText);
		dataRow = window.jsObjData.data;
		
		logJD(window.jsObjData);

		putMessages();
	}else
		logStr("json data is empty!");
	
	logStr(jsObjData);
	logStr(dataRow);
	
	if(dataRow != undefined && dataRow !== "") 
		updateRow(dataRow);
		
	modalHide();
}

function updateRow(dataRow)
{
	for(let i=0; i < window.dataRegister.length; i++)
	{
		if(dataRow[0].id == window.dataRegister[i].id)
		{
			window.dataRegister[i] = Object.assign({}, dataRow[0]);
		}
	}
	if (window.lastProp == window.fieldNames[0])
		sortById();
	else
		sortByProp(window.lastProp); 
}

// For sending delete form data with ajax
function sendDelete(url, formId)
{
	var formData = getDelFormData(formId);
	
	sendForm(url, deleteResponse, formData);
}

function getDelFormData(formId)
{
	var formElement = document.getElementById(formId);
	
	var formData = new FormData(formElement);

	if(isWithRefs)
		setSelectData(formData, formId);
	
	formData.append("action","delete");
	
	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	return formData;
}

// For setting delete response data
function deleteResponse(xhr)
{
	var dataRow = null;

	if(xhr.responseText !== "")
	{
		window.jsObjData = JSON.parse(xhr.responseText); 
		dataRow = window.jsObjData.data;

		logJD(window.jsObjData);

		putMessages();
	}else
		logStr("json data is empty!");
	
	if(dataRow != undefined && dataRow !== "")
		deleteRow(dataRow);
	
	modalHide();
}

function deleteRow(dataRow)
{
	for(let i=0; i < window.dataRegister.length; i++)
	{
		if(dataRow[0].id == window.dataRegister[i].id)
			window.dataRegister.splice(i, 1); 
	}
	window.totRow = window.dataRegister.length;
		
	if (window.lastProp == window.fieldNames[0])
		sortById();
	else
		sortByProp(window.lastProp); 
}

// For sending form data to url and calling response function
function sendForm(url, callFunc, formData) 
{
  var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
  
  xhr.open("POST", url, true);

  //xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  
  xhr.onreadystatechange = function() 
  {
    if (xhr.readyState == 4 && xhr.status == 200) 
	{
      callFunc(xhr);
    }
  };
  xhr.send(formData);
}

//_______________________________________________________________________________________________________________________________________

function getCurFormData()
{
	var formData = new FormData();

	formData.append("action","currency");
	
	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	return formData;
}

function getImgFormData(formId, action)
{
	var formElement = document.getElementById(formId);
	
	var formData = new FormData(formElement);

	formData.append("action", action);
	
	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	return formData;
}

//For sending form data with fetch
async function sendFormWF(url, formId, action)   
{
	var formData = null;
	var dataRow = null;
	var objblob = null;
	var imageUrl = null;
	window.jsObjData = null;
	
	switch (action) 
	{
		case "select": formData = getSelFormData(formId); break;
		case "insert": formData = getInsFormData(formId); break;
		case "update": formData = getUpdFormData(formId); break;
		case "delete": formData = getDelFormData(formId); break;
		case "currency": formData = getCurFormData(formId); break;
		case "download": 
		case "pdfdwnl": 
		case "image": formData = getImgFormData(formId, action); break;
		default: logStr("incorrect action type!"); return;
	}		

	//try {
		const response = await fetch(url,  
		{
		    method: "POST",
		    body: formData,
		});
		
		if (!response.ok) {
		      throw new Error(`Error! status: ${response.status}`);
		}
    
		if(action == "image" || action == "download" || action == "pdfdwnl") {
			
			objblob = await response.blob();
		} 
		else
			window.jsObjData = await response.json();  
	//} 
	//catch (error) {
	//    console.error("Fetch Error:", error);
	//}
	const delay = (ms = 1000) => new Promise(r => setTimeout(r, ms));
	
	let c = 0;
	
	if(action == "image" || action == "download" || action == "pdfdwnl") 
	{	
		do{
			//window.alert("Fetch işlemi tamamlanmadı!");
			await delay();
			c++;
			if(c >= 3) {
				
				logStr("Fetch akış yok!");
				break;
			}
		}while(objblob == null);
	}
	else {	
		do{
			//window.alert("Fetch işlemi tamamlanmadı!");
			await delay();
			c++;
			if(c >= 3) {
				
				logStr("Fetch bilgiler yok!");
				break;
			}
		}while(window.jsObjData == null);
	}

	if(action == "select" || action == "currency")
	{
		window.dataRegister = window.jsObjData.data;
		window.pageNo = 1;

		if(window.dataRegister)
			window.totRow = window.dataRegister.length;
				
		putMessages();
	}
	else if((action == "image" || action == "download" || action == "pdfdwnl") && objblob != null) {
		
 	    imageUrl = URL.createObjectURL(objblob);
	}
	else
	{
		dataRow = window.jsObjData.data;
		
		putMessages();
	}
	
	switch (action) 
	{
		case "select": setSelectList();
					   //putMessages(); 
					   break;
		case "insert": if(dataRow != null && dataRow !== "") { 
					   
							insertRow(dataRow);
							
						   putMessages();
					   }
					   break;
		case "update": if(dataRow != undefined && dataRow !== "") 
							updateRow(dataRow);
					   document.getElementById(formId).reset(); 

					   putMessages();
					   break;
		case "delete": if(dataRow != undefined && dataRow !== "") 
							deleteRow(dataRow); 
					   document.getElementById(formId).reset(); 

							if(isModal) 
							   myModal.hide();
						   else 
							   updCollapse.hide();
					   putMessages();
					   break;
		case "currency": 
					   setSelectList(); 
					   break;
		case "image": 
					   if(objblob != null) 
					   		document.getElementById("g_img").src = imageUrl;
					   logStr("action is image!");
					   break;					   
		case "download": 
					   if(objblob != null){ 
					   		
					   		let fileName = formData.get(window.fieldNames[1]);
					   		
					   		downloadFile(fileName, imageUrl);
					   	}
					   logStr("action is download!");
					   break;					   
		case "pdfdwnl": 
					   if(objblob != null){ 
					   		
					   		let fileName = formData.get(window.fieldNames[1])+"_.pdf";
					   		
					   		downloadFile(fileName, imageUrl);
					   	}
					   logStr("action is pdf!");
					   break;					   
		default: logStr("incorrect action type!"); return;
	}		
}

function downloadFile(fileName, imageUrl)
{
    let a = document.createElement("a");
    
	//let url = window.URL.createObjectURL(bclob);
	
	a.href = imageUrl;
	
    a.style = "display: none";
        
	a.download = fileName;
	
    a.click();
	
	window.URL.revokeObjectURL(imageUrl);
}

function sleep(milliseconds) {
  
  const date = Date.now();
  let currentDate = null;
  
  do {
    currentDate = Date.now();
	
  } while (currentDate - date < milliseconds);
}

function sleep(milliseconds) {
  
  const date = Date.now();
  let currentDate = null;
  
  do {
    currentDate = Date.now();
	
  } while (currentDate - date < milliseconds);
}

//const sleep2 = (delay) => new Promise((resolve) => setTimeout(resolve, delay));

function sleep3(ms) {
	
  return new Promise(resolve => setTimeout(resolve, ms));
}
//_______________________________________________________________________________________________________________________________________


/*! file */

// For logging file info to console
function fileInfo(elm1, elm2, elm3, elm4)
{
	let file = document.getElementById(elm1);
	let name = document.getElementById(elm2);
	let size = document.getElementById(elm3);
	let type = document.getElementById(elm4);
	
	name.value = file.files[0].name;
	size.value = file.files[0].size;
	type.value = file.files[0].type;
	logStr(file.files[0].type);
}

// For sending file name to input
function fileNameInfo(elm1, elm2) 
{
	let file = document.getElementById(elm1);
	let name = document.getElementById(elm2);
	let dot = file.files[0].name.indexOf('.');

	name.value = file.files[0].name.substring(0, dot);
}

// For sending download form data to url with ajax
function sendDownload(url, formId, fileId, isPage) 
{
	var formElement = document.getElementById(formId);
	
	var formData = new FormData(formElement);
	
	var fileName = document.getElementById(fileId).value;
	
	if(isPage === true) fileName += ".html";
	
	logStr(fileName);
	
	if(isWithRefs)
		setSelectData(formData, formId);
	
	formData.append("action","download");
	
	formData.append("isLocale", window.isLocale);
	
	logFD(formData);
	
	let xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");

	xhr.open("POST", url, true);
	xhr.responseType = "blob"; 

	xhr.onload = function() 
	{
		if (xhr.readyState == 4 && xhr.status == 200) 
		{
			var bclob = xhr.response;
			
			downloadResponse(fileName, bclob);
		}
	};
	xhr.send(formData);
}

// For setting download response data
function downloadResponse(fileName, bclob)
{
    let a = document.createElement("a");
    
	let url = window.URL.createObjectURL(bclob);
	
	a.href = url;
	
    a.style = "display: none";
        
	a.download = fileName;
	
    a.click();
	
	window.URL.revokeObjectURL(url);
}

//________________________________________________________________________________________________________________________________________

/*! export */

// For getting data array as string
function getList()
{
	var dataStr = "";
	
	for(let n=0; n < labelNames.length; n++)
		dataStr += labelNames[n]+ ",";
	
	dataStr += "\n";
	
	for(let i=0; i < dataRegister.length; i++)
	{
		for(let j=0; j < fieldNames.length; j++)
		{
			dataStr += dataRegister[i][fieldNames[j]]+ ",";
			
			if(j == (fieldNames.length-1))
				dataStr += "\n";
		}
	}
	return dataStr;
}

// For getting data array as json string
function getJSList()
{
	var jsonStr = "[";
	
	for(let i=0; i < dataRegister.length; i++)
	{
		jsonStr += "{";
		for(let j=0; j < fieldNames.length; j++)
		{
			jsonStr += "\""+labelNames[j]+"\":\""+dataRegister[i][fieldNames[j]]+"\""; 
			
			if(j < (fieldNames.length-1))
				jsonStr += ",";
		}
		jsonStr += "}";
		
		if(i < (dataRegister.length-1))
			jsonStr += ",";
	}
	jsonStr += "]";
	
	return jsonStr;
}

// For exporting to excel file
function exportToExcel(file = "")  
{
	file = file?file+".xlsx":"excel_list.xlsx";
    
	var workbook = new ExcelJS.Workbook();
	var worksheet = workbook.addWorksheet('excel_list');
	
	worksheet.columns = excelCols;
	worksheet.addRows(dataRegister);
	
	var buff = workbook.xlsx.writeBuffer().then(function (data) {
		var blob = new Blob([data], {type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"});
		saveAs(blob, file); 
    });
}

// For exporting to json file
function exportToJson(file = "")
{
	let jsonList = getJSList(); 
	
    file = file?file+".json":"json_list.json";
 
	var data  = "application/json;charset=utf-8," + jsonList; 
 
	exportData(data, file);
}

// For exporting to csv text file
function exportToCSV(file = "")
{
	let csvList = getList();
	
    file = file?file+".csv":"csv_list.csv";
 
	let data  = "text/csv;charset=utf-8," + encodeURIComponent(csvList); 
	
	exportData(data, file);
}
	
// For exporting to pdf file
function exportToPDF(title)
{
    let pdfList = JSON.parse(getJSList()); 
	
	logStr(pdfList);
	
	printJS({printable: pdfList, properties: labelNames, type: "json",
			 gridHeaderStyle: "color: darkblue;  border: 1px solid #557799;",
			 gridStyle: "border: 1px solid #7799BB;",
			 documentTitle: title});  
}

function printHTML(divId) 
{
  const content = document.getElementById(divId).innerHTML;
  const printPage = window.open('', '_blank');
  printPage.document.write('<html><head><title>Print</title></head><body>');
  printPage.document.write(content);
  printPage.document.write('</body></html>');
  printPage.document.close();
  printPage.print();
} 
  
// For exporting data to file
function exportData(data, file)
{
	let dwnLink = document.createElement("a");

    document.body.appendChild(dwnLink);

	dwnLink.href = "data:" + data;

	dwnLink.download = file;
	
	dwnLink.click();
}

function addSpace2Text(elm)
{
	let txElm = document.getElementById(elm);
	let text = txElm.value;
	
		
	text = text.replace(/([A-Z,Ç,Ğ,İ,Ö,Ş,Ü])/g, ' $1').trim();
	text = text.replace(/  +/g, ' ').trim();
	logStr(text);
	
	txElm.value = text;
}

