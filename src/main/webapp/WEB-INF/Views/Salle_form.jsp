<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Project.Reservation_salles.Salle"%>

<%
  Salle s = (Salle) request.getAttribute("salle");
  boolean edit = s != null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= edit ? "Modifier Salle" : "Ajouter Salle" %></title>

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
        margin: 80px auto;
        max-width: 500px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.15);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
    }

    label {
        display: block;
        margin-bottom: 15px;
        color: #333;
        font-weight: bold;
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input:focus {
        outline: none;
        border-color: #007bff;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
    }

    button:hover {
        background: #0056b3;
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

    <h2><%= edit ? "Modifier Salle" : "Ajouter Salle" %></h2>

    <form method="post" action="${pageContext.request.contextPath}/salles">

        <input type="hidden" name="id" value="<%= edit ? s.getId() : "" %>"/>

        <label>
            Nom
            <input type="text" name="nom"
                   value="<%= edit ? s.getNom() : "" %>" required/>
        </label>

        <label>
            Capacité
            <input type="number" name="capacite"
                   value="<%= edit ? s.getCapacite() : 0 %>" required/>
        </label>

        <label>
            Équipement
            <input type="text" name="equipement"
                   value="<%= edit ? s.getEquipement() : "" %>"/>
        </label>

        <button type="submit">Enregistrer</button>
    </form>

    <a class="back" href="${pageContext.request.contextPath}/salles">
        ← Retour à la liste des salles
    </a>

</div>

</body>
</html>
