<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/screen.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link rel="stylesheet" media="print" type="text/css"
	href="css/print.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Erreur</title>
</head>
<body>
	<div id="layout">
		<div id="header">
			<h2>Une erreur est survenue</h2>
			<br/>
			${erreur}
		</div>
	</div>
</body>
</html>
<%@ include file="Footer.jsp"%>