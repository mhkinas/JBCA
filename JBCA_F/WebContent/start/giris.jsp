<%--
   jbca - v1.0 - 2018-11-28
   https://www.hayatikinas.com
   This code is part of the JBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 --%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="tr"  data-bs-theme="dark">
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
		  <form method="post" id="giris" class="form-signin">
            <h2 class="form-signin-heading">JBCA'ya Hoşgeldiniz!</h2>
			<br/>
			<label for="login_name" class="sr-only"><b>Kullanıcı</b></label>
			<input type="text" name="login_name" class="form-control" placeholder="Kullanıcı giriniz..." required autofocus>

			<br/>
			<label for="login_password" class="sr-only">Şifre</label>
			<input type="password" name="login_password" class="form-control" placeholder="Şifre giriniz..." required>
			<br/>
			<button formaction="/JBCA_F/openSession" class="btn btn-lg btn-primary btn-block" type="submit">Gönder</button>
			<br/>
			<button type="button" class="btn btn-dark" id="temeModeSwitch">Dark/Light</button>
			<input type="hidden" name="lang" value="tr">
		  </form>
		</div>

		<br/><br/><br/><br/><br/><br/><br/>
		<footer class="container-fluid text-center">
  			<p>&copy; Mehmet Hayati KINAŞ</p>
		</footer>
		
	</body>
</html>
