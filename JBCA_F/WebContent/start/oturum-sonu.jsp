<%--
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 --%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="tr">
	<head>
	  <title>JBCA GİRİŞ</title>
	  <meta charset="utf-8"> 
	  	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="/JBCA_F/css/bootstrap.min.css">
	  <link rel="stylesheet" href="/JBCA_F/css/signin.css">
	   
	  <script src="/JBCA_F/js/bootstrap.min.js"></script>
	</head>
	<body>

		<div class="container">
		  <form method="post" class="form-signin">
            <h2 class="form-signin-heading">Kullanım oturumunuz sonlandı, tekrar giriş yapınız!</h2>
			<br/>
			<label for="login_name" class="sr-only"><b>Kullanıcı</b></label>
			<input type="text" name="login_name" class="form-control" placeholder="Kullanıcı ismini giriniz..." required autofocus>
			<br/>
			<label for="login_password" class="sr-only">Şifre</label>
			<input type="password" name="login_password" class="form-control" placeholder="Şifre giriniz..." required>
			<br/>
			<button formaction="/JBCA_F/openSession" class="btn btn-lg btn-primary btn-block" type="submit">Gönder</button>
			<input type="hidden" name="lang" value="tr">
		  </form>
		</div>
		<br/><br/><br/>
		<P ALIGN=CENTER><FONT SIZE=5>&copy; Mehmet Hayati KINAŞ</FONT></P>
	</body>
</html>
