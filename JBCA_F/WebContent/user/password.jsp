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
	p.setLangEN();
	
	BaseProcesses process = new BaseProcesses(request, response, p);
	process.checkSes4JSP();

	String jsObjData = null, servletName = "passwordChangeServlet", jspTitle = "Change Password",
	errorString = null, qsql = null, menuString = null, leftSideStr = null;
	boolean dbQuery = false;

	try {
		p.initParams();

		p.sessionBean.setGroup(process.httpSession.getAttribute("ses_group").toString());

		process.checkAuth4JSP(p);
		
		if(p.sessionBean.getGroup().equals("Admin"))
		{
			menuString = p.menuBean.getMenu(null, false, new String[] {"Admin-Menu","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[] {"Admin-Sidebar","/JBCA_F/page/"});
		}
		else if(p.sessionBean.getGroup().equals("Supervisor"))
		{
			menuString = p.menuBean.getMenu(null, false, new String[] {"Supervisor-Menu","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[] {"Supervisor-Sidebar","/JBCA_F/page/"});
		}
		else if(p.sessionBean.getGroup().equals("Normal"))
		{
			menuString = p.menuBean.getMenu(null, false, new String[] {"Normal-User-Menu","/JBCA_F/menu/"});
			leftSideStr = p.pageBean.getPage(null, false, new String[] {"Normal-Sidebar","/JBCA_F/page/"});
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
				<h2 class="sub-header"><%=p.jspTitle%></h2>
				<form method="post" id="updateR" class="form" enctype="multipart/form-data">
					<div class="form-group">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<td><label for="g_1" style="margin-top: 7px;"><%=p.labelNames[1]%>:</label></td>
									<td><input type="<%=p.inputTypes[1]%>"
										class="form-control form-control-sm"
										name="<%=p.fieldNames[1]%>" id="g_1"
										placeholder="Enter <%=p.labelNames[1]%>" required></td>
									<td><label for="g_2" style="margin-top: 7px;"><%=p.labelNames[2]%>:</label></td>
									<td><input type="<%=p.inputTypes[2]%>"
										class="form-control form-control-sm"
										name="<%=p.fieldNames[2]%>" id="g_2"
										placeholder="Enter <%=p.labelNames[2]%>" required></td>
									<td><label for="g_3" style="margin-top: 7px;"><%=p.labelNames[3]%>:</label></td>
									<td><input type="<%=p.inputTypes[3]%>"
										class="form-control form-control-sm"
										name="<%=p.fieldNames[3]%>" id="g_3"
										placeholder="Enter <%=p.labelNames[3]%>" required></td>
									<td>&nbsp;&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;&nbsp;</td>
								</tr>
								<tr></tr>
								<tr>
									<td><button type="submit"
											class="btn btn-outline-info btn-sm"
											onclick='sendUpdate("/<%=p.contextRoot%>/<%=servletName%>", "updateR")'>Save</button></td>
									<td><button type="reset"
											class="btn btn-outline-secondary btn-sm">Cancel</button></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
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
		var jsObjData, dataList, selectLists, fieldNames, selectNames, labelNames, inputTypes, readOnlyFM, invisibleFM, requiredFM, isModal, isWithRefs, selInpIds, listN4Page, listN4Modal, dateF, timeF, pageNo, totRow, lineCount, mCols, isLocale;

		document.addEventListener("DOMContentLoaded",function(event) {
			
	<%if (jsObjData != null && jsObjData.length() > 0) {%>
		jsObjData =<%=jsObjData%>;
		dataList = jsObjData.data;
	<%}%>
		fieldNames =<%=ArrayToString.getStringWithComma((String[]) p.fieldNames)%>;
		selectNames =<%=ArrayToString.getStringWithComma((String[]) p.selectFields)%>;
		labelNames =<%=ArrayToString.getStringWithComma((String[]) p.labelNames)%>;
		inputTypes =<%=ArrayToString.getStringWithComma((String[]) p.inputTypes)%>;
		readOnlyFM =<%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.readOnlyFM).boxed().toArray(Integer[]::new))%>;
		invisibleFM =<%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.invisibleFM).boxed().toArray(Integer[]::new))%>;
		requiredFM =<%=ArrayToString.getStringWithComma((Integer[]) Arrays.stream(p.requiredFM).boxed().toArray(Integer[]::new))%>;
		isModal =<%=p.isModal%>;
		isWithRefs =<%=p.isWithRefs%>;
		isLocale =<%=p.isLocale%>;

	});
	</script>

</body>
</html>
<%
	p.menuBean.closeAll();
%>
