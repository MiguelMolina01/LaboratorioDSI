<%@ page import="java.util.List, controladores.LibroControlador, modelo.Libro" %>
<%
    String mensaje = "";
    List<Libro> libros = null;

    try {
        LibroControlador controladores = new LibroControlador();
        libros = controladores.listarLibros();
    } catch (Exception e) {
        mensaje = "Error al cargar la lista de libros: " + e.getMessage();
    }

    // Establecer atributos para el mensaje y la lista de libros en el request
    request.setAttribute("mensaje", mensaje);
    request.setAttribute("libros", libros);
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de Libros</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        margin: 0;
        padding: 20px;
        color: #333;
    }

    h1 {
        text-align: center;
        color: white; /* Color de texto blanco para el título */
        text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.1); /* Sombra sutil al texto */
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .error-message {
        color: red;
        font-weight: bold;
        margin-bottom: 15px;
        text-align: center;
    }

    .no-data {
        text-align: center;
        margin-top: 20px;
        font-size: 1.2rem;
        color: #555;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #f9f9f9; /* Fondo sutil para la tabla */
        border-radius: 8px; /* Bordes redondeados en la tabla */
    }

    th, td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #007bff;
        color: white;
        text-transform: uppercase;
    }

    tr:nth-child(even) {
        background-color: #f1f1f1;
    }

    .btn, .btn-dashboard {
        display: inline-block;
        margin: 10px 0;
        padding: 10px 20px;
        background: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: bold;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    .btn:hover, .btn-dashboard:hover {
        background: #0056b3;
        transform: scale(1.05);
    }

    .actions a {
        text-decoration: none;
        padding: 8px 12px;
        margin-right: 5px;
        border-radius: 5px;
        font-size: 0.9rem;
        color: white;
        font-weight: bold;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    .actions a.edit {
        background-color: #28a745;
    }

    .actions a.edit:hover {
        background-color: #218838;
    }

    .actions a.delete {
        background-color: #dc3545;
    }

    .actions a.delete:hover {
        background-color: #c82333;
    }

    /* Botones alineados a la izquierda */
    .top-buttons {
        margin-bottom: 20px;
        display: flex;
        justify-content: flex-start;
        gap: 15px;
    }

</style>
</head>
<body>
<h1>Lista de Libros</h1>
<div class="container">
    <!-- Botones superiores para agregar libro y regresar al dashboard -->
    <div class="top-buttons">
        <a href="AgregarLibro.jsp" class="btn">Agregar Nuevo Libro</a>
        <a href="dashboard.jsp" class="btn-dashboard">Volver al Dashboard</a>
    </div>

    <!-- Mostrar mensaje de error si existe -->
    <% if (mensaje != null && !mensaje.isEmpty()) { %>
    <p class="error-message"><%= mensaje %></p>
    <% } %>

    <!-- Mostrar tabla de libros si existen -->
    <% if (libros != null && !libros.isEmpty()) { %>
    <table>
        <thead>
            <tr>
                <th>ISBN</th>
                <th>Título</th>
                <th>Fecha de Publicación</th>
                <th>Editorial</th>
                <th>Categoría</th>
                <th>Condición</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% for (Libro libro : libros) { %>
            <tr>
                <td><%= libro.getIsbn() %></td>
                <td><%= libro.getTitulo() %></td>
                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(libro.getFechaPublicacion()) %></td>
                <td><%= libro.getIdEditorial() %></td>
                <td><%= libro.getIdCategoria() %></td>
                <td><%= libro.getIdCondicion() %></td>
                <td class="actions">
                    <a href="EditarLibro.jsp?isbn=<%= libro.getIsbn() %>" class="edit">Editar</a>
                    <a href="EliminarLibro.jsp?isbn=<%= libro.getIsbn() %>" class="delete"
                        onclick="return confirm('¿Estás seguro de que deseas eliminar este libro?')">Eliminar</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p class="no-data">No hay libros registrados.</p>
    <% } %>
</div>
</body>
</html>
