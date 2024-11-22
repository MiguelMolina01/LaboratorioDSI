package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionMYSQL {

    private static final String DATABASE_NAME = "db_biblioteca";
    private static final String URL = "jdbc:mysql://localhost:3306/" + DATABASE_NAME + "?useSSL=false";
    private static final String USER = "juanperez";
    private static final String PASSWORD = "pass1234";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Cargar el driver JDBC de MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establecer y retornar la conexión
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main(String[] args) {
        try (Connection conexion = getConnection()) {
            if (conexion != null) {
                System.out.println("Conexión exitosa a la base de datos: " + DATABASE_NAME + ".");
            }
        } catch (SQLException e) {
            System.out.println("Error de SQL: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Error de Clase no encontrada: " + e.getMessage());
        }
    }
}
