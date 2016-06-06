package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.Estado;
import es.uca.iw.uj2016.dominio.Inscripcion;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import es.uca.iw.uj2016.dominio.OfertaTrabajoTitulos;
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

@RequestMapping("/ofertadetrabajoes")
@Controller
@RooWebScaffold(path = "ofertadetrabajoes", formBackingObject = OfertaDeTrabajo.class)
@GvNIXWebJQuery
public class OfertaDeTrabajoController {

	void populateEditForm(Model uiModel, OfertaDeTrabajo ofertaDeTrabajo) {
        uiModel.addAttribute("ofertaDeTrabajo", ofertaDeTrabajo);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        uiModel.addAttribute("estadoes", Estado.findAllEstadoes());
        uiModel.addAttribute("inscripcions", Inscripcion.findAllInscripcions());
        uiModel.addAttribute("ofertatrabajotituloses", OfertaTrabajoTitulos.findAllOfertaTrabajoTituloses());
        uiModel.addAttribute("puestodetrabajoes", PuestoDeTrabajo.findAllPuestoDeTrabajoes());
        List<Empresa> empres = Empresa.findAllEmpresas();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<empres.size(); i++){
        	us.add(empres.get(i).getIdUsuario());
        }
        uiModel.addAttribute("userempresa", us);
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertadetrabajoes", OfertaDeTrabajo.findOfertaDeTrabajoEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) OfertaDeTrabajo.countOfertaDeTrabajoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertadetrabajoes", OfertaDeTrabajo.findAllOfertaDeTrabajoes(sortFieldName, sortOrder));
        }
        
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
        
        //Averiguamos todas las ofertas de trabajo de esta empresa
        List<OfertaDeTrabajo> of = OfertaDeTrabajo.findAllOfertaDeTrabajoes();
        List<OfertaDeTrabajo> of_empr = new ArrayList<OfertaDeTrabajo>();
        for(int i=0; i<of.size(); i++){
        	if(of.get(i).getIdEmpresa().getId() == idEmprActual){
        		of_empr.add(of.get(i));
        	}
        }
        
       //Ofertas de trabajo relacionadas con la empresa
        uiModel.addAttribute("ofEmpr", of_empr);
        
        addDateTimeFormatPatterns(uiModel);
        return "ofertadetrabajoes/list";
    }
}
