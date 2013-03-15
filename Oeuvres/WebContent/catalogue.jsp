<%-- 
    Document   : modifUser
    Created on : 24 nov. 2010, 10:04:11
    Author     : arsane
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="metier.*"%>
<%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profil</title>
</head>
<body>
<div id="layout">

		<div id="header">
	<h2>Catalogue des oeuvres</h2>
	<p>
	<table border="1">
		<tr>
			<th>Titre</th>
			<th>Prix</th>
			<th>Prénom propriétaire</th>
			<th>Nom propriétaire</th>
			<th>Réserver</th>
			<th>Modifier</th>
		</tr>

		<c:forEach var="oeuvre" items="${liste}">
			<tr>
				<td scope="col">${oeuvre.titreOeuvrevente}</td>
				<td scope="col">${oeuvre.prixOeuvrevente}</td>
				<td scope="col">${oeuvre.proprietaire.prenomProprietaire}</td>
				<td scope="col">${oeuvre.proprietaire.nomProprietaire}</td>
				<td scope="col" align="center"><c:if test="${oeuvre.etatOeuvrevente=='L'}">
						<a href="Controleur?action=reserverOeuvre&id=<c:out value="${oeuvre.idOeuvrevente}"/>"><img
									src="images/Ok-icon.png" alt="Modifier" style="border: none" /></a>
					</c:if></td>
				<td scope="col" align="center"><a
					href="Controleur?action=modifierOeuvre&id=${oeuvre.idOeuvrevente}"><img
									src="images/edit-icon.png" alt="Modifier" style="border: none" /></a>

				</td>
			</tr>
		</c:forEach>

	</table>
	<p></p>
</div></div>
</body>
</html>
<%@ include file="Footer.jsp"%>