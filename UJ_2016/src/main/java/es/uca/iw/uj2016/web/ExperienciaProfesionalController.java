package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.ExperienciaProfesional;
import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/experienciaprofesionals")
@Controller
@RooWebScaffold(path = "experienciaprofesionals", formBackingObject = ExperienciaProfesional.class)
@GvNIXWebJQuery
public class ExperienciaProfesionalController {

	void populateEditForm(Model uiModel, ExperienciaProfesional experienciaProfesional) {
        uiModel.addAttribute("experienciaProfesional", experienciaProfesional);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("perfils", Perfil.findAllPerfils());
        uiModel.addAttribute("puestodetrabajoes", PuestoDeTrabajo.findAllPuestoDeTrabajoes());
        List<Demandante> deman = Demandante.findAllDemandantes();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<deman.size(); i++){
        	us.add(deman.get(i).getIdUsuario());
        }
        uiModel.addAttribute("userperfil", us);
        uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
        List<Perfil> perf = Perfil.findAllPerfils();
        List<Demandante> d = new ArrayList<Demandante>();
        for(int i=0; i<perf.size(); i++){
        	d.add(perf.get(i).getIdDemandante());
        }
        uiModel.addAttribute("perfildeman", d);
    
    }
}
