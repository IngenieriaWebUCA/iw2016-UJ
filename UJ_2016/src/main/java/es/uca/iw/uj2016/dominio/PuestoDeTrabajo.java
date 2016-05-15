package es.uca.iw.uj2016.dominio;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "puesto_de_trabajo")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "experienciaProfesionals", "ofertaDeTrabajoes", "puestoTrabajoPerfils" })
public class PuestoDeTrabajo {
}
