// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect PuestoDeTrabajo_Roo_Jpa_Entity {
    
    declare @type: PuestoDeTrabajo: @Entity;
    
    declare @type: PuestoDeTrabajo: @Table(name = "puesto_de_trabajo");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer PuestoDeTrabajo.id;
    
    public Integer PuestoDeTrabajo.getId() {
        return this.id;
    }
    
    public void PuestoDeTrabajo.setId(Integer id) {
        this.id = id;
    }
    
}
