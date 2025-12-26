<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Project.Reservation_salles.Salle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  List<Salle> salles = (List<Salle>) request.getAttribute("salles");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salles</title>

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
        max-width: 900px;
        margin: 0 auto;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .btn-add {
        display: inline-block;
        margin-bottom: 15px;
        padding: 8px 14px;
        background: #007bff;
        color: white;
        border-radius: 4px;
        text-decoration: none;
        font-size: 14px;
    }
    .btn-add:hover {
        background: #0056b3;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th {
        background: #007bff;
        color: white;
        padding: 10px;
        text-align: left;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    tr:hover {
        background: #f5faff;
    }

    .actions a {
        margin-right: 8px;
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
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

    <h2>Liste des Salles</h2>

    <a class="btn-add" href="${pageContext.request.contextPath}/salles?action=create">
        + Ajouter une salle
    </a>

    <table>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Capacité</th>
            <th>Équipement</th>
            <th>Actions</th>
        </tr>

        <c:if test="${empty salles}">
            <tr><td colspan="5" style="text-align:center;">Aucune salle trouvée</td></tr>
        </c:if>

        <c:forEach var="s" items="${salles}">
            <tr>
                <td>${s.id}</td>
                <td>${s.nom}</td>
                <td>${s.capacite}</td>
                <td>${s.equipement}</td>
                <td class="actions">
                    <a href="${pageContext.request.contextPath}/salles?action=edit&id=${s.id}">Modifier</a>
                    <a href="${pageContext.request.contextPath}/salles?action=delete&id=${s.id}"
                       onclick="return confirm('Supprimer cette salle ?');">Supprimer</a>
                </td>
            </tr>
        </c:forEach>

    </table>

    <a class="back" href="${pageContext.request.contextPath}/">← Retour à l'accueil</a>

</div>

</body>
</html>
