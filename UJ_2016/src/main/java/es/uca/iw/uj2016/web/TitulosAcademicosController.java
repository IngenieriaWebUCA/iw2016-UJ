package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.TitulosAcademicos;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/titulosacademicoses")
@Controller
@RooWebScaffold(path = "titulosacademicoses", formBackingObject = TitulosAcademicos.class)
public class TitulosAcademicosController {
}
