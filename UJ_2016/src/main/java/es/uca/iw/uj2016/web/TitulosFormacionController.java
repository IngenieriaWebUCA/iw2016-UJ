package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.TitulosFormacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/titulosformacions")
@Controller
@RooWebScaffold(path = "titulosformacions", formBackingObject = TitulosFormacion.class)
public class TitulosFormacionController {
}
