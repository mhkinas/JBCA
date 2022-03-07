<%--
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 --%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="com.jbca.admin.AdminParams,com.jbca.base.BaseProcesses, 
				 com.sdb.utility.JsonConverter, 
				 com.sdb.utility.ArrayToString, 
				 java.util.Arrays"%>

<%
	AdminParams p = new AdminParams();
	p.setLangLoc();

	BaseProcesses process = new BaseProcesses(request, response, p);
	process.checkSes4JSP();

	boolean dbQuery = false;
	String jsObjData = null, servletName = "adminServlet", selectLists = null, errorString = null, qsql = null, excelCols = null;

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
				
			p.setPasX(3);
		}
	
		p.jsonConverter = new JsonConverter(p.fieldNames, (String[][]) p.tableData, p.execTableWR);
		
		jsObjData = p.jsonConverter.convert2JSobj();
		
		excelCols = p.jsonConverter.conv2ExcelCols(p.labelNames, p.colWidths);
		
		p.selLists = p.manageSelList.getLists();
		
		if(p.selLists != null && p.selLists[0] != null)
		
			selectLists = p.jsonConverter.convert2Lists(p.refFieldMatchs, p.selLists);
		else
			errorString = p.manageSelList.getErrorString();
	
    } 
	catch(Exception ex) {
    	ex.printStackTrace();
    }
  	finally {
  	}
%>

<!DOCTYPE html>
<html lang="tr">
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
</head>

