<%@ page import="controladores.EmpleadoControlador, modelo.Empleado" %>
<%
    Empleado empleado = null;
    String mensaje = "";
    int idEmpleado = -1;

    try {
        // Obtener el id del parámetro de la solicitud
        idEmpleado = Integer.parseInt(request.getParameter("id"));
        EmpleadoControlador controladores = new EmpleadoControlador();

        if (request.getParameter("submit") != null) {
            // Recuperar los parámetros del formulario y actualizar el empleado
            empleado = new Empleado();
            empleado.setIdEmpleado(idEmpleado);
            empleado.setNombre(request.getParameter("nombre"));
            empleado.setApellido(request.getParameter("apellido"));
            empleado.setDui(request.getParameter("dui"));
            empleado.setTelefono(request.getParameter("telefono"));
            empleado.setCorreo(request.getParameter("correo"));
            controladores.editarEmpleado(empleado); // Actualiza el empleado
            mensaje = "Empleado actualizado exitosamente.";
        } else {
            // Obtener el empleado desde la base de datos para editarlo
            empleado = controladores.obtenerEmpleadoPorId(idEmpleado);
            if (empleado == null) {
                mensaje = "No se encontró un empleado con ese ID.";
            }
        }
    } catch (NumberFormatException e) {
        mensaje = "Error: El ID del empleado no es válido.";
    } catch (Exception e) {
        mensaje = "Error al actualizar el empleado: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Empleado</title>
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
        <h1>Editar Empleado</h1>
        <% if (mensaje != null && !mensaje.isEmpty()) { %>
            <p class="message <%= mensaje.contains("Error") ? "error" : "success" %>"><%= mensaje %></p>
        <% } %>
 
        <% if (empleado != null) { %>
            <form method="POST" action="EditarEmpleados.jsp?id=<%= idEmpleado %>">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<%= empleado.getNombre() %>" required>
 
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" value="<%= empleado.getApellido() %>" required>
 
                <label for="dui">DUI:</label>
                <input type="text" id="dui" name="dui" value="<%= empleado.getDui() %>" pattern="\d{8}-\d" required>
 
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" value="<%= empleado.getTelefono() %>" pattern="\d{8}">
 
                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" value="<%= empleado.getCorreo() %>" required>
 
                <button type="submit" name="submit">Guardar cambios</button>
            </form>
        <% } else { %>
            <p class="message error">No se encontró un empleado con ese ID.</p>
        <% } %>
 
        <a href="ListarEmpleados.jsp" class="back-link">Volver a la lista</a>
    </div>
</body>
</html>
