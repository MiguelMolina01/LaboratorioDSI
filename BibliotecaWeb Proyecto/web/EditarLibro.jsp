<%@ page import="controladores.LibroControlador" %>
<%@ page import="modelo.Libro" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String mensaje = "";
    Libro libro = null;
    LibroControlador controlador = new LibroControlador();
 
    // Obtener el parámetro 'isbn' de la solicitud
    String isbn = request.getParameter("isbn");
 
    if (isbn != null && !isbn.isEmpty()) {
        try {
            // Obtener el libro desde el controlador
            libro = controlador.obtenerLibroPorIsbn(isbn);
            if (libro == null) {
                mensaje = "No se encontró el libro con el ISBN proporcionado.";
            }
        } catch (Exception e) {
            mensaje = "Error al obtener el libro: " + e.getMessage();
        }
    } else {
        mensaje = "ISBN no válido.";
    }
 
    // Procesar la actualización del libro si el método es POST
    if (request.getMethod().equalsIgnoreCase("POST") && libro != null) {
        try {
            String nuevoTitulo = request.getParameter("titulo");
            String fechaPublicacionStr = request.getParameter("fechaPublicacion");
            Integer idEditorial = Integer.parseInt(request.getParameter("idEditorial"));
            Integer idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
            Integer idCondicion = Integer.parseInt(request.getParameter("idCondicion"));
 
            // Parsear la fecha
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaPublicacion = sdf.parse(fechaPublicacionStr);
 
            // Actualizar los datos del libro
            libro.setTitulo(nuevoTitulo);
            libro.setFechaPublicacion(fechaPublicacion);
            libro.setIdEditorial(idEditorial);
            libro.setIdCategoria(idCategoria);
            libro.setIdCondicion(idCondicion);
 
            // Actualizar el libro en la base de datos
            controlador.actualizarLibro(libro);
            mensaje = "Libro actualizado exitosamente.";
        } catch (Exception e) {
            mensaje = "Error al actualizar el libro: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Libro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #fff;
        }
        .container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 100%;
            max-width: 450px;
            text-align: center;
            color: #333;
        }
        h1 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #6a11cb;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: inline-block;
        }
        input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            margin-top: 5px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        input:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 5px rgba(106, 17, 203, 0.5);
        }
        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background: #6a11cb;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn:hover {
            background: #2575fc;
            transform: scale(1.05);
        }
        a {
            color: #6a11cb;
            text-decoration: none;
            display: inline-block;
            margin-top: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        .success {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Editar Libro</h1>
        
        <!-- Mostrar mensaje dinámico -->
        <% if (!mensaje.isEmpty()) { %>
            <p class="<%= mensaje.contains("Error") ? "error" : "success" %>"><%= mensaje %></p>
        <% } %>
 
        <!-- Mostrar el formulario si el libro existe -->
        <% if (libro != null) { %>
            <form method="POST" action="EditarLibro.jsp?isbn=<%= libro.getIsbn() %>">
                <div class="form-group">
                    <label for="isbn">ISBN:</label>
                    <input type="text" id="isbn" name="isbn" value="<%= libro.getIsbn() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="titulo">Título:</label>
                    <input type="text" id="titulo" name="titulo" value="<%= libro.getTitulo() %>" required>
                </div>
                <div class="form-group">
                    <label for="fechaPublicacion">Fecha de Publicación:</label>
                    <input type="date" id="fechaPublicacion" name="fechaPublicacion" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(libro.getFechaPublicacion()) %>" required>
                </div>
                <div class="form-group">
                    <label for="idEditorial">ID Editorial:</label>
                    <input type="number" id="idEditorial" name="idEditorial" value="<%= libro.getIdEditorial() %>" required>
                </div>
                <div class="form-group">
                    <label for="idCategoria">ID Categoría:</label>
                    <input type="number" id="idCategoria" name="idCategoria" value="<%= libro.getIdCategoria() %>" required>
                </div>
                <div class="form-group">
                    <label for="idCondicion">ID Condición:</label>
                    <input type="number" id="idCondicion" name="idCondicion" value="<%= libro.getIdCondicion() %>" required>
                </div>
                <button type="submit" class="btn">Actualizar Libro</button>
            </form>
        <% } else { %>
            <p class="error">No se pudo cargar el libro. Verifique el ISBN.</p>
        <% } %>
 
        <a href="ListarLibro.jsp">Volver a la lista de libros</a>
    </div>
</body>
</html>
