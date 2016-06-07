package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.Inscripcion;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;


@RequestMapping("/inscripcions")
@Controller
@RooWebScaffold(path = "inscripcions", formBackingObject = Inscripcion.class)
@GvNIXWebJQuery
public class InscripcionController {

	public static int idOf=-1;
	void populateEditForm(Model uiModel, Inscripcion inscripcion) {
        uiModel.addAttribute("inscripcion", inscripcion);
        uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
        uiModel.addAttribute("ofertadetrabajoes", OfertaDeTrabajo.findAllOfertaDeTrabajoes());
        List<Demandante> deman = Demandante.findAllDemandantes();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<deman.size(); i++){
        	us.add(deman.get(i).getIdUsuario());
        }
        
        uiModel.addAttribute("userperfil", us);
        uiModel.addAttribute("demandante", inscripcion.getIdDemandante());
        
      //ID del usuario actual
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername();
        List<Usuario> todosUs = new ArrayList<Usuario>();
        todosUs = Usuario.findAllUsuarios();
        int idUsuarioActual=-1;
        int idRolUsuario=-1;
        for(int i=0; i<todosUs.size(); i++){
        	if(name.equals(todosUs.get(i).getNombre())){
        		idUsuarioActual=todosUs.get(i).getId();
        		idRolUsuario=todosUs.get(i).getIdRolUsuario().getId();
        	}
        }
        
        if(idRolUsuario==2){ //Si es una Empresa
            uiModel.addAttribute("idOfertaTrabajoActual", inscripcion.getIdOfertaDeTrabajo().getId());
        }
        
        uiModel.addAttribute("createId", idOf);
        
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("inscripcions", Inscripcion.findInscripcionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Inscripcion.countInscripcions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("inscripcions", Inscripcion.findAllInscripcions(sortFieldName, sortOrder));
        }
        
        List<Inscripcion> insc = Inscripcion.findAllInscripcions();
        List<Inscripcion> insc_deman = new ArrayList<Inscripcion>();
        List<Inscripcion> insc_empr = new ArrayList<Inscripcion>();
        
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
        
        //Empresa actual
        List<Empresa> empr = Empresa.findAllEmpresas();
        List<Usuario> us_empr= new ArrayList<Usuario>();
        for(int i=0; i<empr.size(); i++){
        	us_empr.add(empr.get(i).getIdUsuario());
        }
        int idEmprActual=0;
        for(int i=0; i<us_empr.size(); i++){
        	if(idUsuarioActual==us_empr.get(i).getId()){
        		idEmprActual=empr.get(i).getId();
        	}
        }
        
        //Averiguamos todas las inscripciones de este usuario
        for(int i=0; i<insc.size(); i++){
        	if(insc.get(i).getIdDemandante().getId() == idDemanActual){
        		insc_deman.add(insc.get(i));
        	}
        }
        
        //Averiguamos todas las inscripciones de esta empresa
        for(int i=0; i<insc.size(); i++){
        	if(insc.get(i).getIdOfertaDeTrabajo().getIdEmpresa().getId() == idEmprActual){
        		insc_empr.add(insc.get(i));
        	}
        }

        
        //Inscripciones relacionadas con el demanandante
        uiModel.addAttribute("inscDeman", insc_deman);
        
        //Inscripciones relacionadas con la empresa
        uiModel.addAttribute("inscEmpr", insc_empr);
        return "inscripcions/list";
    }
	
	
	@RequestMapping(value = "/createSel/{id}", produces = "text/html")
    public String createSel(@PathVariable int id, Model uiModel) {
        uiModel.addAttribute("inscripcion", Inscripcion.findInscripcion(id));
        uiModel.addAttribute("createId", id);
        idOf=id;
        return "redirect:/inscripcions?form";
    }
	
	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Inscripcion());
        return "inscripcions/create";
    }

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Inscripcion inscripcion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inscripcion);
            return "inscripcions/create";
        }
        uiModel.asMap().clear();
        inscripcion.persist();
        return "redirect:/inscripcions/" + encodeUrlPathSegment(inscripcion.getId().toString(), httpServletRequest);
    }
}
