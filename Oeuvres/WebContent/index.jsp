<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link href="css/screen.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link rel="stylesheet" media="print" type="text/css"
	href="css/print.css" />

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
    </head>
    <body>
	    <div id="layout">
	        <div id="header"><h2>Accès application Oeuvres</h2>
	        <form action="Controleur" method="post" name="frmLogin">
	        	<input type="hidden" name="action" value="connexion" id="type" />
	            <p><br>
	            Login : <input type="text" name="txtLogin">
	            <br>
	            Mot de passe : <input type="password" name="txtPwd">
	            </p>
	            <input type="submit" class="button" value="Envoi">
	            <br>
	            <br>
	            Login : user<br>
	            MdP : user
	            <br>
	            <p>
	        </form>
		</div>
    </body>

</html>

<%@ include file="Footer.jsp"%>