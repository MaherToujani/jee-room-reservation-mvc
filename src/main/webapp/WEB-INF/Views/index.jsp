<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Réservation de Salles</title>

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
        max-width: 600px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.15);
        text-align: center;
    }

    h1 {
        color: #333;
        margin-bottom: 30px;
        font-size: 28px;
    }

    ul {
        list-style: none;
        padding: 0;
    }

    li {
        margin: 15px 0;
    }

    a.menu-btn {
        display: inline-block;
        padding: 12px 20px;
        font-size: 18px;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        width: 80%;
        text-align: center;
        transition: 0.2s ease;
    }

    .btn-salle {
        background: #007bff;
    }
    .btn-salle:hover {
        background: #0056b3;
    }

    .btn-res {
        background: #28a745;
    }
    .btn-res:hover {
        background: #1e7e34;
    }
</style>

</head>

<body>

<div class="container">

    <h1>Gestion des Réservations de Salles</h1>

    <ul>
        <li>
            <a class="menu-btn btn-salle"
               href="${pageContext.request.contextPath}/salles">
               Gestion des Salles
            </a>
        </li>

        <li>
            <a class="menu-btn btn-res"
               href="${pageContext.request.contextPath}/reservations">
               Gestion des Réservations
            </a>
        </li>
    </ul>

</div>

</body>
</html>
