<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Project.Reservation_salles.Reservation"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Réservations</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 20px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .container {
        background: white;
        padding: 20px;
        border-radius: 8px;
        max-width: 950px;
        margin: 0 auto;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .btn-add {
        display: inline-block;
        margin-bottom: 15px;
        padding: 8px 14px;
        background: #28a745;
        color: white;
        border-radius: 4px;
        text-decoration: none;
        font-size: 14px;
    }
    .btn-add:hover {
        background: #1e7e34;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th {
        background: #28a745;
        color: white;
        padding: 10px;
        text-align: left;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    tr:hover {
        background: #f5fff5;
    }

    .actions a {
        margin-right: 8px;
        color: #dc3545;
        font-weight: bold;
        text-decoration: none;
    }
    .actions a:hover {
        text-decoration: underline;
    }

    .back {
        display: inline-block;
        margin-top: 15px;
        color: #555;
        text-decoration: none;
    }
    .back:hover {
        text-decoration: underline;
    }
</style>

</head>

<body>

<div class="container">

    <h2>Liste des Réservations</h2>

    <a class="btn-add" href="${pageContext.request.contextPath}/reservations?action=create">
        + Ajouter une réservation
    </a>

    <table>
        <tr>
            <th>ID</th>
            <th>ID Salle</th>
            <th>Date</th>
            <th>Motif</th>
            <th>Personne</th>
            <th>Actions</th>
        </tr>

        <c:if test="${empty reservations}">
            <tr><td colspan="6" style="text-align:center;">Aucune réservation trouvée</td></tr>
        </c:if>

        <c:forEach var="r" items="${reservations}">
            <tr>
                <td>${r.id}</td>
                <td>${r.salleId}</td>
                <td>${r.dateReservation}</td>
                <td>${r.motif}</td>
                <td>${r.personne}</td>
                <td class="actions">
                    <a href="${pageContext.request.contextPath}/reservations?action=delete&id=${r.id}"
                       onclick="return confirm('Supprimer cette réservation ?');">Supprimer</a>
                </td>
            </tr>
        </c:forEach>

    </table>

    <a class="back" href="${pageContext.request.contextPath}/">← Retour à l'accueil</a>

</div>

</body>
</html>
