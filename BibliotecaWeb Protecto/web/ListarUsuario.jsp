<%@ page import="java.util.List" %>
<%@ page import="controladores.UsuarioControlador, modelo.Usuario" %>
<%
    String mensaje = "";
    List<Usuario> usuarios = null;

    try {
        UsuarioControlador controladores = new UsuarioControlador();
        usuarios = controladores.listarUsuarios();
    } catch (Exception e) {
        mensaje = "Error al cargar la lista de usuarios: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestión de Usuarios</title>
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
 
        /* Close Session Button */

        .logout-btn {

            position: absolute;

            top: 10px;

            right: 20px;

            background-color: #dc3545;

            color: white;

            padding: 10px 15px;

            border-radius: 5px;

            text-decoration: none;

            font-weight: bold;

            font-size: 0.9rem;

            transition: background-color 0.3s ease, transform 0.2s ease;

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

                top: 10px;

                right: 10px;

                padding: 8px 12px;

                font-size: 0.8rem;

            }

        }
        
        /* Botón Agregar y Volver al Dashboard */
    .add-btn {
        display: inline-block;
        margin-right: 10px; /* Separación entre botones */
        padding: 12px 20px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        font-weight: bold;
        font-size: 1rem;
        border-radius: 5px;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .add-btn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    .add-btn[style*="background-color: #6c757d;"] {
        background-color: #6c757d;
    }

    .add-btn[style*="background-color: #6c757d;"]:hover {
        background-color: #5a6268;
    }

    /* Espaciado para los botones */
    section div {
        margin-top: 20px; /* Separación de los botones con respecto al header */
        margin-bottom: 20px; /* Separación de los botones con respecto a la tabla */
    }
</style>
</head>
<body>
<header>
<h1>Gestión de Usuarios</h1>
<p>Administra los usuarios del sistema.</p>
<a href="logout.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
</header>
 
<section>
    <!-- Contenedor para los botones -->
    <div style="text-align: left; margin: 20px;">
        <a href="AgregarUsuario.jsp" class="add-btn"><i class="fas fa-user-plus"></i> Agregar Usuario</a>
        <a href="dashboard.jsp" class="add-btn" style="background-color: #6c757d;"><i class="fas fa-tachometer-alt"></i> Volver al Dashboard</a>
    </div>

    <% if (mensaje != null && !mensaje.isEmpty()) { %>
    <p style="color: red; text-align: center; font-weight: bold;"><%= mensaje %></p>
    <% } %>

    <% if (usuarios != null && !usuarios.isEmpty()) { %>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre Usuario</th>
                <th>Rol</th>
                <th>Empleado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% for (Usuario usuario : usuarios) { %>
            <tr>
                <td><%= usuario.getIdUsuario() %></td>
                <td><%= usuario.getNombreUsuario() %></td>
                <td><%= usuario.getNombreRol() %></td>
                <td><%= usuario.getNombreEmpleado() %></td>
                <td>
                    <a href="EditarUsuario.jsp?id=<%= usuario.getIdUsuario() %>">
                        <i class="fas fa-edit"></i> Editar
                    </a>
                    <a href="EliminarUsuario.jsp?id=<%= usuario.getIdUsuario() %>" 
                        onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">
                        <i class="fas fa-trash"></i> Eliminar
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p style="text-align: center; color: #555; font-size: 1.2rem;">No hay usuarios registrados.</p>
    <% } %>
</section>


 
    <footer>
<p>&copy; 2024 Biblioteca. Todos los derechos reservados.</p>
</footer>
</body>
</html>
