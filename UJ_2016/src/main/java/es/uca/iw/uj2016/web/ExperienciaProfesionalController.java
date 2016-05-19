package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.ExperienciaProfesional;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/experienciaprofesionals")
@Controller
@RooWebScaffold(path = "experienciaprofesionals", formBackingObject = ExperienciaProfesional.class)
public class ExperienciaProfesionalController {
}
