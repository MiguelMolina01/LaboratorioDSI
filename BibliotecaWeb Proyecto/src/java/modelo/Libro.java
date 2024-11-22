package modelo;
 
import java.util.Date;
 
public class Libro {

    private String isbn;
    private String titulo;
    private Date fechaPublicacion;
    private Integer idEditorial;
    private Integer idCategoria;
    private Integer idCondicion;
 
    // Constructor vacío

    public Libro() {

    }
 
    // Constructor con parámetros

    public Libro(String isbn, String titulo, Date fechaPublicacion, Integer idEditorial, Integer idCategoria, Integer idCondicion) {

        this.isbn = isbn;
        this.titulo = titulo;
        this.fechaPublicacion = fechaPublicacion;
        this.idEditorial = idEditorial;
        this.idCategoria = idCategoria;
        this.idCondicion = idCondicion;
    }
 
    // Getters y Setters
    public String getIsbn() {
        return isbn;
    }
 
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
 
    public String getTitulo() {
        return titulo;
    }
 
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
 
    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }
 
    public void setFechaPublicacion(Date fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }
 
    public Integer getIdEditorial() {
        return idEditorial;
    }
 
    public void setIdEditorial(Integer idEditorial) {
        this.idEditorial = idEditorial;
    }
 
    public Integer getIdCategoria() {
        return idCategoria;
    }
 
    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }
 
    public Integer getIdCondicion() {
        return idCondicion;
    }
 
    public void setIdCondicion(Integer idCondicion) {
        this.idCondicion = idCondicion;
    }
 }
