<%@ page import="modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null || usuario.getIdRol() != 1) { 
        response.sendRedirect("LoginUsuario.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #e3f2fd, #bbdefb);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: #424242;
        }

        /* Header Styles */
        header {
            background: #0d47a1;
            color: #fff;
            text-align: center;
            padding: 20px 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 10;
        }
        header h1 {
            margin: 0;
            font-size: 2.5rem;
            letter-spacing: 1px;
        }
        header p {
            margin: 5px 0 0;
            font-size: 1rem;
            opacity: 0.9;
        }

        /* Navigation Styles */
        nav {
            margin: 30px auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 0 10px;
        }
        nav a {
            text-decoration: none;
            color: #fff;
            background: #1976d2;
            padding: 15px 25px;
            border-radius: 8px;
            font-weight: 500;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }
        nav a:hover {
            background: #0d47a1;
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.25);
        }

        /* Footer Styles */
        footer {
            margin-top: auto;
            background: #263238;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            font-size: 0.9rem;
            box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2);
        }
        footer p {
            margin: 0;
        }

        /* Card Style (if needed for future use) */
        .card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }
            nav a {
                padding: 12px 20px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Bienvenido al Panel de Administración</h1>
        <p>Gestión eficiente para administradores</p>
    </header>
   
    <nav>
        <a href="ListarEmpleados.jsp">Gestionar Empleados</a>
        <a href="ListarUsuario.jsp">Gestionar Usuarios</a>
        <a href="ListarLibro.jsp">Gestionar Libros</a>
        <a href="logout.jsp">Cerrar Sesión</a>
    </nav>
   
    <footer>
        <p>&copy; 2024 Biblioteca. Todos los derechos reservados.</p>
    </footer>
</body>
</html>