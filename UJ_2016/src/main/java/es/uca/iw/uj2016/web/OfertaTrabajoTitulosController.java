package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.OfertaTrabajoTitulos;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/ofertatrabajotituloses")
@Controller
@RooWebScaffold(path = "ofertatrabajotituloses", formBackingObject = OfertaTrabajoTitulos.class)
@GvNIXWebJQuery
public class OfertaTrabajoTitulosController {
}
