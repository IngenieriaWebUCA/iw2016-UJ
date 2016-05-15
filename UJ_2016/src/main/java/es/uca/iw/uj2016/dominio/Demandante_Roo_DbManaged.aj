// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.Inscripcion;
import es.uca.iw.uj2016.dominio.Perfil;
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

privileged aspect Demandante_Roo_DbManaged {
    
    @OneToMany(mappedBy = "idDemandante", cascade = CascadeType.ALL)
    private Set<Inscripcion> Demandante.inscripcions;
    
    @ManyToOne
    @JoinColumn(name = "id_perfil", referencedColumnName = "id", nullable = false)
    private Perfil Demandante.idPerfil;
    
    @Column(name = "nombre", length = 64)
    @NotNull
    private String Demandante.nombre;
    
    @Column(name = "apellidos", length = 128)
    @NotNull
    private String Demandante.apellidos;
    
    @Column(name = "dni", length = 16)
    @NotNull
    private String Demandante.dni;
    
    @Column(name = "fecha_nacimiento")
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date Demandante.fechaNacimiento;
    
    @Column(name = "sexo", length = 16)
    @NotNull
    private String Demandante.sexo;
    
    @Column(name = "direccion", length = 128)
    @NotNull
    private String Demandante.direccion;
    
    @Column(name = "email", length = 128)
    @NotNull
    private String Demandante.email;
    
    @Column(name = "telefono")
    @NotNull
    private Integer Demandante.telefono;
    
    public Set<Inscripcion> Demandante.getInscripcions() {
        return inscripcions;
    }
    
    public void Demandante.setInscripcions(Set<Inscripcion> inscripcions) {
        this.inscripcions = inscripcions;
    }
    
    public Perfil Demandante.getIdPerfil() {
        return idPerfil;
    }
    
    public void Demandante.setIdPerfil(Perfil idPerfil) {
        this.idPerfil = idPerfil;
    }
    
    public String Demandante.getNombre() {
        return nombre;
    }
    
    public void Demandante.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Demandante.getApellidos() {
        return apellidos;
    }
    
    public void Demandante.setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    public String Demandante.getDni() {
        return dni;
    }
    
    public void Demandante.setDni(String dni) {
        this.dni = dni;
    }
    
    public Date Demandante.getFechaNacimiento() {
        return fechaNacimiento;
    }
    
    public void Demandante.setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    
    public String Demandante.getSexo() {
        return sexo;
    }
    
    public void Demandante.setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    public String Demandante.getDireccion() {
        return direccion;
    }
    
    public void Demandante.setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String Demandante.getEmail() {
        return email;
    }
    
    public void Demandante.setEmail(String email) {
        this.email = email;
    }
    
    public Integer Demandante.getTelefono() {
        return telefono;
    }
    
    public void Demandante.setTelefono(Integer telefono) {
        this.telefono = telefono;
    }
    
}
