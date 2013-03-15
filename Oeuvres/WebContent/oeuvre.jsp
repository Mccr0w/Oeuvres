<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp"%>
<%@ page import="metier.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Oeuvre</title>
    </head>
    <body>
    <div id="layout">
		<div id="header">
        <h2>${titre}</h2>
        <form action="Controleur" method="post">
        	<input type="hidden" name="action" value="ajoutOeuvre" />
        	<input type="hidden" name="id" value="${oeuvre.idOeuvrevente}" />
            <p><br>
            Titre : <input type="text" name="txtTitre" value="${oeuvre.titreOeuvrevente}">
            <br>
            Prix : <input type="text" name="txtPrix" value="${oeuvre.prixOeuvrevente}">
            <br>
            </p>
           	Propriétaire : <SELECT name="proprietaire">          
         	<c:forEach items="${listeproprietaires}" var="pro" >
                       <c:choose>
                       <c:when test="${pro.idProprietaire==oeuvre.proprietaire.idProprietaire}">
                       <option value="<c:out value="${pro.idProprietaire}" />" selected=selected><c:out value="${pro.nomProprietaire} ${pro.prenomProprietaire}" /></option>
                       </c:when>
                       <c:otherwise>
                       <option value="<c:out value="${pro.idProprietaire}" />"><c:out value="${pro.nomProprietaire} ${pro.prenomProprietaire}" /></option>
                       </c:otherwise>
                       </c:choose>
            </c:forEach>
            </SELECT>
            <br><br>
            <input type="submit" class="button" value="Envoi">
            <p>

            </p>
        </form>
    </body>
</html>
<%@ include file="Footer.jsp"%>