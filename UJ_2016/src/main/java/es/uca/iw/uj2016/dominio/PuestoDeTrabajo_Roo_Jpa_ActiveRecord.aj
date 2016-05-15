// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PuestoDeTrabajo_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PuestoDeTrabajo.entityManager;
    
    public static final List<String> PuestoDeTrabajo.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager PuestoDeTrabajo.entityManager() {
        EntityManager em = new PuestoDeTrabajo().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PuestoDeTrabajo.countPuestoDeTrabajoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PuestoDeTrabajo o", Long.class).getSingleResult();
    }
    
    public static List<PuestoDeTrabajo> PuestoDeTrabajo.findAllPuestoDeTrabajoes() {
        return entityManager().createQuery("SELECT o FROM PuestoDeTrabajo o", PuestoDeTrabajo.class).getResultList();
    }
    
    public static List<PuestoDeTrabajo> PuestoDeTrabajo.findAllPuestoDeTrabajoes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PuestoDeTrabajo o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PuestoDeTrabajo.class).getResultList();
    }
    
    public static PuestoDeTrabajo PuestoDeTrabajo.findPuestoDeTrabajo(Integer id) {
        if (id == null) return null;
        return entityManager().find(PuestoDeTrabajo.class, id);
    }
    
    public static List<PuestoDeTrabajo> PuestoDeTrabajo.findPuestoDeTrabajoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PuestoDeTrabajo o", PuestoDeTrabajo.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PuestoDeTrabajo> PuestoDeTrabajo.findPuestoDeTrabajoEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PuestoDeTrabajo o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PuestoDeTrabajo.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PuestoDeTrabajo.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PuestoDeTrabajo.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PuestoDeTrabajo attached = PuestoDeTrabajo.findPuestoDeTrabajo(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PuestoDeTrabajo.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PuestoDeTrabajo.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PuestoDeTrabajo PuestoDeTrabajo.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PuestoDeTrabajo merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
