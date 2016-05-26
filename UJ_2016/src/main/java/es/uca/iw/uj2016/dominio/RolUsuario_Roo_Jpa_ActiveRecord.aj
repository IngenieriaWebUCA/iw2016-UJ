// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.RolUsuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RolUsuario_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager RolUsuario.entityManager;
    
    public static final List<String> RolUsuario.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager RolUsuario.entityManager() {
        EntityManager em = new RolUsuario().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long RolUsuario.countRolUsuarios() {
        return entityManager().createQuery("SELECT COUNT(o) FROM RolUsuario o", Long.class).getSingleResult();
    }
    
    public static List<RolUsuario> RolUsuario.findAllRolUsuarios() {
        return entityManager().createQuery("SELECT o FROM RolUsuario o", RolUsuario.class).getResultList();
    }
    
    public static List<RolUsuario> RolUsuario.findAllRolUsuarios(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM RolUsuario o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, RolUsuario.class).getResultList();
    }
    
    public static RolUsuario RolUsuario.findRolUsuario(Integer id) {
        if (id == null) return null;
        return entityManager().find(RolUsuario.class, id);
    }
    
    public static List<RolUsuario> RolUsuario.findRolUsuarioEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM RolUsuario o", RolUsuario.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<RolUsuario> RolUsuario.findRolUsuarioEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM RolUsuario o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, RolUsuario.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void RolUsuario.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void RolUsuario.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            RolUsuario attached = RolUsuario.findRolUsuario(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void RolUsuario.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void RolUsuario.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public RolUsuario RolUsuario.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        RolUsuario merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}