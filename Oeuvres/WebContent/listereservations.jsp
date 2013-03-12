<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="metier.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste réservations</title>
</head>
<body>
	<h1 align='center'>Liste des réservations</h1>
	<p>
	<table border="1">
		<tr>
			<th>Titre</th>
			<th>Date</th>
			<th>Statut</th>
			<th>Prénom adhérent</th>
			<th>Nom adhérent</th>
			<th>Confirmer</th>
		</tr>

		<c:forEach var="reservation" items="${liste}">
			<tr>
				<td scope="col">${reservation.oeuvrevente.titreOeuvrevente}</td>
				<td scope="col">${reservation.dateReservation}</td>
				<td scope="col">${reservation.statut}</td>
				<td scope="col">${reservation.adherent.prenomAdherent}</td>
				<td scope="col">${reservation.adherent.nomAdherent}</td>
				<td scope="col">
						<c:if test="${reservation.statut=='A'}">
							<a
								href="Controleur?action=confirmerReservation&idA=<c:out value="${reservation.id.idAdherent}"/>&idO=<c:out value="${reservation.id.idOeuvrevente}"/>">Confirmer</a>
						</c:if>
				</td>
			</tr>
		</c:forEach>


	</table>
	<a href="accueil.jsp">Accueil</a>
	<p></p>
</body>
</html>
