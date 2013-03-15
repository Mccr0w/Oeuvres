<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
    </head>
    <body>
        <h1 align='center'>Accès application Oeuvres</h1>
        <form action="Controleur" method="post" name="frmLogin">
        	<input type="hidden" name="action" value="connexion" id="type" />
            <p>
            Login : <input type="text" name="txtLogin">
            <br><br>
            Mot de passe : <input type="password" name="txtPwd">
            </p>
            <input type="submit" value="Envoi">
            <br>
            Log : user
            <br>
            MDP : user
            <br>
            <p>
        </form>

    </body>

</html>

