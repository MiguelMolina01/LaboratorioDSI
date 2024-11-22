<%@ page import="controladores.EmpleadoControlador" %>
<%
    String mensaje = "";
    try {
        // Verificar si el parámetro ID está presente y es un número válido
        String idEmpleadoParam = request.getParameter("id");
        if (idEmpleadoParam != null && !idEmpleadoParam.isEmpty()) {
            try {
                int idEmpleado = Integer.parseInt(idEmpleadoParam);
                
                // Llamada al controlador para eliminar el empleado
                EmpleadoControlador controladores = new EmpleadoControlador();
                boolean eliminado = controladores.eliminarEmpleado(idEmpleado);
                
                if (eliminado) {
                    mensaje = "Empleado eliminado exitosamente.";
                } else {
                    mensaje = "Empleado no encontrado o ya eliminado.";
                }
            } catch (NumberFormatException e) {
                mensaje = "El ID del empleado no es válido.";
            }
        } else {
            mensaje = "ID del empleado no proporcionado.";
        }
    } catch (Exception e) {
        mensaje = "Error al eliminar el empleado: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Empleado</title>
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
            color: #333333;
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
            <h1 class="message-error">Ocurrió un error al eliminar el empleado.</h1>
        <% } %>
        <a href="ListarEmpleados.jsp">Volver a la lista</a>
    </div>
</body>
</html>
