// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Localizacion;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Localizacion_Roo_Jpa_Entity {
    
    declare @type: Localizacion: @Entity;
    
    declare @type: Localizacion: @Table(name = "localizacion");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Localizacion.id;
    
    public Integer Localizacion.getId() {
        return this.id;
    }
    
    public void Localizacion.setId(Integer id) {
        this.id = id;
    }
    
}
