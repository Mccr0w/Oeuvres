<%-- 
    Document   : modifUser
    Created on : 24 nov. 2010, 10:04:11
    Author     : arsane
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="metier.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profil</title>
</head>
<body>
	<h1 align='center'>Catalogue des oeuvres</h1>
	<p>
	<table border="1">
		<tr>
			<td>Titre</td>
			<td>Prix</td>
			<td>Prénom propriétaire</td>
			<td>Nom propriétaire</td>
			<td>Réserver</td>
			<td>Modifier</td>
		</tr>

		<c:forEach var="oeuvre" items="${liste}">
			<tr>
				<td scope="col">${oeuvre.titreOeuvrevente}</td>
				<td scope="col">${oeuvre.prixOeuvrevente}</td>
				<td scope="col">${oeuvre.proprietaire.prenomProprietaire}</td>
				<td scope="col">${oeuvre.proprietaire.nomProprietaire}</td>
				<td scope="col"><c:if test="${oeuvre.etatOeuvrevente=='L'}">
						<a href="Controleur?action=reserverOeuvre&id=<c:out value="${oeuvre.idOeuvrevente}"/>">Réserver</a>
					</c:if></td>
				<td scope="col"><a
					href="Controleur?action=modifierOeuvre&id=${oeuvre.idOeuvrevente}">Modifier</a>

				</td>
			</tr>
		</c:forEach>

	</table>
	<a href="xxxxxxx">Accueil</a>
	<p></p>
</body>
</html>
