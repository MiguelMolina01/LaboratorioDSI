<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Página de error de acceso denegado. No tienes permisos para acceder a esta página.">
    <title>Acceso Denegado</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            background: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px 40px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #dc3545;
            font-size: 2rem;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.1rem;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            text-decoration: none;
            color: #ffffff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }

        /* Estilo responsivo */
        @media (max-width: 600px) {
            .container {
                padding: 15px 30px;
            }
            h1 {
                font-size: 1.5rem;
            }
            p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Acceso Denegado</h1>
        <p>No tienes permisos para acceder a esta página.</p>
        <a href="index.jsp">Volver a la página de inicio</a>
    </div>
</body>
</html>