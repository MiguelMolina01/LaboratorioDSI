<%
    // Invalidar la sesión para cerrar sesión
    if (session != null) {
        session.invalidate(); // Cerrar sesión
    }
    // Redirigir a la página de inicio de sesión
    response.sendRedirect("LoginUsuario.jsp");
%>

