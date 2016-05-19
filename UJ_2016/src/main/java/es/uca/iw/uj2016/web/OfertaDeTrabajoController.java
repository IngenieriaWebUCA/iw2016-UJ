package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ofertadetrabajoes")
@Controller
@RooWebScaffold(path = "ofertadetrabajoes", formBackingObject = OfertaDeTrabajo.class)
public class OfertaDeTrabajoController {
}
