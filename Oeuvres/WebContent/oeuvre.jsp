<%-- 
    Document   : oeuvre
    Created on : 2 d�c. 2010, 16:35:33
    Author     : arsane
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Oeuvre</title>
    </head>
    <body>
        <h1 align='center'>${titre}</h1>
        <form action="xxxxxxxxxx" method="post" name="frmModif">
            <p>
            Titre : <input type="text" name="txtTitre" value="${rOeuvre.titre}">
            <br><br>
            Prix : <input type="text" name="txtPrix" value="${rOeuvre.prix}">
            <br><br>
            </p>
           	Propri�taire : <SELECT name="proprietaire">          
         	           <c:forEach items="${listeproprietaires}" var="pro" >
                       <c:choose>
                       <c:when test="${pro.idProprietaire==oeuvre.idProprietaire}">
                       <option value="<c:out value="${pro.idProprietaire}" />" selected=selected><c:out value="${pro.nomProprietaire} ${pro.prenomProprietaire}" /></option>
                       </c:when>
                       <c:otherwise>
                       <option value="<c:out value="${pro.idProprietaire}" />"><c:out value="${pro.nomProprietaire} ${pro.prenomProprietaire}" /></option>
                       </c:otherwise>
                       </c:choose>
                       
                       </c:forEach>


            </SELECT>
            <br><br>
            <input type="submit" value="Envoi">
            <p>

            </p>
        </form>
    </body>
</html>
