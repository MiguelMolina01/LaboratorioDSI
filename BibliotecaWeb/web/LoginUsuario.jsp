<%@ page import="servicios.LoginService, modelo.Usuario" %>
<%
    String mensaje = "";
    
    // Verificar si hay un mensaje de error pasado por la redirección anterior
    if (request.getParameter("mensaje") != null) {
        mensaje = request.getParameter("mensaje");
    }

    // Procesar el inicio de sesión
    if (request.getParameter("submit") != null) {
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");

        LoginService loginService = new LoginService();
        Usuario usuario = loginService.autenticar(nombreUsuario, contrasena);

        if (usuario != null) {
            session.setAttribute("usuario", usuario);

            // Redirigir según el rol
            int idRol = usuario.getIdRol();
            if (idRol == 1) { // Administrador
                response.sendRedirect("dashboard.jsp");
            } else if (idRol == 2) { // Empleado
                response.sendRedirect("list.jsp");
            } else { // Otros roles
                response.sendRedirect("novedades.jsp");
            }
        } else {
            mensaje = "Credenciales incorrectas.";
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inicio de Sesión</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #e3f2fd, #bbdefb);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        width: 100%;
        max-width: 400px;
        background: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        text-align: center;
        animation: fadeIn 1s ease-in-out;
    }

    h1 {
        color: #007bff;
        margin-bottom: 20px;
        font-size: 1.8rem;
        font-weight: bold;
    }

    .error {
        color: red;
        font-weight: bold;
        margin-bottom: 15px;
    }

    form label {
        display: block;
        text-align: left;
        margin: 10px 0 5px;
        font-weight: bold;
        color: #333333;
    }

    form input {
        width: 100%;
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }

    form input:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 6px rgba(0, 123, 255, 0.5);
    }

    form button {
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        color: #ffffff;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 1rem;
        font-weight: bold;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    form button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .forgot-password {
        display: block;
        margin-top: 15px;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        font-size: 0.9rem;
    }

    .forgot-password:hover {
        text-decoration: underline;
        color: #0056b3;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
</head>
<body>
<div class="container">
<h1>Inicio de Sesión</h1>
<%-- Mostrar mensaje de error si es necesario --%>
<% if (mensaje != null && !mensaje.isEmpty()) { %>
<p class="error"><%= mensaje %></p>
<% } %>
 
        <form method="POST" action="LoginUsuario.jsp">
<label for="nombreUsuario">Usuario:</label>
<input type="text" id="nombreUsuario" name="nombreUsuario" placeholder="Ingrese su usuario" required>
<label for="contrasena">Contraseña:</label>
<input type="password" id="contrasena" name="contrasena" placeholder="Ingrese su contraseña" required>
<button type="submit" name="submit">Iniciar Sesión</button>
</form>
 
        <a href="RecuperarContrasena.jsp" class="forgot-password">¿Olvidaste tu contraseña?</a>
</div>
</body>
</html>
