// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.FormacionAcademica;
import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.TitulosFormacion;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

privileged aspect FormacionAcademica_Roo_DbManaged {
    
    @OneToMany(mappedBy = "idFormacionAcademica", cascade = CascadeType.ALL)
    private Set<TitulosFormacion> FormacionAcademica.titulosFormacions;
    
    @ManyToOne
    @JoinColumn(name = "id_perfil", referencedColumnName = "id", nullable = false)
    private Perfil FormacionAcademica.idPerfil;
    
    @Column(name = "curso")
    @NotNull
    private String FormacionAcademica.curso;
    
    @Column(name = "idioma")
    @NotNull
    private String FormacionAcademica.idioma;
    
    public Set<TitulosFormacion> FormacionAcademica.getTitulosFormacions() {
        return titulosFormacions;
    }
    
    public void FormacionAcademica.setTitulosFormacions(Set<TitulosFormacion> titulosFormacions) {
        this.titulosFormacions = titulosFormacions;
    }
    
    public Perfil FormacionAcademica.getIdPerfil() {
        return idPerfil;
    }
    
    public void FormacionAcademica.setIdPerfil(Perfil idPerfil) {
        this.idPerfil = idPerfil;
    }
    
    public String FormacionAcademica.getCurso() {
        return curso;
    }
    
    public void FormacionAcademica.setCurso(String curso) {
        this.curso = curso;
    }
    
    public String FormacionAcademica.getIdioma() {
        return idioma;
    }
    
    public void FormacionAcademica.setIdioma(String idioma) {
        this.idioma = idioma;
    }
    
}
