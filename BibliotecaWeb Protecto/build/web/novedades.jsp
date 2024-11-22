<%@ page import="modelo.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("LoginUsuario.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Novedades</title>
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
 
        /* Section Styles */
        section {
            padding: 20px;
            margin: 20px auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 800px;
            flex-grow: 1;
        }
 
        section h2 {
            font-size: 1.8rem;
            color: #007bff;
            margin-bottom: 10px;
        }
 
        section p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 20px;
        }
 
        section ul {
            list-style: none;
            padding: 0;
        }
 
        section ul li {
            margin-bottom: 15px;
            font-size: 1rem;
            color: #333;
        }
 
        section ul li strong {
            color: #007bff;
        }
 
        /* Footer Styles */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 0.9rem;
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1);
        }
 
        footer p {
            margin: 0;
        }
 
        /* Responsive Design */
        @media (max-width: 768px) {
            section {
                width: 95%;
            }
 
            .logout-btn {
                top: 10px;
                right: 10px;
                padding: 8px 12px;
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Bienvenido a la sección de Novedades</h1>
        <p>Explora las últimas actualizaciones y noticias.</p>
        <a href="logout.jsp" class="logout-btn">Cerrar Sesión</a>
    </header>
 
    <!-- Dynamic content or list of news -->
    <section>
        <h2>Últimas Novedades</h2>
        <p>¡Mantente al día con nuestras últimas actualizaciones y eventos!</p>
        <ul>
            <li><strong>Nuevo sistema de gestión</strong>: ¡Ahora puedes gestionar usuarios y empleados con mayor facilidad!</li>
            <li><strong>Actualización de seguridad</strong>: Se han implementado mejoras para proteger tus datos.</li>
            <li><strong>Nuevo diseño</strong>: Se ha actualizado la interfaz para ofrecerte una mejor experiencia de usuario.</li>
        </ul>
    </section>
 
    <footer>
        <p>&copy; 2024 Biblioteca. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
