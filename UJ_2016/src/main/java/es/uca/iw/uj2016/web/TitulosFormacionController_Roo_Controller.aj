// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.web;

import es.uca.iw.uj2016.dominio.FormacionAcademica;
import es.uca.iw.uj2016.dominio.TitulosAcademicos;
import es.uca.iw.uj2016.dominio.TitulosFormacion;
import es.uca.iw.uj2016.web.TitulosFormacionController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TitulosFormacionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TitulosFormacionController.create(@Valid TitulosFormacion titulosFormacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, titulosFormacion);
            return "titulosformacions/create";
        }
        uiModel.asMap().clear();
        titulosFormacion.persist();
        return "redirect:/titulosformacions/" + encodeUrlPathSegment(titulosFormacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TitulosFormacionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TitulosFormacion());
        return "titulosformacions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TitulosFormacionController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("titulosformacion", TitulosFormacion.findTitulosFormacion(id));
        uiModel.addAttribute("itemId", id);
        return "titulosformacions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TitulosFormacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("titulosformacions", TitulosFormacion.findTitulosFormacionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) TitulosFormacion.countTitulosFormacions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("titulosformacions", TitulosFormacion.findAllTitulosFormacions(sortFieldName, sortOrder));
        }
        return "titulosformacions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TitulosFormacionController.update(@Valid TitulosFormacion titulosFormacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, titulosFormacion);
            return "titulosformacions/update";
        }
        uiModel.asMap().clear();
        titulosFormacion.merge();
        return "redirect:/titulosformacions/" + encodeUrlPathSegment(titulosFormacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TitulosFormacionController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, TitulosFormacion.findTitulosFormacion(id));
        return "titulosformacions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TitulosFormacionController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TitulosFormacion titulosFormacion = TitulosFormacion.findTitulosFormacion(id);
        titulosFormacion.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/titulosformacions";
    }
    
    void TitulosFormacionController.populateEditForm(Model uiModel, TitulosFormacion titulosFormacion) {
        uiModel.addAttribute("titulosFormacion", titulosFormacion);
        uiModel.addAttribute("formacionacademicas", FormacionAcademica.findAllFormacionAcademicas());
        uiModel.addAttribute("titulosacademicoses", TitulosAcademicos.findAllTitulosAcademicoses());
    }
    
    String TitulosFormacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
