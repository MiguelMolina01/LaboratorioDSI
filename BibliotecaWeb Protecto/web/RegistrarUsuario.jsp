<%@ page import="controladores.UsuarioControlador, modelo.Usuario" %>
<%
    String mensaje = "";
    
    // Verificar si se ha enviado el formulario
    if (request.getParameter("submit") != null) {
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");
        String confirmarContrasena = request.getParameter("confirmarContrasena");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int idRol = Integer.parseInt(request.getParameter("idRol"));
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));

        // Validaciones
        if (nombreUsuario.isEmpty() || contrasena.isEmpty() || confirmarContrasena.isEmpty() || nombre.isEmpty() || apellido.isEmpty()) {
            mensaje = "Todos los campos son obligatorios.";
        } else if (!contrasena.equals(confirmarContrasena)) {
            mensaje = "Las contraseñas no coinciden.";
        } else {
            // Crear un nuevo usuario
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombreUsuario(nombreUsuario);
            nuevoUsuario.setContrasena(contrasena);  // Aquí también puedes cifrar la contraseña antes de guardarla
            nuevoUsuario.setIdRol(idRol);
            nuevoUsuario.setIdEmpleado(idEmpleado);
            
            // Usar el controlador para agregar el usuario
            UsuarioControlador usuarioControlador = new UsuarioControlador();
            try {
                usuarioControlador.agregarUsuario(nuevoUsuario);
                mensaje = "Usuario registrado con éxito.";
            } catch (Exception e) {
                mensaje = "Error al registrar el usuario: " + e.getMessage();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registrar Usuario</title>
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

            background: #ffffff;

            border-radius: 8px;

            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

            padding: 30px;

            width: 90%;

            max-width: 400px;

            text-align: center;

        }
 
        h1 {

            font-size: 2rem;

            color: #333;

            margin-bottom: 20px;

        }
 
        .form-group {

            margin-bottom: 15px;

            text-align: left;

        }
 
        label {

            display: block;

            font-weight: bold;

            margin-bottom: 5px;

            color: #555;

        }
 
        input[type="text"], input[type="password"] {

            width: 100%;

            padding: 10px;

            margin-bottom: 10px;

            border: 1px solid #ccc;

            border-radius: 5px;

            font-size: 1rem;

        }
 
        .btn {

            display: inline-block;

            padding: 12px 20px;

            background-color: #007bff;

            color: white;

            text-decoration: none;

            border-radius: 5px;

            font-size: 1rem;

            transition: background-color 0.3s ease, transform 0.2s ease;

            cursor: pointer;

            border: none;

            margin: 10px 5px;

        }
 
        .btn:hover {

            background-color: #0056b3;

            transform: scale(1.05);

        }
 
        .btn-secondary {

            background-color: #6c757d;

        }
 
        .btn-secondary:hover {

            background-color: #5a6268;

        }
 
        .error {

            color: red;

            font-weight: bold;

            margin-bottom: 15px;

        }
 
        p {

            margin-top: 15px;

        }
 
        a {

            color: #007bff;

            text-decoration: none;

        }
 
        a:hover {

            text-decoration: underline;

        }
 
        @media (max-width: 768px) {

            .container {

                padding: 20px;

            }
 
            h1 {

                font-size: 1.5rem;

            }
 
            .btn {

                width: 100%;

                margin-top: 10px;

            }

        }
</style>
</head>
<body>
<div class="container">
<h1>Registrar Usuario</h1>
 
        <% if (mensaje != null && !mensaje.isEmpty()) { %>
<p class="error"><%= mensaje %></p>
<% } %>
 
        <form method="POST" action="RegistrarUsuario.jsp">
<div class="form-group">
<label for="nombreUsuario">Nombre de Usuario:</label>
<input type="text" id="nombreUsuario" name="nombreUsuario" placeholder="Ingrese su usuario" required>
</div>
 
            <div class="form-group">
<label for="contrasena">Contraseña:</label>
<input type="password" id="contrasena" name="contrasena" placeholder="Ingrese su contraseña" required>
</div>
 
            <div class="form-group">
<label for="confirmarContrasena">Confirmar Contraseña:</label>
<input type="password" id="confirmarContrasena" name="confirmarContrasena" placeholder="Repita su contraseña" required>
</div>
 
            <div class="form-group">
<label for="nombre">Nombre:</label>
<input type="text" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>
</div>
 
            <div class="form-group">
<label for="apellido">Apellido:</label>
<input type="text" id="apellido" name="apellido" placeholder="Ingrese su apellido" required>
</div>
 
            <button type="submit" name="submit" class="btn">Registrar</button>
<a href="LoginUsuario.jsp" class="btn btn-secondary">Iniciar Sesión</a>
</form>
</div>
</body>
</html>
