package servicios;

import modelo.Usuario;
import utilidades.DBConnectionMYSQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginService {
    public Usuario autenticar(String nombreUsuario, String contrasena) throws Exception {
        Usuario usuario = null;
        Connection conn = DBConnectionMYSQL.getConnection();
        String query = "SELECT * FROM usuarios WHERE nombreUsuario = ? AND contrasena = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, nombreUsuario);
            stmt.setString(2, contrasena);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setIdUsuario(rs.getInt("idUsuario"));
                    usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                    usuario.setContrasena(rs.getString("contrasena"));
                    usuario.setIdRol(rs.getInt("idRol"));
                    usuario.setIdEmpleado(rs.getInt("idEmpleado"));
                }
            }
        }
        return usuario;
    }
}
