package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/puestodetrabajoes")
@Controller
@RooWebScaffold(path = "puestodetrabajoes", formBackingObject = PuestoDeTrabajo.class)
public class PuestoDeTrabajoController {
}
