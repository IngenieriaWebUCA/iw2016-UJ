// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.OfertaTrabajoTitulos;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect OfertaTrabajoTitulos_Roo_Jpa_Entity {
    
    declare @type: OfertaTrabajoTitulos: @Entity;
    
    declare @type: OfertaTrabajoTitulos: @Table(name = "oferta_trabajo_titulos");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer OfertaTrabajoTitulos.id;
    
    public Integer OfertaTrabajoTitulos.getId() {
        return this.id;
    }
    
    public void OfertaTrabajoTitulos.setId(Integer id) {
        this.id = id;
    }
    
}