package utilidades;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Usuario;

import java.io.IOException;

public class FiltroRol implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        // Obtener el usuario de la sesión
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        // Obtener la URL solicitada
        String url = request.getRequestURI();

        // Excluir ciertas URLs (por ejemplo, login, css, js)
        if (url.contains("LoginUsuario.jsp") || url.contains("/css/") || url.contains("/js/")) {
            chain.doFilter(req, res);
            return;
        }

        // Si la URL es de administración (comienza con /admin/), verificar si el usuario tiene el rol adecuado
        if (url.contains("/admin/")) {
            if (usuario == null) {
                // Redirigir a login si no está autenticado
                response.sendRedirect(request.getContextPath() + "/LoginUsuario.jsp?mensaje=Debe%20iniciar%20sesión%20primero");
                return;
            } else if (usuario.getIdRol() != 1) { // 1 es el rol de administrador
                // Redirigir si no tiene rol de administrador
                response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp?mensaje=Acceso%20denegado");
                return;
            }
        }

        // Continuar con la cadena de filtros
        try {
            chain.doFilter(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
