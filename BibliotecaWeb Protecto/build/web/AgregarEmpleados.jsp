<%@ page import="controladores.EmpleadoControlador, modelo.Empleado" %>
<%
    String mensaje = "";
    String tipoMensaje = "success"; // Clase CSS para manejar estilos

    if (request.getParameter("submit") != null) {
        try {
            Empleado empleado = new Empleado();
            empleado.setNombre(request.getParameter("nombre"));
            empleado.setApellido(request.getParameter("apellido"));
            empleado.setDui(request.getParameter("dui"));
            empleado.setTelefono(request.getParameter("telefono"));
            empleado.setCorreo(request.getParameter("correo"));

            EmpleadoControlador controlador = new EmpleadoControlador();
            controlador.agregarEmpleado(empleado);

            mensaje = "Empleado agregado exitosamente.";
        } catch (Exception e) {
            tipoMensaje = "error"; // Cambiar a clase de error
            mensaje = "Error al agregar el empleado: " + e.getMessage();
            e.printStackTrace(); // Registrar el error para depuración
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Empleado</title>
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
        <h1>Agregar Empleado</h1>
        <form method="POST" action="AgregarEmpleados.jsp">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" placeholder="Ingrese el nombre" required>
 
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" placeholder="Ingrese el apellido" required>
 
            <label for="dui">DUI:</label>
            <input type="text" id="dui" name="dui" pattern="\d{8}-\d" placeholder="Ejemplo: 12345678-9" required>
 
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" pattern="\d{8}" placeholder="Ejemplo: 1234-5678">
 
            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" placeholder="Ingrese el correo electrónico" required>
 
            <button type="submit" name="submit">Agregar</button>
        </form>
 
        <% if (mensaje != null && !mensaje.isEmpty()) { %>
            <p class="message <%= tipoMensaje %>"><%= mensaje %></p>
        <% } %>
 
        <a href="ListarEmpleados.jsp" class="back-link">Volver a la lista</a>
    </div>
</body>
</html>
