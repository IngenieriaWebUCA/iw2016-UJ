package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.ExperienciaProfesional;
import es.uca.iw.uj2016.dominio.FormacionAcademica;
import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.PuestoTrabajoPerfil;
import es.uca.iw.uj2016.dominio.Usuario;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
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

@RequestMapping("/perfils")
@Controller
@RooWebScaffold(path = "perfils", formBackingObject = Perfil.class)
@GvNIXWebJQuery
public class PerfilController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Perfil perfil, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, perfil);
            return "perfils/create";
        }
        uiModel.asMap().clear();
        perfil.persist();
        return "redirect:/perfils/" + encodeUrlPathSegment(perfil.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Perfil());
        return "perfils/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("perfil", Perfil.findPerfil(id));
        uiModel.addAttribute("itemId", id);
        return "perfils/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("perfils", Perfil.findPerfilEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Perfil.countPerfils() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("perfils", Perfil.findAllPerfils(sortFieldName, sortOrder));
        }
        return "perfils/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Perfil perfil, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, perfil);
            return "perfils/update";
        }
        uiModel.asMap().clear();
        perfil.merge();
        return "redirect:/perfils/" + encodeUrlPathSegment(perfil.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Perfil.findPerfil(id));
        return "perfils/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Perfil perfil = Perfil.findPerfil(id);
        perfil.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/perfils";
    }

	void populateEditForm(Model uiModel, Perfil perfil) {
        uiModel.addAttribute("perfil", perfil);
        List<Demandante> deman = Demandante.findAllDemandantes();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<deman.size(); i++){
        	us.add(deman.get(i).getIdUsuario());
        }
        uiModel.addAttribute("userperfil", us);
        uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
        uiModel.addAttribute("experienciaprofesionals", ExperienciaProfesional.findAllExperienciaProfesionals());
        uiModel.addAttribute("formacionacademicas", FormacionAcademica.findAllFormacionAcademicas());
        uiModel.addAttribute("puestotrabajoperfils", PuestoTrabajoPerfil.findAllPuestoTrabajoPerfils());
        
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
