package es.uca.hijoprodigo.uj.dominio;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Empresas {

    /**
     */
    private String nombre_;

    /**
     */
    private String cif_;

    /**
     */
    private String email_;

    /**
     */
    private String actividad_profesional_;

    /**
     */
    private int empleados_;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Localizaciones> localizaciones_ = new HashSet<Localizaciones>();
}
