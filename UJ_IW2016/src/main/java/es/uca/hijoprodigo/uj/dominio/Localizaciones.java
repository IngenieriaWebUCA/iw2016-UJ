package es.uca.hijoprodigo.uj.dominio;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Localizaciones {

    /**
     */
    private String direccion_;

    /**
     */
    private String poblacion_;
}
