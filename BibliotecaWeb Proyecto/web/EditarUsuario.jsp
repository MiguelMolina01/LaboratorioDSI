<%@ page import="controladores.UsuarioControlador, modelo.Usuario" %>
<%
    // Initializing necessary variables
    UsuarioControlador controladores = new UsuarioControlador();
    Usuario usuario = null;
    String mensaje = "";
    int idUsuario = -1;
    
    // Safe parsing of user ID from the request
    String idUsuarioParam = request.getParameter("id");
    if (idUsuarioParam != null) {
        try {
            idUsuario = Integer.parseInt(idUsuarioParam);
        } catch (NumberFormatException e) {
            mensaje = "ID de usuario inválido.";
        }
    } else {
        mensaje = "No se proporcionó el ID del usuario.";
    }
    
    // If the ID is valid, try to fetch the user from the database
    if (idUsuario != -1 && mensaje.isEmpty()) {
        try {
            // Fetching user using the new method
            usuario = controladores.obtenerUsuarioPorId(idUsuario);

            if (usuario == null) {
                mensaje = "Usuario no encontrado.";
            }

            // Handle form submission to update the user
            if (request.getParameter("submit") != null && usuario != null) {
                try {
                    // Setting new values from form input
                    usuario.setNombreUsuario(request.getParameter("nombreUsuario"));
                    usuario.setContrasena(request.getParameter("contrasena"));
                    usuario.setIdRol(Integer.parseInt(request.getParameter("idRol")));
                    usuario.setIdEmpleado(Integer.parseInt(request.getParameter("idEmpleado")));

                    // Updating the user in the database
                    controladores.editarUsuario(usuario);
                    mensaje = "Usuario actualizado exitosamente.";
                } catch (Exception e) {
                    mensaje = "Error al actualizar el usuario: " + e.getMessage();
                }
            }
        } catch (Exception e) {
            mensaje = "Error al obtener los datos del usuario: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editar Usuario</title>
<style>

        body {

            font-family: Arial, sans-serif;

            background-color: #f4f4f9;

            margin: 0;

            padding: 0;

            display: flex;

            justify-content: center;

            align-items: center;

            height: 100vh;

        }

        .container {

            width: 100%;

            max-width: 500px;

            background: #ffffff;

            padding: 20px;

            border-radius: 8px;

            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

        }

        h1 {

            text-align: center;

            color: #007bff;

            margin-bottom: 20px;

        }

        .message {

            text-align: center;

            font-weight: bold;

            margin-bottom: 20px;

        }

        .success {

            color: green;

        }

        .error {

            color: red;

        }

        form label {

            display: block;

            margin: 10px 0 5px;

            font-weight: bold;

            color: #333333;

        }

        form input {

            width: 100%;

            padding: 10px;

            margin-bottom: 15px;

            border: 1px solid #ccc;

            border-radius: 4px;

            box-sizing: border-box;

        }

        form input:focus {

            border-color: #007bff;

            outline: none;

            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);

        }

        form button {

            width: 100%;

            padding: 10px;

            background-color: #007bff;

            color: #ffffff;

            border: none;

            border-radius: 4px;

            cursor: pointer;

            font-size: 1rem;

        }

        form button:hover {

            background-color: #0056b3;

        }

        .back-link {

            display: block;

            text-align: center;

            margin-top: 20px;

            text-decoration: none;

            color: #007bff;

            font-weight: bold;

        }

        .back-link:hover {

            text-decoration: underline;

        }
</style>
</head>
<body>
<div class="container">
<h1>Editar Usuario</h1>
<% if (mensaje != null && !mensaje.isEmpty()) { %>
<p class="message <%= mensaje.contains("Error") ? "error" : "success" %>"><%= mensaje %></p>
<% } %>
 
        <% if (usuario != null) { %>
<form method="POST" action="EditarUsuario.jsp?id=<%= idUsuario %>">
<label for="nombreUsuario">Nombre de Usuario:</label>
<input type="text" id="nombreUsuario" name="nombreUsuario" value="<%= usuario.getNombreUsuario() %>" placeholder="Ingrese el nombre de usuario" required>
 
                <label for="contrasena">Contraseña:</label>
<input type="password" id="contrasena" name="contrasena" value="<%= usuario.getContrasena() %>" placeholder="Ingrese la nueva contraseña" required>
 
                <label for="idRol">ID Rol:</label>
<input type="number" id="idRol" name="idRol" value="<%= usuario.getIdRol() %>" placeholder="Ingrese el ID del rol" min="1" required>
 
                <label for="idEmpleado">ID Empleado:</label>
<input type="number" id="idEmpleado" name="idEmpleado" value="<%= usuario.getIdEmpleado() %>" placeholder="Ingrese el ID del empleado" min="1" required>
 
                <button type="submit" name="submit">Actualizar</button>
</form>
<% } else { %>
<p class="message error">No se encontró el usuario con ese ID.</p>
<% } %>
 
        <a href="ListarUsuario.jsp" class="back-link">Volver a la lista</a>
</div>
</body>
</html>
