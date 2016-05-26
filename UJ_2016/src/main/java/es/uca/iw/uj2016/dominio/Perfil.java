package es.uca.iw.uj2016.dominio;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "perfil")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "demandantes", "experienciaProfesionals", "puestoTrabajoPerfils", "idFormacionAcademica", "formacionAcademicas", "idDemandante" })
public class Perfil {
}
