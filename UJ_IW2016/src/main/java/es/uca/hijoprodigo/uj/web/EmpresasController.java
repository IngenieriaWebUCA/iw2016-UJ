package es.uca.hijoprodigo.uj.web;
import es.uca.hijoprodigo.uj.dominio.Empresas;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/empresases")
@Controller
@RooWebScaffold(path = "empresases", formBackingObject = Empresas.class)
public class EmpresasController {
}
