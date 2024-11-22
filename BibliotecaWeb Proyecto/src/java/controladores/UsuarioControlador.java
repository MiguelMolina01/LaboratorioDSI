package controladores;

import modelo.Usuario;
import utilidades.DBConnectionMYSQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioControlador {
    public List<Usuario> listarUsuarios() throws Exception {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setIdRol(rs.getInt("idRol"));
                usuario.setIdEmpleado(rs.getInt("idEmpleado"));

                // Obtener el nombre del rol y del empleado
                usuario.setNombreRol(obtenerNombreRol(usuario.getIdRol()));
                usuario.setNombreEmpleado(obtenerNombreEmpleado(usuario.getIdEmpleado()));

                usuarios.add(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar los usuarios: " + ex.getMessage());
        }

        return usuarios;
    }


    public void agregarUsuario(Usuario usuario) throws Exception {
        String sql = "INSERT INTO usuarios (nombreUsuario, contrasena, idRol, idEmpleado) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, usuario.getNombreUsuario());
            stmt.setString(2, usuario.getContrasena());
            stmt.setInt(3, usuario.getIdRol());
            stmt.setInt(4, usuario.getIdEmpleado());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error adding user: " + e.getMessage());
            throw e;
        }
    }

    public void editarUsuario(Usuario usuario) throws Exception {
        String sql = "UPDATE usuarios SET nombreUsuario = ?, contrasena = ?, idRol = ?, idEmpleado = ? WHERE idUsuario = ?";
        
        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, usuario.getNombreUsuario());
            stmt.setString(2, usuario.getContrasena());
            stmt.setInt(3, usuario.getIdRol());
            stmt.setInt(4, usuario.getIdEmpleado());
            stmt.setInt(5, usuario.getIdUsuario());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error editing user: " + e.getMessage());
            throw e;
        }
    }

    public void eliminarUsuario(int idUsuario) throws Exception {
        String sql = "DELETE FROM usuarios WHERE idUsuario = ?";
        
        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, idUsuario);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting user: " + e.getMessage());
            throw e;
        }
    }
    
    public Usuario obtenerUsuarioPorId(int idUsuario) throws Exception {
        String sql = "SELECT * FROM usuarios WHERE idUsuario = ?";
        Usuario usuario = null;

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
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
        } catch (SQLException ex) {
            System.out.println("Error al obtener usuario por ID: " + ex.getMessage());
        }

        return usuario;
    }
    
    public String obtenerNombreRol(int idRol) throws Exception {
        String sql = "SELECT nombre FROM roles WHERE idRol = ?";
        String nombreRol = null;

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idRol);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nombreRol = rs.getString("nombre");
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener el nombre del rol: " + ex.getMessage());
        }

        return nombreRol;
    }

    public String obtenerNombreEmpleado(int idEmpleado) throws Exception {
        String sql = "SELECT nombre FROM empleados WHERE idEmpleado = ?";
        String nombreEmpleado = null;

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEmpleado);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nombreEmpleado = rs.getString("nombre");
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener el nombre del empleado: " + ex.getMessage());
        }

        return nombreEmpleado;
    }  
}
