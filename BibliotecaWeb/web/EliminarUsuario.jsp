<%@ page import="controladores.UsuarioControlador" %>
<%
    UsuarioControlador controladores = new UsuarioControlador();
    String mensaje = "";

    // Verificar si el parámetro ID está presente y es un número válido
    String idUsuarioParam = request.getParameter("id");
    if (idUsuarioParam != null && !idUsuarioParam.isEmpty()) {
        try {
            int idUsuario = Integer.parseInt(idUsuarioParam);
            try {
                controladores.eliminarUsuario(idUsuario);
                mensaje = "Usuario eliminado exitosamente.";
            } catch (Exception e) {
                mensaje = "Error al eliminar el usuario: " + e.getMessage();
            }
        } catch (NumberFormatException e) {
            mensaje = "El ID del usuario no es válido.";
        }
    } else {
        mensaje = "No se ha proporcionado un ID de usuario.";
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Eliminar Usuario</title>
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

            max-width: 400px;

            background: #ffffff;

            padding: 20px;

            border-radius: 8px;

            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

            text-align: center;

        }

        h1 {

            margin-bottom: 20px;

        }

        .message-success {

            color: green;

            font-weight: bold;

        }

        .message-error {

            color: red;

            font-weight: bold;

        }

        a {

            display: inline-block;

            margin-top: 20px;

            text-decoration: none;

            color: #007bff;

            font-weight: bold;

            padding: 10px 20px;

            border: 1px solid #007bff;

            border-radius: 4px;

            transition: background-color 0.3s, color 0.3s;

        }

        a:hover {

            background-color: #007bff;

            color: #ffffff;

        }
</style>
</head>
<body>
<div class="container">
<% if (mensaje != null && !mensaje.isEmpty()) { %>
<h1 class="<%= mensaje.contains("Error") ? "message-error" : "message-success" %>">
<%= mensaje %>
</h1>
<% } else { %>
<h1 class="message-error">Ocurrió un error al eliminar el usuario.</h1>
<% } %>
<a href="ListarUsuario.jsp">Volver a la lista</a>
</div>
</body>
</html>
