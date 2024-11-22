package controladores;

import modelo.Empleado;
import utilidades.DBConnectionMYSQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmpleadoControlador {

    private static final Logger logger = Logger.getLogger(EmpleadoControlador.class.getName());

    public List<Empleado> listarEmpleados() throws Exception {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT * FROM empleados";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Empleado emp = new Empleado();
                emp.setIdEmpleado(rs.getInt("idEmpleado"));
                emp.setNombre(rs.getString("nombre"));
                emp.setApellido(rs.getString("apellido"));
                emp.setDui(rs.getString("dui"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setCorreo(rs.getString("correo"));
                empleados.add(emp);
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error al listar empleados", ex);
        }

        return empleados;
    }

    public void agregarEmpleado(Empleado emp) throws Exception {
        String sql = "INSERT INTO empleados (nombre, apellido, dui, telefono, correo) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, emp.getNombre());
            stmt.setString(2, emp.getApellido());
            stmt.setString(3, emp.getDui());
            stmt.setString(4, emp.getTelefono());
            stmt.setString(5, emp.getCorreo());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error al agregar empleado", ex);
        }
    }

    public void editarEmpleado(Empleado emp) throws Exception {
        String sql = "UPDATE empleados SET nombre = ?, apellido = ?, dui = ?, telefono = ?, correo = ? WHERE idEmpleado = ?";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, emp.getNombre());
            stmt.setString(2, emp.getApellido());
            stmt.setString(3, emp.getDui());
            stmt.setString(4, emp.getTelefono());
            stmt.setString(5, emp.getCorreo());
            stmt.setInt(6, emp.getIdEmpleado());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error al editar empleado", ex);
        }
    }

    public boolean eliminarEmpleado(int idEmpleado) throws Exception {
        String sql = "DELETE FROM empleados WHERE idEmpleado = ?";

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEmpleado);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error al eliminar empleado", ex);
            return false;
        }
    }

    public Empleado obtenerEmpleadoPorId(int idEmpleado) throws Exception {
        String sql = "SELECT * FROM empleados WHERE idEmpleado = ?";
        Empleado emp = null;

        try (Connection conn = DBConnectionMYSQL.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idEmpleado);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    emp = new Empleado();
                    emp.setIdEmpleado(rs.getInt("idEmpleado"));
                    emp.setNombre(rs.getString("nombre"));
                    emp.setApellido(rs.getString("apellido"));
                    emp.setDui(rs.getString("dui"));
                    emp.setTelefono(rs.getString("telefono"));
                    emp.setCorreo(rs.getString("correo"));
                }
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error al obtener empleado por ID", ex);
        }

        return emp;
    }
}