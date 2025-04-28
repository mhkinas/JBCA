<%--
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 --%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="com.jbca.user.PasswordChangeParams,com.jbca.base.BaseProcesses,com.sdb.utility.JsonConverter,com.sdb.utility.ArrayToString,java.util.Arrays"%>

<%
	PasswordChangeParams p = new PasswordChangeParams();
	p.setLangLoc();
	
	BaseProcesses process = new BaseProcesses(request, response, p);
	process.checkSes4JSP();

	String jsObjData = null, servletName = "passwordChangeServlet", jspTitle = "Şifre Değiştir", errorString = null, qsql = null, 
	menuString = null,  leftSideStr = null;
	boolean dbQuery = false;

	try
	{
		p.initParams();

	 	p.sessionBean.setGroup(process.httpSession.getAttribute("ses_group").toString());
	
		process.checkAuth4JSP(p);
		
		if(p.sessionBean.getGroup().equals("Admin"))
		{
	menuString = p.menuBean.getMenu(null, false, new String[] {"Yonetici-Menu","/JBCA_F/menu/"});
	leftSideStr = p.pageBean.getPage(null, false, new String[] {"Yonetim-Sidebar","/JBCA_F/page/"});
		}
		else if(p.sessionBean.getGroup().equals("Supervisor"))
		{
	menuString = p.menuBean.getMenu(null, false, new String[] {"Gozetmen-Menu","/JBCA_F/menu/"});
	leftSideStr = p.pageBean.getPage(null, false, new String[] {"Gozetim-Sidebar","/JBCA_F/page/"});
		}
		else if(p.sessionBean.getGroup().equals("Normal"))
		{
	menuString = p.menuBean.getMenu(null, false, new String[] {"Normal-Kul-Menu","/JBCA_F/menu/"});
	leftSideStr = p.pageBean.getPage(null, false, new String[] {"Normal-Sidebar-TR","/JBCA_F/page/"});
		}
		
		if (menuString == null)
	errorString = p.menuBean.getErrorString();
	
		if(leftSideStr == null)
	errorString = p.pageBean.getErrorString();
    } 
	catch(Exception ex) {
    	ex.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="tr"  data-bs-theme="dark">
<head>
<title><%=p.jspTitle%></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/JBCA_F/css/bootstrap.min.css" rel="stylesheet" >
<link href="/JBCA_F/css/print.min.css" rel="stylesheet">
<link href="/JBCA_F/css/all.min.css" rel="stylesheet">
<script src="/JBCA_F/js/popper.min.js"></script>
<script src="/JBCA_F/js/bootstrap.min.js"></script>
<script src="/JBCA_F/js/print.min.js"></script>
<script src="/JBCA_F/js/exceljs.min.js"></script>
<script src="/JBCA_F/js/FileSaver.js"></script>
<script src="/JBCA_F/js/jbca.js"></script>
</head>

<body>

	<%=menuString%>
	
	<div class="container-fluid">
	  <div class="row">

	  <%=leftSideStr%>

      <div class="col-sm-11 col-md-10">
		<h2 class="sub-header"><%=p.jspTitle%></h2>
		<form method="post" id="guncelleK" class="form" enctype="multipart/form-data">
			<div class="form-group">
				<div class="row"> 
					<div class="col-md-auto col-3">
						<label for="g_1" class="col-form-label-sm"><%=p.labelNames[1]%>:</label>
						<input type="<%=p.inputTypes[1]%>" class="form-control form-control-sm" id="g_1" name="<%=p.fieldNames[1]%>"
								   placeholder="<%=p.labelNames[1]%> giriniz.">
					</div>
					<div class="col-md-auto col-3">
						<label for="g_2" class="col-form-label-sm"><%=p.labelNames[2]%>:</label>
						<input type="<%=p.inputTypes[2]%>" class="form-control form-control-sm" id="g_2" name="<%=p.fieldNames[2]%>" 
								   placeholder="<%=p.labelNames[2]%> giriniz." list="paths">
					</div>
					<div class="col-md-auto col-3">
						<label for="g_3" class="col-form-label-sm"><%=p.labelNames[3]%>:</label>
						<input type="<%=p.inputTypes[3]%>" class="form-control form-control-sm" id="g_3" name="<%=p.fieldNames[3]%>"
								   placeholder="<%=p.labelNames[3]%> giriniz." list="types">
					</div>
				</div>						<tr>
				<div class="row">&nbsp;</div>
				<div class="row">
					<div class="col-md-auto col-2">
						<button type="button" class="btn btn-outline-info btn-sm"
								onclick='sendUpdate("/<%=p.contextRoot%>/<%=servletName%>","guncelleK")'>Kaydet</button>
					</div>
					<div class="col-md-auto col-2">
						<button type="reset" class="btn btn-outline-secondary btn-sm">İptal</button>
					</div>
					<div class="col-md-2">&nbsp;</div><div class="col-md-2">&nbsp;</div>
					<div class="col-md-2">&nbsp;</div><div class="col-md-2">&nbsp;</div>
				</div>	
			</div>
		</form>
	  </div>
	</div>

	  <div id="alerts">
		<%
			if (errorString != null && errorString.length() > 0) {
		%>
		<div id="alertd" class="alert alert-danger">
			<strong>errorString :</strong> 
			 <%=errorString%>
		</div>
		<%
			}
		%>
	  </div>

	</div>

  <script>
	var jsObjData, dataRegister, selectLists, fieldNames, selectNames, labelNames, inputTypes, readOnlyFM, invisibleFM, requiredFM, 
		isModal, isWithRefs, selInpIds, listN4Page, listN4Modal, dateF, timeF, pageNo, totRow, lineCount, mCols, isLocale;

	document.addEventListener("DOMContentLoaded", function(event) { 
	
<%if (jsObjData != null && jsObjData.length() > 0) {%>		
		jsObjData = <%=jsObjData%>;
		dataRegister = jsObjData.data;
<%}%>		
		fieldNames = <%=ArrayToString.getStringWithComma((String[]) p.fieldNames)%>;
		selectNames = <%=ArrayToString.getStringWithComma((String[]) p.selectFields)%>;
		labelNames = <%=ArrayToString.getStringWithComma((String[]) p.labelNames)%>;
		inputTypes = <%=ArrayToString.getStringWithComma((String[]) p.inputTypes)%>;
		readOnlyFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.readOnlyFM).boxed().toArray( Integer[]::new ))%>;
		invisibleFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.invisibleFM).boxed().toArray( Integer[]::new ))%>;
		requiredFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.requiredFM).boxed().toArray( Integer[]::new ))%>;
		isModal = <%=p.isModal%>;
		isWithRefs = <%=p.isWithRefs%>;
		isLocale = <%=p.isLocale%>;
		 
	});
	
	document.getElementById('temeModeSwitch').addEventListener('click',()=>{
		if (document.documentElement.getAttribute('data-bs-theme') == 'dark') {
			document.documentElement.setAttribute('data-bs-theme','light')
		}
		else {
			document.documentElement.setAttribute('data-bs-theme','dark')
		}
	});
 </script>

</body>
</html>
<% 		p.menuBean.closeAll();
%>
