// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.Inscripcion;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

privileged aspect Inscripcion_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "id_oferta_de_trabajo", referencedColumnName = "id", nullable = false)
    private OfertaDeTrabajo Inscripcion.idOfertaDeTrabajo;
    
    @ManyToOne
    @JoinColumn(name = "id_demandante", referencedColumnName = "id", nullable = false)
    private Demandante Inscripcion.idDemandante;
    
    @Column(name = "nombre", length = 32)
    @NotNull
    private String Inscripcion.nombre;
    
    public OfertaDeTrabajo Inscripcion.getIdOfertaDeTrabajo() {
        return idOfertaDeTrabajo;
    }
    
    public void Inscripcion.setIdOfertaDeTrabajo(OfertaDeTrabajo idOfertaDeTrabajo) {
        this.idOfertaDeTrabajo = idOfertaDeTrabajo;
    }
    
    public Demandante Inscripcion.getIdDemandante() {
        return idDemandante;
    }
    
    public void Inscripcion.setIdDemandante(Demandante idDemandante) {
        this.idDemandante = idDemandante;
    }
    
    public String Inscripcion.getNombre() {
        return nombre;
    }
    
    public void Inscripcion.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
