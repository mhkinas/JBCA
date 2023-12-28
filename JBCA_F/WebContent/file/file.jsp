<%--
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 --%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page
	import="com.jbca.file.FileParams,com.jbca.base.BaseProcesses, 
				 com.sdb.utility.JsonConverter, 
				 com.sdb.utility.ArrayToString, 
				 java.util.Arrays"%>
<%
	FileParams p = new FileParams();
	p.setLangEN();
	
	BaseProcesses process = new BaseProcesses(request, response, p);
	process.checkSes4JSP();

	boolean dbQuery = false;
	String jsObjData = null, servletName = "fileServlet", jspTitle = "Dosya", selectLists = null,
			errorString = null, qsql = null, menuString = null, leftSideStr = null, excelCols = null;

	try {
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

		if (dbQuery) {
			p.tableData = p.execTableWR.selectData(p.dataType);
		}

		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.execTableWR);

		jsObjData = p.jsonConverter.convert2JSobj();

		excelCols = p.jsonConverter.conv2ExcelCols(p.labelNames, p.colWidths);
		
		p.selLists = p.manageSelList.getLists();

		if (p.selLists != null && p.selLists[0] != null)

			selectLists = p.jsonConverter.convert2Lists(p.refFieldMatchs, p.selLists);
		else
			errorString = p.manageSelList.getErrorString();

		if (p.sessionBean.getGroup().equals("Admin")) {
			menuString = p.menuBean.getMenu(null, false, new String[]{"Admin-Menu","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[]{"Admin-Sidebar","/JBCA_F/page/"});
		} 
		else if (p.sessionBean.getGroup().equals("Supervisor")) {
			menuString = p.menuBean.getMenu(null, false, new String[]{"Supervisor-Menu","/JBCA_F/menu/","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[]{"Supervisor-Sidebar","/JBCA_F/page/"});
		} 
		else if (p.sessionBean.getGroup().equals("Normal")) {
			menuString = p.menuBean.getMenu(null, false, new String[]{"Normal-User-Menu","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[]{"Normal-Sidebar","/JBCA_F/page/"});
		}

		if (menuString == null)
			errorString = p.menuBean.getErrorString();

		if (leftSideStr == null)
			errorString = p.pageBean.getErrorString();
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title><%=p.jspTitle%></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/JBCA_F/css/bootstrap.min.css" rel="stylesheet">
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
				<a href="#newR" class="btn btn-outline-dark" data-bs-toggle="collapse">New
					<%=p.jspTitle%></a>
				<form method="post" id="newR" class="form collapse" enctype="multipart/form-data">
					<div class="form-group">
						<div class="row"> 
							<div class="col-md-auto col-4">
								<label for="y_1"><%=p.labelNames[1]%>:</label>
								<input type="<%=p.inputTypes[1]%>" class="form-control form-control-sm" name="<%=p.fieldNames[1]%>" id="y_1"
									placeholder="Enter <%=p.labelNames[1]%>." required>
							</div>
							<div class="col-md-auto col-4">
								<label for="y_2"><%=p.labelNames[2]%>:</label>
								<input type="<%=p.inputTypes[2]%>" class="form-control form-control-sm" name="<%=p.fieldNames[2]%>" id="y_2"
									placeholder="Enter <%=p.labelNames[2]%>." list="paths" required>
								<datalist id="paths"></datalist>
							</div>
							<div class="col-md-auto col-4">
								<label for="y_3"><%=p.labelNames[3]%>:</label>
								<input type="<%=p.inputTypes[3]%>" class="form-control form-control-sm" name="<%=p.fieldNames[3]%>" id="y_3"
									placeholder="Enter <%=p.labelNames[3]%>." list="types" required>
								<datalist id="types"></datalist>
							</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col-md-auto col-4">
								<label for="y_4"><%=p.labelNames[4]%>:</label>
								<input type="<%=p.inputTypes[4]%>" class="form-control form-control-sm" name="<%=p.fieldNames[4]%>" id="y_4"
									placeholder="Enter <%=p.labelNames[4]%>." required>
							</div>
							<div class="col-md-auto col-4">
								<label for="y_6"><%=p.labelNames[5]%>:</label>
								<input type="<%=p.inputTypes[5]%>" class="form-control form-control-sm" name="<%=p.fieldNames[5]%>" id="y_6"
									placeholder="Enter <%=p.labelNames[5]%>." >
							</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col-md-auto col-4">
								<label for="y_5">File :</label>
								<input type="file" class="form-control-file border form-control-sm" name="<%=p.fileField%>" id="y_5" required
									onchange="fileInfo('y_5', 'y_1', 'y_4', 'y_6')">
							</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col-md-auto col-2">
								<button type="submit" class="btn btn-outline-info btn-sm"
										onclick='sendInsert("/<%=p.contextRoot%>/<%=servletName%>", "newR")'>Save</button>
							</div>
							<div class="col-md-auto col-2">
								<button type="reset" class="btn btn-outline-secondary btn-sm">Cancel</button>
							</div>
							<div class="col-md-2">&nbsp;</div><div class="col-md-2">&nbsp;</div>
							<div class="col-md-2">&nbsp;</div><div class="col-md-2">&nbsp;</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<a href="#searchR" class="btn btn-outline-dark" data-bs-toggle="collapse"><%=p.jspTitle%>
					Ara</a>
				<form method="post" id="searchR" class="form collapse" enctype="multipart/form-data">
					<div class="form-group">
						<div class="row"> 
							<div class="col-md-auto col-3">
								<label for="s_1" class="col-form-label-sm" class="col-form-label-sm"><%=p.selectLabels[0]%>:</label>
								<input type="<%=p.selectITs[0]%>" class="form-control form-control-sm" id="s_1" name="<%=p.selectFields[0]%>"
									placeholder="Enter <%=p.selectLabels[0]%>.">
							</div>
							<div class="col-md-auto col-3">
								<label for="s_2" class="col-form-label-sm"><%=p.selectLabels[1]%>:</label>
								<input type="<%=p.selectITs[1]%>" class="form-control form-control-sm" id="s_2" name="<%=p.selectFields[1]%>"
									placeholder="Enter <%=p.selectLabels[1]%>.">
							</div>
							<div class="col-md-auto col-3">
								<label for="s_3" class="col-form-label-sm"><%=p.selectLabels[2]%>:</label>
								<input type="<%=p.selectITs[2]%>" class="form-control form-control-sm" id="s_3" name="<%=p.selectFields[2]%>"
									placeholder="Enter <%=p.selectLabels[2]%>." list="paths">
							</div>
							<div class="col-md-auto col-3">
								<label for="s_4" class="col-form-label-sm"><%=p.selectLabels[3]%>:</label>
								<input type="<%=p.selectITs[3]%>" class="form-control form-control-sm" id="s_4" name="<%=p.selectFields[3]%>"
									placeholder="Enter <%=p.selectLabels[3]%>." list="types">
							</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col-md-auto col-3">
											<label for="s_5" class="col-form-label-sm"><%=p.selectLabels[4]%>:</label>
								<input type="<%=p.selectITs[4]%>" class="form-control form-control-sm" id="s_5" name="<%=p.selectFields[4]%>"
									placeholder="Enter <%=p.selectLabels[4]%>." list="codes">
								<datalist id="codes"></datalist>
							</div>
							<div class="col-md-auto col-3">
								<label for="s_6" class="col-form-label-sm"><%=p.selectLabels[5]%>:</label>
								<input type="<%=p.selectITs[5]%>" class="form-control form-control-sm" id="s_6" name="<%=p.selectFields[5]%>"
									placeholder="Enter <%=p.selectLabels[5]%>.">
							</div>
							<div class="col-md-auto col-3">
								<label for="s_7" class="col-form-label-sm"><%=p.selectLabels[6]%>:</label>
								<input type="<%=p.selectITs[6]%>" class="form-control form-control-sm" id="s_7" name="<%=p.selectFields[6]%>"
									placeholder="Enter <%=p.selectLabels[6]%>.">
							</div>
						</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col-md-auto col-2">
								<button type="button" class="btn btn-outline-info btn-sm"
										onclick='sendSelect("/<%=p.contextRoot%>/<%=servletName%>","searchR")'>Search</button>
							</div>
							<div class="col-md-auto col-2">
								<button type="reset" class="btn btn-outline-secondary btn-sm">Cancel</button>
							</div>
							<div class="col-md-2">&nbsp;</div><div class="col-md-2">&nbsp;</div>
							<div class="col-md-2">&nbsp;</div><div class="col-md-2">&nbsp;</div>
						</div>	
					</div>
				</form>
			</div>
		</div>

		<div class="row" id="ldTable">
			<div class="col-md-12">
				<h2 class="sub-header"><%=p.jspTitle%>
					List
				</h2>
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered table-condensed table-sm">
						<thead>
							<!-- style="display: table-header-group; page-break-after: avoid;"> -->
							<tr>
								<th>Order</th>
								<th onclick="sortById()"><%=p.labelNames[0]%></th>
								<th onclick="sortByProp('<%=p.fieldNames[1]%>')"><%=p.labelNames[1]%></th>
								<th onclick="sortByProp('<%=p.fieldNames[2]%>')"><%=p.labelNames[2]%></th>
								<th onclick="sortByProp('<%=p.fieldNames[3]%>')"><%=p.labelNames[3]%></th>
								<th onclick="sortByProp('<%=p.fieldNames[4]%>')"><%=p.labelNames[4]%></th>
								<th onclick="sortByProp('<%=p.fieldNames[5]%>')"><%=p.labelNames[5]%></th>
								<th onclick="sortByProp('<%=p.fieldNames[6]%>')"><%=p.labelNames[6]%></th>
								<th onclick="sortByDate('<%=p.fieldNames[7]%>', true)"><%=p.labelNames[7]%></th>
							</tr>
						</thead>
						<tbody id="listTb">
						</tbody>
					</table>
				</div>

				<div id="pgnId">
					<ul class="pagination">
						<li><input id="p_size" type="text"
							class="form-control form-control-sm"
							value=<%=p.sessionBean.getLineCount()%> size=3
							onchange="setPage()"> <br /></li>
						<li>
							<button type="button" class="btn btn-outline-info btn-sm" id="pageO" onclick="getPage('O')" aria-label="Önceki">
								<span aria-hidden="true">&laquo;</span>
							</button>
						</li>
						<li><button type="button" class="btn btn-outline-info btn-sm" id="page1" onclick="paging(1)" value="1">1</button></li>
						<li><button type="button" class="btn btn-outline-info btn-sm" id="page2" onclick="paging(2)" value="2">2</button></li>
						<li><button type="button" class="btn btn-outline-info btn-sm" id="page3" onclick="paging(3)" value="3">3</button></li>
						<li><button type="button" class="btn btn-outline-info btn-sm" id="page4" onclick="paging(4)" value="4">4</button></li>
						<li><button type="button" class="btn btn-outline-info btn-sm" id="page5" onclick="paging(5)" value="5">5</button></li>
						<li>
							<button type="button" class="btn btn-outline-info btn-sm" id="pageS" onclick="getPage('S')" aria-label="Sonraki">
								<span aria-hidden="true">&raquo;</span>
							</button> <br />
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
				<strong>tableData</strong> is empty! <br /> <strong>SQL:</strong>
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
		isModal, isWithRefs, selInpIds, listN4Page, listN4Modal, dateF, timeF, pageNo, totRow, lineCount, mCols, fileField, isLocale, 
		excelCols, lastProp, updButId;
	
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
		readOnlyFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.readOnlyFM).boxed().toArray(Integer[]::new))%>;
		invisibleFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.invisibleFM).boxed().toArray(Integer[]::new))%>;
		requiredFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.requiredFM).boxed().toArray(Integer[]::new))%>;
		fileField = "<%=p.fileField%>";
		isModal = <%=p.isModal%>;
		isWithRefs = <%=p.isWithRefs%>;
		isLocale = <%=p.isLocale%>;
		
		excelCols = <%=excelCols%>;
		
		selInpIds = {newR:[{id:"y_2", name:"adr_path"},{id:"y_3", name:"file_type"}], searchR:[{id:"s_3", name:"adr_path"}, 
						{id:"s_4", name:"file_type"}, {id:"s_5", name:"rec_user"}], updateR:[{id:"g_3", name:"adr_path"}, 
						{id:"g_4", name:"file_type"}]};
		
		listN4Page = [{id:"paths", name:"adr_path"}, {id:"types", name:"file_type"}, {id:"codes", name:"rec_user"}];
		listN4Modal = [{id:"paths", name:"adr_path"}, {id:"types", name:"file_type"}];

		dateF = "<%=p.dateFormatter.getStringDF()%>" ;
		timeF = "<%=p.dateFormatter.getStringTF()%>";
							pageNo=1; lastProp = "<%=p.fieldNames[0]%>";
	<%if (p.tableData != null && p.tableData.length > 0) {%>
		totRow =
	<%=p.tableData.length%>
		;
	<%} else {%>
		totRow = 0;
	<%}%>
		lineCount = <%=p.sessionBean.getLineCount()%>;
		mCols = 3;

		setList(listN4Page, selectLists);

		setPage();
	});
	</script>

	<div class="modal fade" id="updM" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						Update
						<%=p.jspTitle%></h4>
					<button type="button" class="close" data-bs-dismiss="modal">&times;</button>
				</div>
				<form method="post" id="updateR" class="form" enctype="multipart/form-data">
					<div class="form-group">
						<div class="modal-body">
							<div id="modalBody">
									<!-- Modal form fields is here.-->
							</div>
						</div>
						<div class="modal-footer">
							<table class="table table-borderless">
								<tbody id="modBt">
									<tr>
										<td><label for="g_9">File :</label></td>
										<td><input type="file"
											class="form-control-file border form-control-sm"
											name="<%=p.fileField%>" id="g_9"
											onchange="fileInfo('g_9', 'g_2', 'g_5', 'g_6')"></td>
									</tr>
									<tr>
										<td colspan="2">
											<button type="submit" class="btn btn-outline-info btn-sm"
												onclick='sendUpdate("/<%=p.contextRoot%>/<%=servletName%>","updateR")'>Save</button>
											&nbsp;
											<button type="button" class="btn btn-outline-info btn-sm"
												onclick='sendDownload("/<%=p.contextRoot%>/<%=servletName%>","updateR","g_2",false)'>File
												Download</button> &nbsp;
											<button type="button" class="btn btn-outline-danger btn-sm"
												onclick='sendDelete("/<%=p.contextRoot%>/<%=servletName%>","updateR")'>Delete</button>
											&nbsp;
											<button type="reset" class="btn btn-outline-secondary btn-sm">Cancel</button>
											&nbsp;
											<button type="button" class="btn btn-secondary btn-sm"
												data-bs-dismiss="modal">Close</button>
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
<%
	p.menuBean.closeAll();
%>