<%@ page import="controladores.LibroControlador, modelo.Libro" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String mensaje = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            String isbn = request.getParameter("isbn");
            String titulo = request.getParameter("titulo");
            String fechaPublicacionStr = request.getParameter("fechaPublicacion");
            Integer idEditorial = Integer.parseInt(request.getParameter("idEditorial"));
            Integer idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
            Integer idCondicion = Integer.parseInt(request.getParameter("idCondicion"));
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date fechaPublicacion = sdf.parse(fechaPublicacionStr);

            Libro nuevoLibro = new Libro(isbn, titulo, fechaPublicacion, idEditorial, idCategoria, idCondicion);
            LibroControlador controladores = new LibroControlador();
            controladores.agregarLibro(nuevoLibro);
            mensaje = "Libro agregado exitosamente.";
        } catch (Exception e) {
            mensaje = "Error al agregar el libro: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agregar Nuevo Libro</title>
<style>

        body {

            font-family: Arial, sans-serif;

            background: linear-gradient(135deg, #007bff, #0056b3);

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

            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);

            padding: 30px;

            width: 100%;

            max-width: 400px;

            text-align: center;

        }
 
        h1 {

            font-size: 1.8rem;

            margin-bottom: 20px;

            color: #007bff;

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

            transition: border-color 0.3s ease;

        }
 
        input:focus {

            border-color: #007bff;

            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);

        }
 
        .btn {

            width: 100%;

            padding: 12px;

            border: none;

            border-radius: 5px;

            background: #007bff;

            color: white;

            font-size: 1rem;

            font-weight: bold;

            cursor: pointer;

            transition: background 0.3s ease, transform 0.2s ease;

        }
 
        .btn:hover {

            background: #0056b3;

            transform: scale(1.05);

        }
 
        a {

            color: #007bff;

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
<h1>Agregar Nuevo Libro</h1>
 
        <!-- Mostrar mensaje dinámico -->
<% if (request.getAttribute("mensaje") != null) { %>
<p class="<%= request.getAttribute("mensaje").toString().contains("Error") ? "error" : "success" %>">
<%= request.getAttribute("mensaje") %>
</p>
<% } %>
 
        <form method="POST" action="AgregarLibro.jsp">
<div class="form-group">
<label for="isbn">ISBN:</label>
<input type="text" id="isbn" name="isbn" placeholder="Ingrese el ISBN" required>
</div>
<div class="form-group">
<label for="titulo">Título:</label>
<input type="text" id="titulo" name="titulo" placeholder="Ingrese el título" required>
</div>
<div class="form-group">
<label for="fechaPublicacion">Fecha de Publicación:</label>
<input type="date" id="fechaPublicacion" name="fechaPublicacion" required>
</div>
<div class="form-group">
<label for="idEditorial">ID Editorial:</label>
<input type="number" id="idEditorial" name="idEditorial" placeholder="Ingrese el ID de la editorial" required>
</div>
<div class="form-group">
<label for="idCategoria">ID Categoría:</label>
<input type="number" id="idCategoria" name="idCategoria" placeholder="Ingrese el ID de la categoría" required>
</div>
<div class="form-group">
<label for="idCondicion">ID Condición:</label>
<input type="number" id="idCondicion" name="idCondicion" placeholder="Ingrese el ID de la condición" required>
</div>
<button type="submit" class="btn">Agregar Libro</button>
</form>
 
        <a href="ListarLibro.jsp">Ver Lista de Libros</a>
</div>
</body>
</html>
