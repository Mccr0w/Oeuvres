<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp"%>
<%@ page import="metier.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Réservation</title>
    </head>
    <body>
    <div id="layout">
		<div id="header">
        <h2>Réservation d'une oeuvre</h2>
        <form action="Controleur" method="post">
        	<input type="hidden" name="action" value="validerReservation" />
        	<input type="hidden" name="id" value="${oeuvre.idOeuvrevente}" />
            <p><br>
            Titre : <input type="text" name="txtTitre" value="${oeuvre.titreOeuvrevente}">
            <br>
            Prix : <input type="text" name="txtPrix" value="${oeuvre.prixOeuvrevente}">
            <br>
            </p>
            <p>
            Date réservation : <input type="text" name="txtDate" value="${date}"> Format : JJ/MM/AAAA
            <br>
            </p>
            Adhérent : <SELECT name="lstAdherents">
            <c:forEach items="${listeadherent}" var="adh" >
                       <option value="<c:out value="${adh.idAdherent}" />"><c:out value="${adh.nomAdherent} ${adh.prenomAdherent}" /></option>
            </c:forEach>
            </SELECT>
            <br><br>
            <input type="submit" class="button" value="Envoi">
            <p>
            </p>
        </form>
        </div></div>
    </body>
</html>
<%@ include file="Footer.jsp"%>
