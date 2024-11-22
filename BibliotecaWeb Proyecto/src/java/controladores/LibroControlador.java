package controladores;

import modelo.Libro;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utilidades.DBConnectionMYSQL;

public class LibroControlador {

    // Método para obtener todos los libros
    public List<Libro> listarLibros() throws Exception {
        List<Libro> libros = new ArrayList<>();
        String sql = "SELECT * FROM libros"; // Ajusta el nombre de la tabla según tu esquema

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Libro libro = new Libro();
                libro.setIsbn(rs.getString("isbn"));
                libro.setTitulo(rs.getString("titulo"));
                libro.setFechaPublicacion(rs.getDate("fechaPublicacion"));
                libro.setIdEditorial(rs.getInt("idEditorial"));
                libro.setIdCategoria(rs.getInt("idCategoria"));
                libro.setIdCondicion(rs.getInt("idCondicion"));
                libros.add(libro);
            }
        } catch (SQLException e) {
            throw new Exception("Error al listar libros: " + e.getMessage());
        }
        return libros;
    }

    // Método para obtener un libro por su ISBN
    public Libro obtenerLibroPorIsbn(String isbn) throws Exception {
        String sql = "SELECT * FROM libros WHERE isbn = ?";
        Libro libro = null;

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, isbn);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    libro = new Libro();
                    libro.setIsbn(rs.getString("isbn"));
                    libro.setTitulo(rs.getString("titulo"));
                    libro.setFechaPublicacion(rs.getDate("fechaPublicacion"));
                    libro.setIdEditorial(rs.getInt("idEditorial"));
                    libro.setIdCategoria(rs.getInt("idCategoria"));
                    libro.setIdCondicion(rs.getInt("idCondicion"));
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error al obtener el libro por ISBN: " + e.getMessage());
        }
        return libro;
    }

    // Método para agregar un nuevo libro
    public void agregarLibro(Libro libro) throws Exception {
        String sql = "INSERT INTO libros (isbn, titulo, fechaPublicacion, idEditorial, idCategoria, idCondicion) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, libro.getIsbn());
            stmt.setString(2, libro.getTitulo());
            stmt.setDate(3, new java.sql.Date(libro.getFechaPublicacion().getTime()));
            stmt.setInt(4, libro.getIdEditorial());
            stmt.setInt(5, libro.getIdCategoria());
            stmt.setInt(6, libro.getIdCondicion());

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al agregar el libro: " + e.getMessage());
        }
    }

    // Método para actualizar un libro
    public void actualizarLibro(Libro libro) throws Exception {
        String sql = "UPDATE libros SET titulo = ?, fechaPublicacion = ?, idEditorial = ?, idCategoria = ?, idCondicion = ? WHERE isbn = ?";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, libro.getTitulo());
            stmt.setDate(2, new java.sql.Date(libro.getFechaPublicacion().getTime()));
            stmt.setInt(3, libro.getIdEditorial());
            stmt.setInt(4, libro.getIdCategoria());
            stmt.setInt(5, libro.getIdCondicion());
            stmt.setString(6, libro.getIsbn());

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al actualizar el libro: " + e.getMessage());
        }
    }

    // Método para eliminar un libro por su ISBN
    public void eliminarLibro(String isbn) throws Exception {
        String sql = "DELETE FROM libros WHERE isbn = ?";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, isbn);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al eliminar el libro: " + e.getMessage());
        }
    }
    
}
