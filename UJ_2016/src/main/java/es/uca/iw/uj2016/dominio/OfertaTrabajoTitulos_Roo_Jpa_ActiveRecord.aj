// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.OfertaTrabajoTitulos;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OfertaTrabajoTitulos_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager OfertaTrabajoTitulos.entityManager;
    
    public static final List<String> OfertaTrabajoTitulos.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager OfertaTrabajoTitulos.entityManager() {
        EntityManager em = new OfertaTrabajoTitulos().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long OfertaTrabajoTitulos.countOfertaTrabajoTituloses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM OfertaTrabajoTitulos o", Long.class).getSingleResult();
    }
    
    public static List<OfertaTrabajoTitulos> OfertaTrabajoTitulos.findAllOfertaTrabajoTituloses() {
        return entityManager().createQuery("SELECT o FROM OfertaTrabajoTitulos o", OfertaTrabajoTitulos.class).getResultList();
    }
    
    public static List<OfertaTrabajoTitulos> OfertaTrabajoTitulos.findAllOfertaTrabajoTituloses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM OfertaTrabajoTitulos o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, OfertaTrabajoTitulos.class).getResultList();
    }
    
    public static OfertaTrabajoTitulos OfertaTrabajoTitulos.findOfertaTrabajoTitulos(Integer id) {
        if (id == null) return null;
        return entityManager().find(OfertaTrabajoTitulos.class, id);
    }
    
    public static List<OfertaTrabajoTitulos> OfertaTrabajoTitulos.findOfertaTrabajoTitulosEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM OfertaTrabajoTitulos o", OfertaTrabajoTitulos.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<OfertaTrabajoTitulos> OfertaTrabajoTitulos.findOfertaTrabajoTitulosEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM OfertaTrabajoTitulos o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, OfertaTrabajoTitulos.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void OfertaTrabajoTitulos.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void OfertaTrabajoTitulos.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            OfertaTrabajoTitulos attached = OfertaTrabajoTitulos.findOfertaTrabajoTitulos(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void OfertaTrabajoTitulos.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void OfertaTrabajoTitulos.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public OfertaTrabajoTitulos OfertaTrabajoTitulos.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        OfertaTrabajoTitulos merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}