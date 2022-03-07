<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="com.website.bean.LinPageBean, 
				 com.website.params.ContactParams"
%>
<%
	ContactParams p = new ContactParams();
	p.setLangEN();
	p.initParams();
	
	LinPageBean linPageBean = new LinPageBean(p.runDB);

	String centerPageStr = null, rightSiteStr = null, topPageStr = null, bottomPageStr = null, menuString = null, errorString = null; 
	String headLink = null, servletName = "contactServlet", codeStrMW90 = null, codeStrBW = null, pageName = "contact";
	
	try {
		centerPageStr = linPageBean.getLinPage("contact");
		
		topPageStr = linPageBean.getThemePage("top");
		
		bottomPageStr = linPageBean.getThemePage("buttom");
		
		menuString = linPageBean.getMenuStr();
		
		if(linPageBean.checkCodeMap(pageName, "back-warn")) codeStrBW = linPageBean.getHeadLink("back-warn");
		
		//if(linPageBean.checkCodeMap(pageName, "modal-width-90")) codeStrMW90 = linPageBean.getHeadLink("modal-width-90");
    } 
	catch(Exception ex) 
	{
    	ex.printStackTrace();

		if(!linPageBean.getErrorString().equals("null errorString"))  
			errorString = linPageBean.getErrorString();
    }
 %>
﻿<!DOCTYPE html>
<html lang="en">
<head>
  <title>Contact</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="/website/css/bootstrap.min.css" rel="stylesheet" >
  <script src="/website/js/jquery.min.js"></script>
  <script src="/website/js/popper.min.js"></script>
  <script src="/website/js/bootstrap.min.js"></script>
  <script src="/website/js/action.part.js"></script>
  <% if(codeStrBW != null) { %>
  <script><% out.write(codeStrBW); %></script>
  <% } %>
  <% if(codeStrMW90 != null) { %>
  <style type="text/css"><% out.write(codeStrMW90); %></style>
  <% } %>
</head>

<body>

<%  if(topPageStr != null) out.print(topPageStr); 

	if(menuString != null) out.print(menuString); %>

	<br><br><br>
	<div class="container">
	  <div class="row">
		<div class="col">
		<%=centerPageStr %>
		<form id="newR" class="form" enctype="multipart/form-data">
			<div class="form-group">
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td><label for="y_1"><%=p.labelNames[1]%></label></td>
							<td><input type="<%=p.inputTypes[1]%>" class="form-control form-control-sm" name="<%=p.fieldNames[1]%>" id="y_1"
								placeholder="Enter <%=p.labelNames[1]%>." required></td>
							<td>&nbsp;</td>
							<td><label for="y_2"><%=p.labelNames[2]%></label></td>
							<td><input type="<%=p.inputTypes[2]%>" class="form-control form-control-sm" name="<%=p.fieldNames[2]%>" id="y_2"
								placeholder="Enter <%=p.labelNames[2]%>." required></td>
							<td>&nbsp;</td>
							<td><label for="y_3"><%=p.labelNames[3]%></label></td>
							<td><input type="<%=p.inputTypes[3]%>" class="form-control form-control-sm" name="<%=p.fieldNames[3]%>" id="y_3"
								placeholder="Enter <%=p.labelNames[3]%>."></td>
						</tr>
						<tr>
							<td><label for="y_4"><%=p.labelNames[4]%></label></td>
							<td colspan="7"><textarea class="form-control form-control-sm" name="<%=p.fieldNames[4]%>" id="y_4"
								placeholder="Enter <%=p.labelNames[4]%>." required rows="10" cols="130"></textarea></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><button type="submit" class="btn btn-outline-info btn-sm"
									onclick='sendInsert("/<%=p.contextRoot%>/<%=servletName%>", "newR")'>Save</button></td>
							<td><button type="reset" class="btn btn-outline-secondary btn-sm">Cancel</button></td>
							<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		</div>
	  </div>
	</div>
	<br><br><br><br><br>

	<%	if(bottomPageStr != null) out.print(bottomPageStr); %>

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

	<script>
		var jsObjData, isLocale;
		
		document.addEventListener("DOMContentLoaded", function(event) { 
			
			isLocale = <%=p.isLocale%>;
		});
	</script>

	
</body>
</html>
<% 	linPageBean.closeAll();
%>