<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="/JBCA_F/admin/yonetim.jsp">JBCA</a>
		<ul class="navbar-nav">
	      <li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/JBCA_F/#">Sayfalar</a>
			  <div class="dropdown-menu">
          		<a class="dropdown-item" href="/JBCA_F/page/sayfa.jsp">Sayfa</a>
          		<a class="dropdown-item" href="/JBCA_F/page/tema.jsp">Tema</a>
          		<a class="dropdown-item" href="/JBCA_F/page/sayfa-link.jsp">Sayfa Link</a>
          		<a class="dropdown-item" href="/JBCA_F/page/sayfa-map.jsp">Sayfa Map</a>
          	  </div>
		  </li>
		  <li class='nav-item dropdown'>
			<a class='nav-link dropdown-toggle' data-toggle='dropdown' href='/JBCA_F/#'>Kodlar</a>
			  <div class='dropdown-menu'>
          		<a class='dropdown-item' href='/JBCA_F/code/kod.jsp'>Kod</a>
          		<a class='dropdown-item' href='/JBCA_F/code/kod-map.jsp'>Kod Map</a>
          	  </div>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="/JBCA_F/menu/menu-tr.jsp">Menüler</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="/JBCA_F/file/dosya.jsp">Dosyalar</a>
		  </li>
		  <li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/JBCA_F/#">Referanslar</a>
			  <div class="dropdown-menu">
				<a class="dropdown-item" href="/JBCA_F/reference/kod-tip.jsp">Kod Tipi</a>
				<a class="dropdown-item" href="/JBCA_F/reference/dosya-tip.jsp">Dosya Tipi</a>
				<a class="dropdown-item" href="/JBCA_F/reference/mesaj-tip.jsp">Mesaj Tipi</a>
				<a class="dropdown-item" href="/JBCA_F/reference/pozisyon.jsp">Pozisyon</a>
				<a class="dropdown-item" href="/JBCA_F/reference/sayfa-tip.jsp">Sayfa Tipi</a>
				<a class="dropdown-item" href="/JBCA_F/reference/yol.jsp">Yol</a>
			  </div>
		  </li>
		  <li class='nav-item dropdown'>
			<a class='nav-link dropdown-toggle' data-toggle='dropdown' href='/JBCA_F/#'>Bilgi</a>
			  <div class='dropdown-menu'>
          		<a class='dropdown-item' href='/JBCA_F/info/iletisim.jsp'>İletişim</a>
          	  </div>
		  </li>
		  <li class='nav-item dropdown'>
		  	<a class='nav-link dropdown-toggle' data-toggle='dropdown' href='/JBCA_F/#'>Log Kaydı</a>
		  	  <div class='dropdown-menu'>
		  	  	<a class='dropdown-item' href='/JBCA_F/log/log-formu.jsp'>Log Formu</a>
		  	  	<a class='dropdown-item' href='/JBCA_F/log/log-tablo.jsp'>Log Tablo</a>
		  	  	<a class='dropdown-item' href='/JBCA_F/log/log-tip.jsp'>Log Tipi</a>
		  	  	<a class='dropdown-item' href='/JBCA_F/log/log-tr.jsp'>Log İzle</a>
		  	  </div>
		  </li>
		  <li class='nav-item dropdown'>
		  	<a class='nav-link dropdown-toggle' data-toggle='dropdown' href='/JBCA_F/#'>Sohbet Kaydı</a>
		  	  <div class='dropdown-menu'>
		  	  	<a class='dropdown-item' href='/JBCA_F/chat/chat-listesi.jsp'>Sohbet İzle</a>
		  	  	<a class='dropdown-item' href='/JBCA_F/chat/chatW.jsp'>Sohbet Yap</a>
		  	  </div>
		  </li>
	      <li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/JBCA_F/#">Kullanıcı</a>
			  <div class="dropdown-menu">
          		<a class="dropdown-item" href="/JBCA_F/admin/yonetim.jsp">Yönetim</a>
          		<a class="dropdown-item" href="/JBCA_F/admin/grup.jsp">Grup</a>
          		<a class="dropdown-item" href="/JBCA_F/user/mesaj.jsp">Mesaj Kaydet</a>
          		<a class="dropdown-item" href="/JBCA_F/user/mesaj-map.jsp">Mesaj Dağıt</a>
          		<a class="dropdown-item" href="/JBCA_F/user/mesaj-bak.jsp">Mesaj Bak</a>
          		<a class="dropdown-item" href="/JBCA_F/user/sifre.jsp">Şifre</a>
          		<a class="dropdown-item" href="/JBCA_F/start/giris.jsp">Çıkış</a>
			  </div>
		  </li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li><a href="/JBCA_F/admin/admin.jsp" style="color:#ffffff">EN</a></li>
			<li><span style="color:#ffffff">/</span></li>
			<li><a href="/JBCA_F/admin/yonetim.jsp" style="color:#ffffff">TR</a></li>
	    </ul>
	</nav>

	<div class="container-fluid">
	  <div class="row">

	  <nav class="navbar bg-light col-md-1  col-xl-2">
		 <ul class="navbar-nav flex-column">
			<li class="nav-item">
			  <a class="nav-link" href="/JBCA_F/admin/yonetim.jsp">Yönetim</a></li>
			<li class="nav-item">
			  <a class="nav-link" href="/JBCA_F/admin/grup.jsp">Grup</a></li>
			<li class="nav-item">
			  <a class="nav-link" href="/JBCA_F/user/mesaj.jsp">Mesaj</a></li>
			<li class="nav-item">
			  <a class="nav-link" href="/JBCA_F/user/mesaj-map.jsp">Mesaj Map</a></li>
			<li class="nav-item">
			  <a class="nav-link" href="/JBCA_F/user/mesaj-bak.jsp">Mesaj Bak</a></li>
			<li class="nav-item">
			  <a class="nav-link" href="/JBCA_F/user/sifre.jsp">Şifre</a></li>
			<li class="nav-item">
			  <a class="nav-link" href="/JBCA_F/start/giris.jsp">Giriş</a></li>
		 </ul>
	  </nav>

      <div class="col-md-11 col-xl-10">
		<a href="#yeniK" class="btn btn-outline-dark" data-toggle="collapse">Yeni <%=p.jspTitle%></a>
		<form method="post" id="yeniK" class="form collapse" enctype="multipart/form-data">
			<div class="form-group">
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td><label for="y_1"><%=p.labelNames[1]%>:</label></td>
							<td><input type="<%=p.inputTypes[1]%>" class="form-control form-control-sm" name="<%=p.fieldNames[1]%>" id="y_1"
								placeholder="<%=p.labelNames[1]%> giriniz." required></td>
							<td>&nbsp;</td>
							<td><label for="y_2"><%=p.labelNames[2]%>:</label></td>
							<td><input type="<%=p.inputTypes[2]%>" class="form-control form-control-sm" name="<%=p.fieldNames[2]%>" id="y_2"
								placeholder="<%=p.labelNames[2]%> giriniz." required></td>
							<td>&nbsp;</td>
							<td><label for="y_3"><%=p.labelNames[3]%>:</label></td>
							<td><input type="<%=p.inputTypes[3]%>" class="form-control form-control-sm" name="<%=p.fieldNames[3]%>" id="y_3"
								placeholder="<%=p.labelNames[3]%> giriniz." required></td>
						</tr>
						<tr>
							<td><label for="y_4"><%=p.labelNames[4]%>:</label></td>
							<td><input type="<%=p.inputTypes[4]%>" class="form-control form-control-sm" name="<%=p.fieldNames[4]%>" id="y_4"
								placeholder="<%=p.labelNames[4]%> giriniz." list="groups" required></td>
								<datalist id="groups"></datalist>
							<td>&nbsp;</td>
							<td><label for="y_5"><%=p.labelNames[5]%>:</label></td>
							<td><input type="<%=p.inputTypes[5]%>" class="form-control form-control-sm" name="<%=p.fieldNames[5]%>" id="y_5"
								placeholder="<%=p.labelNames[5]%> giriniz." required></td>
							<td>&nbsp;</td>
							<td><label for="y_6"><%=p.labelNames[6]%>:</label></td>
							<td><input type="<%=p.inputTypes[6]%>" class="form-control form-control-sm" name="<%=p.fieldNames[6]%>" id="y_6"
								placeholder="<%=p.labelNames[6]%> giriniz." list="statuses"></td>
								<datalist id="statuses"></datalist>
						</tr>
						<tr>
							<td><label for="y_7"><%=p.labelNames[7]%>:</label></td>
							<td><input type="<%=p.inputTypes[7]%>" class="form-control form-control-sm" name="<%=p.fieldNames[7]%>" id="y_7"
								placeholder="<%=p.labelNames[7]%> giriniz." min="10" max="100"></td>
							<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
							<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
						</tr>
						<tr>
							<td><button type="submit" class="btn btn-outline-info btn-sm"
									onclick='sendInsert("/<%=p.contextRoot%>/<%=servletName%>", "yeniK")'>Kaydet</button></td>
							<td><button type="reset" class="btn btn-outline-secondary btn-sm">İptal</button></td>
							<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
							<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	  </div>
	</div>

	<div class="row"> 
      <div class="col-md-12">
		<a href="#araK" class="btn btn-outline-dark" data-toggle="collapse"><%=p.jspTitle%> Ara</a>
		<form method="post" id="araK" class="form collapse" enctype="multipart/form-data">
			<div class="form-group">
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td><label for="s_1" class="col-form-label-sm"><%=p.selectLabels[0]%>:</label></td>
							<td><input type="<%=p.selectITs[0]%>" class="form-control form-control-sm" id="s_1" name="<%=p.selectFields[0]%>" 
									   placeholder="<%=p.selectLabels[0]%> giriniz."></td>
							<td><label for="s_2" class="col-form-label-sm"><%=p.selectLabels[1]%>:</label></td>
							<td><input type="<%=p.selectITs[1]%>" class="form-control form-control-sm" id="s_2" name="<%=p.selectFields[1]%>"
									   placeholder="<%=p.selectLabels[1]%> giriniz."></td>
							<td><label for="s_3" class="col-form-label-sm"><%=p.selectLabels[2]%>:</label></td>
							<td><input type="<%=p.selectITs[2]%>" class="form-control form-control-sm" id="s_3" name="<%=p.selectFields[2]%>" 
									   placeholder="<%=p.selectLabels[2]%> giriniz." list="groups"></td>
							<td><label for="s_4" class="col-form-label-sm"><%=p.selectLabels[3]%>:</label></td>
							<td><input type="<%=p.selectITs[3]%>" class="form-control form-control-sm" id="s_4" name="<%=p.selectFields[3]%>"
									   placeholder="<%=p.selectLabels[3]%> giriniz."></td>
						</tr>
						<tr>
							<td><label for="s_5" class="col-form-label-sm"><%=p.selectLabels[4]%>:</label></td>
							<td><input type="<%=p.selectITs[4]%>" class="form-control form-control-sm" id="s_5" name="<%=p.selectFields[4]%>" 
									   placeholder="<%=p.selectLabels[4]%> giriniz." list="codes"></td>
									   <datalist id="codes"></datalist>
							<td><label for="s_6" class="col-form-label-sm"><%=p.selectLabels[5]%>:</label></td>
							<td><input type="<%=p.selectITs[5]%>" class="form-control form-control-sm" id="s_6" name="<%=p.selectFields[5]%>"
									   placeholder="<%=p.selectLabels[5]%> giriniz."></td>
							<td><label for="s_7" class="col-form-label-sm"><%=p.selectLabels[6]%>:</label></td>
							<td><input type="<%=p.selectITs[6]%>" class="form-control form-control-sm" id="s_7" name="<%=p.selectFields[6]%>" 
									   placeholder="<%=p.selectLabels[6]%> giriniz."></td>
							<td>&nbsp;</td><td>&nbsp;</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-outline-info btn-sm"
									onclick='sendSelect("/<%=p.contextRoot%>/<%=servletName%>","araK")'>Ara</button></td>
							<td><button type="reset" class="btn btn-outline-secondary btn-sm">İptal</button></td>
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
		<h2 class="sub-header"><%=p.jspTitle%> Listesi</h2>
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-sm">
				<thead>
					<!-- style="display: table-header-group; page-break-after: avoid;"> -->
					<tr>
						<th>Sıra</th>
						<th onclick="sortById()"><%=p.labelNames[0]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[1]%>')"><%=p.labelNames[1]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[2]%>')"><%=p.labelNames[2]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[3]%>')" style="display:none;"><%=p.labelNames[3]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[4]%>')"><%=p.labelNames[4]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[5]%>')"><%=p.labelNames[5]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[6]%>')"><%=p.labelNames[6]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[7]%>')"><%=p.labelNames[7]%></th>
						<th onclick="sortByProp('<%=p.fieldNames[8]%>')"><%=p.labelNames[8]%></th>
						<th onclick="sortByDate('<%=p.fieldNames[9]%>', true)"><%=p.labelNames[9]%></th>
					</tr>
				</thead>
				<tbody id="listTb">
				</tbody>
			</table>
		</div>

		<div id="pgnId">
			<ul class="pagination">
				<li>
					<input id="p_size" type="text" class="form-control form-control-sm" value=<%=p.sessionBean.getLineCount()%> size=3 onchange="setPage()"> 
					<br/>
				</li>
				<li>
					<button type="button" class="btn btn-outline-info btn-sm" id="pageO" onclick="getPage('O')" aria-label="Önceki"><span aria-hidden="true">&laquo;</span></button>
				</li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page1" onclick="paging(1)" value="1">1</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page2" onclick="paging(2)" value="2">2</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page3" onclick="paging(3)" value="3">3</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page4" onclick="paging(4)" value="4">4</button></li>
				<li><button type="button" class="btn btn-outline-info btn-sm" id="page5" onclick="paging(5)" value="5">5</button></li>
				<li>
					<button type="button" class="btn btn-outline-info btn-sm" id="pageS" onclick="getPage('S')" aria-label="Sonraki"><span aria-hidden="true">&raquo;</span></button>
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
		isModal, isWithRefs, selInpIds, listN4Page, listN4Modal, dateF, timeF, pageNo, totRow, lineCount, mCols, isLocale, excelCols, lastProp;
	
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
		readOnlyFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.readOnlyFM).boxed().toArray(Integer[]::new ))%>;
		invisibleFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.invisibleFM).boxed().toArray(Integer[]::new ))%>;
		requiredFM = <%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.requiredFM).boxed().toArray(Integer[]::new ))%>;
		isModal = <%=p.isModal%>;
		isWithRefs = <%=p.isWithRefs%>;
		isLocale = <%=p.isLocale%>;
		
		excelCols = <%=excelCols%>;
		
		selInpIds = {yeniK:[{id:"y_4", name:"user_group"},{id:"y_6", name:"rec_status"}], 
					 araK:[{id:"s_3", name:"user_group"}, {id:"s_5", name:"rec_user"}], 
					 guncelleK:[{id:"g_5", name:"user_group"},{id:"g_7", name:"rec_status"}]};
		
		listN4Page = [{id:"groups", name:"user_group"}, {id:"statuses", name:"rec_status"}, {id:"codes", name:"rec_user"}];
		listN4Modal = [{id:"groups", name:"user_group"}, {id:"statuses", name:"rec_status"}];

		dateF = "<%=p.dateFormatter.getStringDF()%>" ;
		timeF = "<%=p.dateFormatter.getStringTF()%>" ;
		pageNo=1; lastProp = "<%=p.fieldNames[0]%>";
			 
	<%if (p.tableData != null && p.tableData.length > 0) {%>
		totRow=<%=p.tableData.length%>; 
	<%} else {%>
		totRow=0;
	<%}%>		
		lineCount=<%=p.sessionBean.getLineCount()%>;
		mCols=2;
		
		setList(listN4Page, selectLists);

		setPage();
	});
  </script>

	<div class="modal fade" id="guncM" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"><%=p.jspTitle%> Güncelle</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form method="post" id="guncelleK" class="form" enctype="multipart/form-data">
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
									  <td>
										<button type="submit" class="btn btn-outline-info btn-sm"
											onclick='sendUpdate("/<%=p.contextRoot%>/<%=servletName%>","guncelleK")'>Kaydet</button>
											 &nbsp;
										<button type="button" class="btn btn-outline-danger btn-sm"
											onclick='sendDelete("/<%=p.contextRoot%>/<%=servletName%>","guncelleK")'>Sil</button>
											 &nbsp;
										<button type="reset" class="btn btn-outline-secondary btn-sm">İptal</button>
											 &nbsp;
										<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Kapat</button>
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
<%		p.runDB.closeAll();
%>