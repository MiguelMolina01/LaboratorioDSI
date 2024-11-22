<%@ page import="controladores.UsuarioControlador, modelo.Usuario" %>
<%
    String mensaje = "";
    String tipoMensaje = "success"; // Clase para diferenciar estilos de mensajes

    if (request.getParameter("submit") != null) {
        try {
            Usuario usuario = new Usuario();
            usuario.setNombreUsuario(request.getParameter("nombreUsuario"));
            usuario.setContrasena(request.getParameter("contrasena"));
            usuario.setIdRol(Integer.parseInt(request.getParameter("idRol")));
            usuario.setIdEmpleado(Integer.parseInt(request.getParameter("idEmpleado")));

            UsuarioControlador controlador = new UsuarioControlador();
            controlador.agregarUsuario(usuario);

            mensaje = "Usuario agregado exitosamente.";
        } catch (Exception e) {
            tipoMensaje = "error"; // Cambiar clase si ocurre un error
            mensaje = "Error al agregar el usuario: " + e.getMessage();
            e.printStackTrace(); // Registrar errores para depuración
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Usuario</title>
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
        form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #333333;
        }
        form input, form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        form input:focus, form select:focus {
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
        <h1>Agregar Usuario</h1>
        <form method="POST" action="AgregarUsuario.jsp">
            <label for="nombreUsuario">Nombre de Usuario:</label>
            <input type="text" id="nombreUsuario" name="nombreUsuario" placeholder="Ingrese el nombre de usuario" required>
 
            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" placeholder="Ingrese la contraseña" required>
 
            <label for="idRol">Rol:</label>
            <select id="idRol" name="idRol" required>
                <option value="" disabled selected>Seleccione un rol</option>
                <option value="1">Administrador</option>
                <option value="2">Empleado</option>
                <option value="3">Usuario</option>
            </select>
 
            <label for="idEmpleado">ID Empleado:</label>
            <input type="number" id="idEmpleado" name="idEmpleado" placeholder="Ingrese el ID del empleado" min="1" required>
 
            <button type="submit" name="submit">Agregar</button>
        </form>
 
        <% if (mensaje != null && !mensaje.isEmpty()) { %>
            <p class="message <%= tipoMensaje %>"><%= mensaje %></p>
        <% } %>
 
        <a href="ListarUsuario.jsp" class="back-link">Volver a la lista</a>
    </div>
</body>
</html>
