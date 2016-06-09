package es.uca.iw.uj2016.dominio;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "demandante")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "inscripcions", "idPerfil", "idUsuario", "perfils" })
public class Demandante {

    @OneToMany(mappedBy = "idDemandante", cascade = CascadeType.ALL)
    private Set<Inscripcion> inscripcions;

    @OneToMany(mappedBy = "idDemandante", cascade = CascadeType.ALL)
    private Set<Perfil> perfils;

    @ManyToOne
    @JoinColumn(name = "id_usuario", referencedColumnName = "id", nullable = false)
    private Usuario idUsuario;

    @Column(name = "nombre", length = 64)
    @NotNull
    private String nombre;

    @Column(name = "apellidos", length = 128)
    @NotNull
    private String apellidos;

    @Column(name = "dni", length = 16)
    @NotNull
    private String dni;

    @Column(name = "fecha_nacimiento")
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date fechaNacimiento;

    @Column(name = "sexo", length = 16)
    @NotNull
    private String sexo;

    @Column(name = "direccion", length = 128)
    @NotNull
    private String direccion;

    @Column(name = "email", length = 128)
    @NotNull
    private String email;

    @Column(name = "telefono")
    @NotNull
    private Integer telefono;

    public Set<Inscripcion> getInscripcions() {
        return inscripcions;
    }

    public void setInscripcions(Set<Inscripcion> inscripcions) {
        this.inscripcions = inscripcions;
    }

    public Set<Perfil> getPerfils() {
        return perfils;
    }

    public void setPerfils(Set<Perfil> perfils) {
        this.perfils = perfils;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getTelefono() {
        return telefono;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }
}
