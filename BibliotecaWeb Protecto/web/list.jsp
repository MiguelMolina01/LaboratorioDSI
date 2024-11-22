<%@ page import="java.util.List" %>
<%@ page import="controladores.EmpleadoControlador" %>
<%@ page import="modelo.Empleado" %>
<%
    // Obtener la lista de empleados
    EmpleadoControlador empleadoControlador = new EmpleadoControlador();
    List<Empleado> empleados = null;
    
    try {
        empleados = empleadoControlador.listarEmpleados();  // Obtener empleados desde la base de datos
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Empleados</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
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
        }
 
        header h1 {
            margin: 0;
            font-size: 2rem;
        }
 
        /* Table Styles */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
 
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
 
        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
 
        tr:hover {
            background-color: #f1f1f1;
        }
 
        td a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
 
        td a:hover {
            text-decoration: underline;
        }
 
        td:last-child {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
 
        .action-btn {
            padding: 5px 10px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
 
        .edit-btn {
            background-color: #007bff;
            color: white;
        }
 
        .edit-btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
 
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
 
        .delete-btn:hover {
            background-color: #a71d2a;
            transform: scale(1.05);
        }
 
        /* Footer Styles */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: auto;
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1);
        }
 
        footer p {
            margin: 0;
        }
 
        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 100%;
                margin: 10px auto;
            }
 
            td, th {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Gestión de Empleados</h1>
    </header>
 
    <h2 style="text-align: center; margin-top: 20px; color: #333;">Lista de Empleados</h2>
 
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Cargo</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% if (empleados != null && !empleados.isEmpty()) { %>
                <% for (Empleado empleado : empleados) { %>
                    <tr>
                        <td><%= empleado.getIdEmpleado() %></td>
                        <td><%= empleado.getNombre() %></td>
                        <td><%= empleado.getApellido() %></td>
                        <td><%= empleado.getIdCargo() %></td>
                        <td>
                            <button class="action-btn edit-btn" onclick="window.location.href='EditarEmpleados.jsp?id=<%= empleado.getIdEmpleado() %>'">Editar</button>
                            <button class="action-btn delete-btn" onclick="if(confirm('¿Estás seguro de eliminar este empleado?')) window.location.href='EliminarEmpleados.jsp?id=<%= empleado.getIdEmpleado() %>'">Eliminar</button>
                        </td>
                    </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="5">No hay empleados registrados.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
 
    <footer>
        <p>&copy; 2024 Biblioteca. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
