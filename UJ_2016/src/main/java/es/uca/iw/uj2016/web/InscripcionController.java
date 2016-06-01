package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.Inscripcion;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/inscripcions")
@Controller
@RooWebScaffold(path = "inscripcions", formBackingObject = Inscripcion.class)
@GvNIXWebJQuery
public class InscripcionController {

	void populateEditForm(Model uiModel, Inscripcion inscripcion) {
        uiModel.addAttribute("inscripcion", inscripcion);
        uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
        uiModel.addAttribute("ofertadetrabajoes", OfertaDeTrabajo.findAllOfertaDeTrabajoes());
        List<Demandante> deman = Demandante.findAllDemandantes();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<deman.size(); i++){
        	us.add(deman.get(i).getIdUsuario());
        }
        uiModel.addAttribute("userperfil", us);
    
    }
}
