package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.FormacionAcademica;
import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.TitulosFormacion;
import es.uca.iw.uj2016.dominio.Usuario;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/formacionacademicas")
@Controller
@RooWebScaffold(path = "formacionacademicas", formBackingObject = FormacionAcademica.class)
@GvNIXWebJQuery
public class FormacionAcademicaController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid FormacionAcademica formacionAcademica, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, formacionAcademica);
            return "formacionacademicas/create";
        }
        uiModel.asMap().clear();
        formacionAcademica.persist();
        return "redirect:/formacionacademicas/" + encodeUrlPathSegment(formacionAcademica.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new FormacionAcademica());
        return "formacionacademicas/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("formacionacademica", FormacionAcademica.findFormacionAcademica(id));
        uiModel.addAttribute("itemId", id);
        
        
        //Averiguar IdPerfilActual e IDDemandante Actual
        List<Demandante> deman = Demandante.findAllDemandantes();
        List<Usuario> us = new ArrayList<Usuario>(); //Userperfil
        for(int i=0; i<deman.size(); i++){
        	us.add(deman.get(i).getIdUsuario());
        }
        List<Perfil> perf = Perfil.findAllPerfils();
        List<Demandante> d = new ArrayList<Demandante>(); //PerfilDeman
        for(int i=0; i<perf.size(); i++){
        	d.add(perf.get(i).getIdDemandante());
        }
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
            
        int idDemanActual=0;
        for(int i=0; i<us.size(); i++){
        	if(idUsuarioActual==us.get(i).getId()){
        		idDemanActual=deman.get(i).getId();
        	}
        }
        
        int idPerfilActual=0;
        for(int i=0; i<d.size(); i++){
        	if(idDemanActual == d.get(i).getId()){
        		idPerfilActual=perf.get(i).getId();
        	}
        }
        
        uiModel.addAttribute("perfil", Perfil.findPerfil(idPerfilActual));
        uiModel.addAttribute("demandante", Demandante.findDemandante(idDemanActual));
        return "formacionacademicas/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("formacionacademicas", FormacionAcademica.findFormacionAcademicaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) FormacionAcademica.countFormacionAcademicas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("formacionacademicas", FormacionAcademica.findAllFormacionAcademicas(sortFieldName, sortOrder));
        }
        return "formacionacademicas/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid FormacionAcademica formacionAcademica, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, formacionAcademica);
            return "formacionacademicas/update";
        }
        uiModel.asMap().clear();
        formacionAcademica.merge();
        return "redirect:/formacionacademicas/" + encodeUrlPathSegment(formacionAcademica.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, FormacionAcademica.findFormacionAcademica(id));
        return "formacionacademicas/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FormacionAcademica formacionAcademica = FormacionAcademica.findFormacionAcademica(id);
        formacionAcademica.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/formacionacademicas";
    }

	void populateEditForm(Model uiModel, FormacionAcademica formacionAcademica) {
        uiModel.addAttribute("formacionAcademica", formacionAcademica);
        uiModel.addAttribute("perfils", Perfil.findAllPerfils());
        uiModel.addAttribute("titulosformacions", TitulosFormacion.findAllTitulosFormacions());
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

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
}
