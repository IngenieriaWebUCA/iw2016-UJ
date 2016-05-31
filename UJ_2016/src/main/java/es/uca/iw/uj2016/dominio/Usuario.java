package es.uca.iw.uj2016.dominio;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "usuario")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "demandantes", "empresas", "idRolUsuario" })
public class Usuario {

    @OneToMany(mappedBy = "idUsuario", cascade = CascadeType.ALL)
    private Set<Demandante> demandantes;

    @OneToMany(mappedBy = "idUsuario", cascade = CascadeType.ALL)
    private Set<Empresa> empresas;

    @ManyToOne
    @JoinColumn(name = "id_rol_usuario", referencedColumnName = "id", nullable = false)
    private RolUsuario idRolUsuario;

    @Column(name = "nombre", length = 32, unique = true)
    @NotNull
    private String nombre;

    @Column(name = "password", length = 128)
    @NotNull
    private String password;

    public Set<Demandante> getDemandantes() {
        return demandantes;
    }

    public void setDemandantes(Set<Demandante> demandantes) {
        this.demandantes = demandantes;
    }

    public Set<Empresa> getEmpresas() {
        return empresas;
    }

    public void setEmpresas(Set<Empresa> empresas) {
        this.empresas = empresas;
    }

    public RolUsuario getIdRolUsuario() {
        return idRolUsuario;
    }

    public void setIdRolUsuario(RolUsuario idRolUsuario) {
        this.idRolUsuario = idRolUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(password);
        this.password = encodedPassword;
    }
}
