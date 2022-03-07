<%--
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 --%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="com.jbca.info.ContactParams,com.jbca.base.BaseProcesses, 
				 com.sdb.utility.JsonConverter, 
				 com.sdb.utility.ArrayToString, 
				 java.util.Arrays"
%>
<%
	ContactParams p = new ContactParams();
	p.setLangEN();
	
	BaseProcesses process = new BaseProcesses(request, response, p);
	process.checkSes4JSP();

	boolean dbQuery = false;
	String jsObjData = null, servletName = "contactServlet", selectLists = null, errorString = null, qsql = null, 
	menuString = null, leftSideStr = null, codeStrMW90 = null, codeStrBW = null, excelCols = null;

	try
	{
		p.initParams();
		p.action = "select";
		p.formData = new String[p.selectFields.length];
		p.dateFormatter.setIsForm(false);
	
	 	p.sessionBean.setName(process.httpSession.getAttribute("ses_code").toString());
	 	p.sessionBean.setGroup(process.httpSession.getAttribute("ses_group").toString());
	 	p.sessionBean.setLineCount(process.httpSession.getAttribute("ses_psize").toString());
	
		process.checkAuth4JSP(p);
		
		dbQuery = p.execTableWR.tableActionWR(p.action, p.formData, p.prepQueryWR);
		
		qsql = p.execTableWR.getQueryString();
		
		if (dbQuery)
		{
			p.tableData = p.execTableWR.selectData(p.dataType);
		}
		
		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.execTableWR);
		
		jsObjData = p.jsonConverter.convert2JSobj();
		
		excelCols = p.jsonConverter.conv2ExcelCols(p.labelNames, p.colWidths);
		
		//System.out.println(jsObjData);
		
		p.selLists = p.manageSelList.getLists();
		
		//System.out.println(p.selLists[0][0]);	
		
		if(p.selLists != null && p.selLists[0] != null)
		
			selectLists = p.jsonConverter.convert2Lists(p.refFieldMatchs, p.selLists);
		else
			errorString = p.manageSelList.getErrorString();
		
		if(p.sessionBean.getGroup().equals("Admin"))
		{
			menuString = p.menuBean.getMenu(null, false, new String[] {"Admin-Menu","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[] {"Admin-Sidebar","/JBCA_F/page/"});
		}
		else if(p.sessionBean.getGroup().equals("Supervisor"))
		{
			menuString = p.menuBean.getMenu(null, false, new String[] {"Supervisor-Menu","/JBCA_F/menu/","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[] {"Supervisor-Sidebar","/JBCA_F/page/"});
		}
		else if(p.sessionBean.getGroup().equals("Normal"))
		{
			menuString = p.menuBean.getMenu(null, false, new String[] {"Normal-User-Menu","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[] {"Normal-Sidebar","/JBCA_F/page/"});
		}
		codeStrMW90 = p.codeBean.getCode(null, false, new String[] {"modal-width-90","/JBCA_F/code/"});
		codeStrBW = p.codeBean.getCode(null, false, new String[] {"back-warn","/JBCA_F/code/"});
		
		if (menuString == null)
			errorString = p.menuBean.getErrorString();
		
		if(leftSideStr == null)
			errorString = p.pageBean.getErrorString();
		
		if(codeStrMW90 == null)
			errorString = p.codeBean.getErrorString();
    } 
	catch(Exception ex) {
    	ex.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title><%=p.jspTitle%></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/JBCA_F/css/bootstrap.css" rel="stylesheet" >
<link href="/JBCA_F/css/print.min.css" rel="stylesheet">
<script src="/JBCA_F/js/jquery.min.js"></script>
<script src="/JBCA_F/js/popper.min.js"></script>
<script src="/JBCA_F/js/bootstrap.js"></script>
<script src="/JBCA_F/js/print.min.js"></script>
<script src="/JBCA_F/js/exceljs.min.js"></script>
<script src="/JBCA_F/js/FileSaver.js"></script>
<script src="/JBCA_F/js/jbca.js"></script>
<style type="text/css">
<%=codeStrMW90%>
</style>
<script>
<%=codeStrBW%>
</script>
</head>

<body>

	<%=menuString%>

	<div class="container-fluid">
	  <div class="row">

	  <%=leftSideStr%>

      <div class="col-md-11 col-xl-10">
		<a href="#searchR" class="btn btn-outline-dark" data-toggle="collapse">Search <%=p.jspTitle%></a>
		<form method="post" id="searchR" class="form collapse" enctype="multipart/form-data">
			<div class="form-group">
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td><label for="s_1" class="col-form-label-sm"><%=p.selectLabels[0]%>:</label></td>
							<td><input type="<%=p.selectITs[0]%>" class="form-control form-control-sm" id="s_1" name="<%=p.selectFields[0]%>" 
									   placeholder="Enter <%=p.selectLabels[0]%>"></td>
							<td><label for="s_2" class="col-form-label-sm"><%=p.selectLabels[1]%>:</label></td>
							<td><input type="<%=p.selectITs[1]%>" class="form-control form-control-sm" id="s_2" name="<%=p.selectFields[1]%>"
									   placeholder="Enter <%=p.selectLabels[1]%>"></td>
							<td><label for="s_3" class="col-form-label-sm"><%=p.selectLabels[2]%>:</label></td>
							<td><input type="<%=p.selectITs[2]%>" class="form-control form-control-sm" id="s_3" name="<%=p.selectFields[2]%>" 
									   placeholder="Enter <%=p.selectLabels[2]%>"></td>
							<td>&nbsp;</td><td>&nbsp;</td>
						</tr>
						<tr>
							<td><label for="s_4" class="col-form-label-sm"><%=p.selectLabels[3]%>:</label></td>
							<td><input type="<%=p.selectITs[3]%>" class="form-control form-control-sm" id="s_4" name="<%=p.selectFields[3]%>" 
									   placeholder="Enter <%=p.selectLabels[3]%>" list="codes"></td>
								<datalist id="codes"></datalist>
							<td><label for="s_5" class="col-form-label-sm"><%=p.selectLabels[4]%>:</label></td>
							<td><input type="<%=p.selectITs[4]%>" class="form-control form-control-sm" id="s_5" name="<%=p.selectFields[4]%>"
									   placeholder="Enter <%=p.selectLabels[4]%>"></td>
							<td><label for="s_6" class="col-form-label-sm"><%=p.selectLabels[5]%>:</label></td>
							<td><input type="<%=p.selectITs[5]%>" class="form-control form-control-sm" id="s_6" name="<%=p.selectFields[5]%>" 
									   placeholder="Enter <%=p.selectLabels[5]%>"></td>
							<td>&nbsp;</td><td>&nbsp;</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-outline-info btn-sm"
									onclick='sendSelect("/<%=p.contextRoot%>/<%=servletName%>","searchR")'>Search</button></td>
							<td><button type="reset" class="btn btn-outline-secondary btn-sm">Cancel</button></td>
							<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
							<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	  </div>
	</div>

	<div class="row" id="ldTable">
	  <div class="col-md-12">
		<h2 class="sub-header"><%=p.jspTitle%> List</h2>
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-sm">
				<thead>
					<!-- style="display: table-header-group; page-break-after: avoid;"> -->
					<tr>
						<th>Otder</th>
						<th onclick="sortById()"><%=p.labelNames[0]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[1]%>')"><%=p.labelNames[1]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[2]%>')"><%=p.labelNames[2]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[3]%>')"><%=p.labelNames[3]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[4]%>')" style="display:none;"><%=p.labelNames[4]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[5]%>')"><%=p.labelNames[5]%></th>
						<th onclick="sortByDate('<%=p.fieldNames[6]%>', true)"><%=p.labelNames[6]%></th>
					</tr>
				</thead>
				<tbody id="listTb">
				</tbody>
			</table>
		</div>

		<div id="pgnId">
			<ul class="pagination">
				<li>
					<input id="p_size" type="text" class="form-control form-control-sm" value=<%=p.sessionBean.getLineCount()%> size=3 
						onchange="setPage()"> 
					<br/>
				</li>
				<li>
					<button type="button" class="btn btn-outline-info btn-sm" id="pageO" onclick="getPage('O')" aria-label="Before"><span aria-hidden="true">&laquo;</span></button>
				</li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page1" onclick="paging(1)" value="1">1</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page2" onclick="paging(2)" value="2">2</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page3" onclick="paging(3)" value="3">3</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page4" onclick="paging(4)" value="4">4</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page5" onclick="paging(5)" value="5">5</button></li>
				<li>
					<button type="button" class="btn btn-outline-info btn-sm" id="pageS" onclick="getPage('S')" aria-label="Next"><span aria-hidden="true">&raquo;</span></button>
					<br/>
				</li>
				<li><button type="button" class="btn btn-outline-info btn-sm" onclick="exportToExcel('<%=p.jspTitle%>List')">Excel</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" onclick="exportToJson('<%=p.jspTitle%>List')">Json</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" onclick="exportToCSV('<%=p.jspTitle%>List')">CSV</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" onclick="exportToPDF('<%=p.jspTitle%>List')">PDF</button></li>
			</ul>
		</div>
	  </div>
	</div>

	<div id="alerts">
		<%
			if (p.isDebug && (p.tableData == null || p.tableData.length == 0)) {
		%>
		<div id="alertw" class="alert alert-warning">
			<strong>tableData</strong> is empty!
			<br/>
			<strong>SQL:</strong>
			<%=qsql%>
		</div>
		<%
			}
		%>
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
	var jsObjData, dataList, selectLists, fieldNames, selectNames, labelNames, inputTypes, readOnlyFM, invisibleFM, requiredFM, 
		isModal, isWithRefs, selInpIds, listN4Page, listN4Modal, dateF, timeF, pageNo, totRow, lineCount, mCols, fileField, isLocale;
	
	document.addEventListener("DOMContentLoaded", function(event) { 
		
	<%if (jsObjData != null && jsObjData.length() > 0) {%>		
		jsObjData = <%=jsObjData%>;
		dataList = jsObjData.data;
	<%}%>		
	<%if (selectLists != null && selectLists.length() > 0) {%>		
		selectLists = <%=selectLists%>;
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
		
		selInpIds = {searchR:[{id:"s_4", name:"rec_user"}]};
		
		listN4Page = [{id:"codes", name:"rec_user"}];

		dateF = "<%=p.dateFormatter.getStringDF()%>" ;
		timeF = "<%=p.dateFormatter.getStringTF()%>" ;
		pageNo=1; lastProp = "<%=p.fieldNames[0]%>";
			 
	<%if (p.tableData != null && p.tableData.length > 0) {%>
		totRow=<%=p.tableData.length%>; 
	<%} else {%>
		totRow=0;
	<%}%>		
		lineCount=<%=p.sessionBean.getLineCount()%>;
		mCols=4;
		
		setList(listN4Page, selectLists);

		setPage();
	});
  </script>

	<div class="modal fade" id="updM" role="dialog">
	  <div class="modal-dialog modal-custom">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Update <%=p.jspTitle%></h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form method="post" id="updateR" class="form" enctype="multipart/form-data">
			  <div class="form-group">
				<div class="modal-body">
				  <table class="table table-borderless">
					<tbody id="modalTb">
					  <!-- Modal form fields is here.-->
					</tbody>
				  </table>
				</div>
				<div class="modal-footer">
					<table class="table table-borderless">
						<tbody id="modBt">
							<tr>
							  <td colspan="2">
								<button type="submit" class="btn btn-outline-info btn-sm"
									onclick='sendUpdate("/<%=p.contextRoot%>/<%=servletName%>","updateR")'>Save</button>
									 &nbsp;
								<button type="button" class="btn btn-outline-danger btn-sm"
									onclick='sendDelete("/<%=p.contextRoot%>/<%=servletName%>","updateR")'>Delete</button>
									 &nbsp;
								<button type="reset" class="btn btn-outline-secondary btn-sm">Cancel</button>
									 &nbsp;
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
							  </td>
							</tr>
						</tbody>
					</table>
				</div>
			  </div>
			</form>
		</div>
	  </div>
	</div>
</body>
</html>
<% 	p.menuBean.closeAll();
%>