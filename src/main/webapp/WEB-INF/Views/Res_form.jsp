<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Project.Reservation_salles.Salle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  List<Salle> salles = (List<Salle>) request.getAttribute("salles");
  String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter Réservation</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 0;
    }

    .container {
        background: white;
        padding: 30px;
        margin: 60px auto;
        max-width: 520px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.15);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .error {
        color: #dc3545;
        background: #f8d7da;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 15px;
        text-align: center;
        font-weight: bold;
    }

    label {
        display: block;
        margin-bottom: 15px;
        color: #333;
        font-weight: bold;
    }

    input[type="text"],
    input[type="date"],
    select {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input:focus,
    select:focus {
        outline: none;
        border-color: #28a745;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #28a745;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
    }

    button:hover {
        background: #1e7e34;
    }

    .back {
        display: block;
        text-align: center;
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

    <h2>Ajouter Réservation</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/reservations">

        <label>
            Salle
            <select name="salleId" required>
                <c:forEach var="s" items="${salles}">
                    <option value="${s.id}">
                        ${s.nom} (capacité : ${s.capacite})
                    </option>
                </c:forEach>
            </select>
        </label>

        <label>
            Date
            <input type="date" name="dateReservation" required/>
        </label>

        <label>
            Motif
            <input type="text" name="motif"/>
        </label>

        <label>
            Personne
            <input type="text" name="personne" required/>
        </label>

        <button type="submit">Réserver</button>
    </form>

    <a class="back" href="${pageContext.request.contextPath}/reservations">
        ← Retour à la liste des réservations
    </a>

</div>

</body>
</html>
