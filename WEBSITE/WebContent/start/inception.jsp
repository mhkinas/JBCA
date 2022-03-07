<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="com.website.bean.LinPageBean" %>
<%
	LinPageBean linPageBean = new LinPageBean();
	
	String centerPageStr = null, rightSiteStr = null, topPageStr = null, bottomPageStr = null, menuString = null, errorString = null;
	String headLink = null;
	
	try {
	
		centerPageStr = linPageBean.getLinPage("inception");
		
		rightSiteStr = linPageBean.getThemePage("right");
		
		topPageStr = linPageBean.getThemePage("top");
		
		bottomPageStr = linPageBean.getThemePage("buttom");
		
		menuString = linPageBean.getMenuStr();
		
		headLink = linPageBean.getHeadLink("ggl-analytics");
    } 
	catch(Exception ex) 
	{
    	ex.printStackTrace();

		if(!linPageBean.getErrorString().equals("null errorString"))  
			errorString = linPageBean.getErrorString();
    }
 %>
<!DOCTYPE html>
<html lang="en">
<head>
  <% if(headLink != null) out.print(headLink); %>
  <title>Inception</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="/website/css/bootstrap.min.css" rel="stylesheet" >
  <script src="/website/js/jquery.min.js"></script>
  <script src="/website/js/popper.min.js"></script>
  <script src="/website/js/bootstrap.min.js"></script>
</head>

<body>

	<%=topPageStr %>
	
	<%=menuString %>
	
	<br><br><br>
	<div class="container">
	  <div class="row">
		<div class="col-9">
	
			<%=centerPageStr %>
		</div>
	
		<%=rightSiteStr %>
	  </div>
	</div>
	<br><br><br><br><br>
	
	<%=bottomPageStr %>

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

</body>
</html>
<% 	linPageBean.closeAll();
%>
