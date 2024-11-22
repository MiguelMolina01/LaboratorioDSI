<%@ page import="controladores.LibroControlador" %>
<%@ page import="modelo.Libro" %>
<%
    String mensaje = "";
    String isbn = request.getParameter("isbn");

    if (isbn != null && !isbn.isEmpty()) {
        try {
            LibroControlador controladores = new LibroControlador();
            controladores.eliminarLibro(isbn);
            mensaje = "Libro eliminado exitosamente.";
        } catch (Exception e) {
            mensaje = "Error al eliminar el libro: " + e.getMessage();
        }
    } else {
        mensaje = "ISBN no válido.";
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Eliminar Libro</title>
<style>

        body {

            font-family: Arial, sans-serif;

            background: linear-gradient(135deg, #ff416c, #ff4b2b);

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

            max-width: 400px;

            text-align: center;

            color: #333;

        }
 
        h1 {

            font-size: 1.8rem;

            margin-bottom: 20px;

            color: #ff416c;

        }
 
        p {

            font-size: 1rem;

            margin-bottom: 20px;

        }
 
        .btn {

            display: inline-block;

            width: 100%;

            padding: 12px;

            border: none;

            border-radius: 5px;

            background: #ff416c;

            color: white;

            font-size: 1rem;

            font-weight: bold;

            cursor: pointer;

            transition: background 0.3s ease, transform 0.2s ease;

            margin-top: 10px;

            text-decoration: none;

        }
 
        .btn:hover {

            background: #ff4b2b;

            transform: scale(1.05);

        }
 
        a {

            color: #ff416c;

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
<h1>Eliminar Libro</h1>
 
        <!-- Mostrar mensaje dinámico -->
<% if (request.getAttribute("mensaje") != null) { %>
<p class="<%= request.getAttribute("mensaje").toString().contains("Error") ? "error" : "success" %>">
<%= request.getAttribute("mensaje") %>
</p>
<% } else { %>
<p>¿Está seguro de que desea eliminar este libro?</p>
<form method="POST" action="EliminarLibro.jsp">
<input type="hidden" name="isbn" value="<%= request.getParameter("isbn") %>">
<button type="submit" class="btn">Confirmar Eliminación</button>
</form>
<% } %>
 
        <a href="ListarLibro.jsp" class="btn">Volver a la lista de libros</a>
</div>
</body>
</html>

 