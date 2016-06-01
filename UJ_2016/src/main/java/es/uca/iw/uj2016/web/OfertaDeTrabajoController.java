package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.Estado;
import es.uca.iw.uj2016.dominio.Inscripcion;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import es.uca.iw.uj2016.dominio.OfertaTrabajoTitulos;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/ofertadetrabajoes")
@Controller
@RooWebScaffold(path = "ofertadetrabajoes", formBackingObject = OfertaDeTrabajo.class)
@GvNIXWebJQuery
public class OfertaDeTrabajoController {

	void populateEditForm(Model uiModel, OfertaDeTrabajo ofertaDeTrabajo) {
        uiModel.addAttribute("ofertaDeTrabajo", ofertaDeTrabajo);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        uiModel.addAttribute("estadoes", Estado.findAllEstadoes());
        uiModel.addAttribute("inscripcions", Inscripcion.findAllInscripcions());
        uiModel.addAttribute("ofertatrabajotituloses", OfertaTrabajoTitulos.findAllOfertaTrabajoTituloses());
        uiModel.addAttribute("puestodetrabajoes", PuestoDeTrabajo.findAllPuestoDeTrabajoes());
        List<Empresa> empres = Empresa.findAllEmpresas();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<empres.size(); i++){
        	us.add(empres.get(i).getIdUsuario());
        }
        uiModel.addAttribute("userempresa", us);
    }
}
