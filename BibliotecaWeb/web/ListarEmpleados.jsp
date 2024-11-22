<%@ page import="java.util.List" %>
<%@ page import="modelo.Empleado, controladores.EmpleadoControlador" %>
<%
    String mensaje = "";
    List<Empleado> empleados = null;
    
    try {
        EmpleadoControlador controladores = new EmpleadoControlador();
        empleados = controladores.listarEmpleados();
    } catch (Exception e) {
        mensaje = "Error al cargar la lista de empleados: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestión de Empleados</title>
<!-- Font Awesome CDN -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<style>
    /* Global Styles */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    /* Header Styles */
    header {
        background-color: #007bff;
        color: white;
        padding: 20px;
        text-align: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        position: relative;
    }

    header h1 {
        margin: 0;
        font-size: 2rem;
    }

    header p {
        margin: 5px 0 0;
        font-size: 1rem;
    }

    /* Logout Button */
    .logout-btn {
        background-color: #dc3545;
        color: white;
        padding: 10px 15px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        font-size: 0.9rem;
        transition: background-color 0.3s ease, transform 0.2s ease;
        position: absolute;
        top: 20px;
        right: 20px;
    }

    .logout-btn:hover {
        background-color: #a71d2a;
        transform: scale(1.05);
    }

    /* Table Styles */
    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    td a {
        display: inline-block;
        margin: 0 5px;
        text-decoration: none;
        color: #007bff;
        font-size: 1rem;
    }

    td a:hover {
        color: #0056b3;
    }

    td a .icon {
        margin-right: 5px;
    }

    /* Add Button */
    .add-btn {
        display: inline-block;
        margin: 20px auto;
        text-decoration: none;
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: bold;
        transition: background-color 0.3s ease, transform 0.2s ease;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .add-btn:hover {
        background-color: #218838;
        transform: scale(1.05);
    }

    /* Footer Styles */
    footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 15px;
        font-size: 0.9rem;
        box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1);
        margin-top: auto;
    }

    footer p {
        margin: 0;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        table {
            width: 95%;
        }

        .logout-btn {
            padding: 8px 12px;
            font-size: 0.8rem;
        }
    }
</style>
</head>
<body>
<header>
    <h1>Gestión de Empleados</h1>
    <p>Administra la lista de empleados del sistema.</p>
    <a href="logout.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
</header>

<section>
    <div style="text-align: center; margin-bottom: 20px;">
        <a href="AgregarEmpleados.jsp" class="add-btn"><i class="fas fa-user-plus"></i> Agregar Empleado</a>
        <a href="dashboard.jsp" class="add-btn" style="background-color: #6c757d;"><i class="fas fa-tachometer-alt"></i> Volver al Dashboard</a>
    </div>

    <% if (mensaje != null && !mensaje.isEmpty()) { %>
    <p style="color: red; text-align: center; font-weight: bold;"><%= mensaje %></p>
    <% } %>

    <% if (empleados != null && !empleados.isEmpty()) { %>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>DUI</th>
                <th>Teléfono</th>
                <th>Correo</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% for (Empleado emp : empleados) { %>
            <tr>
                <td><%= emp.getIdEmpleado() %></td>
                <td><%= emp.getNombre() %></td>
                <td><%= emp.getApellido() %></td>
                <td><%= emp.getDui() %></td>
                <td><%= emp.getTelefono() %></td>
                <td><%= emp.getCorreo() %></td>
                <td>
                    <a href="EditarEmpleados.jsp?id=<%= emp.getIdEmpleado() %>">
                        <i class="fas fa-edit"></i> Editar
                    </a>
                    <a href="EliminarEmpleados.jsp?id=<%= emp.getIdEmpleado() %>" 
                        onclick="return confirm('¿Estás seguro de que deseas eliminar este empleado?')">
                        <i class="fas fa-trash"></i> Eliminar
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p style="text-align: center; color: #555; font-size: 1.2rem;">No hay empleados registrados.</p>
    <% } %>
</section>


<footer>
    <p>&copy; 2024 Biblioteca. Todos los derechos reservados.</p>
</footer>
</body>
</html>

