// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Estado;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

privileged aspect Estado_Roo_DbManaged {
    
    @OneToMany(mappedBy = "idEstado", cascade = CascadeType.ALL)
    private Set<OfertaDeTrabajo> Estado.ofertaDeTrabajoes;
    
    @Column(name = "nombre", length = 32)
    @NotNull
    private String Estado.nombre;
    
    public Set<OfertaDeTrabajo> Estado.getOfertaDeTrabajoes() {
        return ofertaDeTrabajoes;
    }
    
    public void Estado.setOfertaDeTrabajoes(Set<OfertaDeTrabajo> ofertaDeTrabajoes) {
        this.ofertaDeTrabajoes = ofertaDeTrabajoes;
    }
    
    public String Estado.getNombre() {
        return nombre;
    }
    
    public void Estado.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
