<%
    // Invalidar la sesi�n para cerrar sesi�n
    if (session != null) {
        session.invalidate(); // Cerrar sesi�n
    }
    // Redirigir a la p�gina de inicio de sesi�n
    response.sendRedirect("LoginUsuario.jsp");
%>

