<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Recuperación de contraseña">
<title>Recuperar Contraseña</title>
<style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
 
        .container {
            background: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px 40px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
 
        h1 {
            color: #007bff;
            font-size: 2rem;
            margin-bottom: 10px;
        }
 
        p {
            font-size: 1.1rem;
            margin-bottom: 20px;
            color: #555;
        }
 
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #ced4da;
            font-size: 1rem;
        }
 
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
 
        button:hover {
            background-color: #0056b3;
        }
 
        .error {
            color: #dc3545;
        }
 
        .success {
            color: #28a745;
        }
 
        a {
            color: #007bff;
            text-decoration: none;
            margin-top: 15px;
            display: inline-block;
        }
 
        a:hover {
            text-decoration: underline;
        }
</style>
</head>
<body>
<div class="container">
<h1>Recuperar Contraseña</h1>
<p>Ingresa tu correo electrónico asociado a tu cuenta para recibir instrucciones sobre cómo recuperar tu contraseña.</p>
 
        <form method="post" action="RecuperarContrasena.jsp">
<label for="correo">Correo Electrónico:</label>
<input type="email" id="correo" name="correo" placeholder="ejemplo@dominio.com" required>
<button type="submit" name="submit">Recuperar Contraseña</button>
</form>
 
        <c:if test="${not empty mensaje}">
<p class="${mensaje.contains('Error') ? 'error' : 'success'}">
<c:out value="${mensaje}" />
</p>
</c:if>
 
        <p><a href="index.jsp">Volver a la página de inicio</a></p>
</div>
</body>
</html>