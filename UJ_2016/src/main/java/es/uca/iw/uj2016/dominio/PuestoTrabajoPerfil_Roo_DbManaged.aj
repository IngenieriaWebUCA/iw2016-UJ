// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import es.uca.iw.uj2016.dominio.PuestoTrabajoPerfil;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

privileged aspect PuestoTrabajoPerfil_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "id_puesto_de_trabajo", referencedColumnName = "id", nullable = false)
    private PuestoDeTrabajo PuestoTrabajoPerfil.idPuestoDeTrabajo;
    
    @ManyToOne
    @JoinColumn(name = "id_perfil", referencedColumnName = "id", nullable = false)
    private Perfil PuestoTrabajoPerfil.idPerfil;
    
    public PuestoDeTrabajo PuestoTrabajoPerfil.getIdPuestoDeTrabajo() {
        return idPuestoDeTrabajo;
    }
    
    public void PuestoTrabajoPerfil.setIdPuestoDeTrabajo(PuestoDeTrabajo idPuestoDeTrabajo) {
        this.idPuestoDeTrabajo = idPuestoDeTrabajo;
    }
    
    public Perfil PuestoTrabajoPerfil.getIdPerfil() {
        return idPerfil;
    }
    
    public void PuestoTrabajoPerfil.setIdPerfil(Perfil idPerfil) {
        this.idPerfil = idPerfil;
    }
    
}
