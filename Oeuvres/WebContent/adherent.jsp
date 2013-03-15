<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="metier.*" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajout d'un adhérent</title>
</head>
<body>
<div id="layout">
		<div id="header">
<form action="Controleur" method="post" >
		<input type="hidden" name="action" value="ajoutAdherent" />
            <p><br>
            Nom : <input type="text" name="nom">
            Prénom : <input type="text" name="prenom">
            <br><br>
            <input type="submit" class="button" value="Envoi">
            </p>
        </form>
</div></div>
</body>
</html>
<%@ include file="Footer.jsp"%>