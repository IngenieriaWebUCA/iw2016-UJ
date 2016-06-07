package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.ExperienciaProfesional;
import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("experienciaprofesionals", ExperienciaProfesional.findExperienciaProfesionalEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ExperienciaProfesional.countExperienciaProfesionals() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("experienciaprofesionals", ExperienciaProfesional.findAllExperienciaProfesionals(sortFieldName, sortOrder));
        }
    	
        
        List<ExperienciaProfesional> expro = ExperienciaProfesional.findAllExperienciaProfesionals();
        List<ExperienciaProfesional> expro_deman = new ArrayList<ExperienciaProfesional>();
        //ID del usuario actual
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername();
        List<Usuario> todosUs = new ArrayList<Usuario>();
        todosUs = Usuario.findAllUsuarios();
        int idUsuarioActual=-1;
        for(int i=0; i<todosUs.size(); i++){
        	if(name.equals(todosUs.get(i).getNombre())){
        		idUsuarioActual=todosUs.get(i).getId();
        	}
        }
        
       //Demandanate actual
        List<Demandante> deman = Demandante.findAllDemandantes();
        List<Usuario> us = new ArrayList<Usuario>(); //Userperfil
        for(int i=0; i<deman.size(); i++){
        	us.add(deman.get(i).getIdUsuario());
        }
        int idDemanActual=0;
        for(int i=0; i<us.size(); i++){
        	if(idUsuarioActual==us.get(i).getId()){
        		idDemanActual=deman.get(i).getId();
        	}
        }
        
        //Averiguamos las experiencias profesionales de este usuario
        for(int i=0; i<expro.size(); i++){
        	if(expro.get(i).getIdPerfil().getIdDemandante().getId() == idDemanActual){
        		expro_deman.add(expro.get(i));
        	}
        }
        
        uiModel.addAttribute("exproActual", expro_deman);
        
        
        addDateTimeFormatPatterns(uiModel);
        return "experienciaprofesionals/list";
    }
}
