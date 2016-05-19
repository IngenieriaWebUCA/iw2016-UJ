package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.TitulosFormacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/titulosformacions")
@Controller
@RooWebScaffold(path = "titulosformacions", formBackingObject = TitulosFormacion.class)
@GvNIXWebJQuery
public class TitulosFormacionController {
}
