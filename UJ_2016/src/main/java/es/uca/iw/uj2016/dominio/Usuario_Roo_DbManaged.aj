// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

privileged aspect Usuario_Roo_DbManaged {
    
    @OneToMany(mappedBy = "idUsuario", cascade = CascadeType.ALL)
    private Set<Demandante> Usuario.demandantes;
    
    @OneToMany(mappedBy = "idUsuario", cascade = CascadeType.ALL)
    private Set<Empresa> Usuario.empresas;
    
    @Column(name = "nombre", length = 32, unique = true)
    @NotNull
    private String Usuario.nombre;
    
    @Column(name = "tipo")
    @NotNull
    private Integer Usuario.tipo;
    
    @Column(name = "password", length = 32)
    @NotNull
    private String Usuario.password;
    
    public Set<Demandante> Usuario.getDemandantes() {
        return demandantes;
    }
    
    public void Usuario.setDemandantes(Set<Demandante> demandantes) {
        this.demandantes = demandantes;
    }
    
    public Set<Empresa> Usuario.getEmpresas() {
        return empresas;
    }
    
    public void Usuario.setEmpresas(Set<Empresa> empresas) {
        this.empresas = empresas;
    }
    
    public String Usuario.getNombre() {
        return nombre;
    }
    
    public void Usuario.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public Integer Usuario.getTipo() {
        return tipo;
    }
    
    public void Usuario.setTipo(Integer tipo) {
        this.tipo = tipo;
    }
    
    public String Usuario.getPassword() {
        return password;
    }
    
    public void Usuario.setPassword(String password) {
        this.password = password;
    }
    
}
