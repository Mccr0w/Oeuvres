<%-- 
    Document   : listereservations
    Created on : 5 déc. 2010, 17:12:15
    Author     : alain
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="metier.*" %>

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
		                    <td scope="col">${reservation.oeuvrevente.etatOeuvrevente}</td>
		                    <td scope="col">${reservation.adherent.prenomAdherent}</td>
		                    <td scope="col">${reservation.adherent.nomAdherent}</td>
                    		<td scope="col"><a href="xxxxxxxx">Confirmer</a></td>
						</tr>
				</c:forEach>


            </table>
            <a href="xxxxxxxx">Accueil</a>
            <p>

            </p>
    </body>
</html>
