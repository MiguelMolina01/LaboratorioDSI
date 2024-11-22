<%@page import="modelo.Usuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Inicio</title>
    <style>
    /* Global styles */
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #e3f2fd, #bbdefb);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* Container styles */
    .container {
        text-align: center;
        padding: 30px 20px;
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        width: 100%;
        max-width: 500px;
        animation: slideIn 0.7s ease-in-out;
    }

    /* Header styles */
    h1 {
        font-size: 2rem;
        color: #007bff;
        margin-bottom: 20px;
        font-weight: bold;
    }

    h2 {
        font-size: 1.5rem;
        color: #333333;
        margin-bottom: 10px;
    }

    p {
        margin: 15px 0;
        font-size: 1rem;
        color: #666666;
    }

    /* Button styles */
    .btn {
        display: block;
        padding: 12px 20px;
        margin: 10px auto;
        background: linear-gradient(135deg, #007bff, #0056b3);
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
        font-size: 1rem;
        transition: transform 0.2s ease, box-shadow 0.3s ease;
        width: 80%;
        max-width: 300px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    }

    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    }

    .btn:active {
        transform: translateY(1px);
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
    }

    /* Responsive styles */
    @media (max-width: 768px) {
        .container {
            padding: 20px;
        }

        h1 {
            font-size: 1.8rem;
        }

        h2 {
            font-size: 1.3rem;
        }

        .btn {
            width: 100%;
        }
    }

    /* Animations */
    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

</head>
<body>
    <div class="container">
        <h1>Bienvenido a la Himalaya</h1>
       
        <%-- Verificar si hay un usuario en sesión --%>
        <%
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null) {
        %>
            <div class="user-info">
                <h2>Hola, <%= usuario.getNombreUsuario() %></h2>
                <p>Rol: <%= usuario.getIdRol() == 1 ? "Administrador" : "Empleado" %></p>
                <a href="dashboard.jsp" class="btn">Ir al Panel de Administración</a>
                <a href="novedades.jsp" class="btn">Ver Novedades</a>
                <a href="LogoutServlet" class="btn">Cerrar Sesión</a>
            </div>
        <%
            } else {
        %>
            <a href="LoginUsuario.jsp" class="btn">Iniciar Sesión</a>
            <a href="RegistrarUsuario.jsp" class="btn">Registrarse</a>
        <%
            }
        %>
    </div>
</body>
</html>