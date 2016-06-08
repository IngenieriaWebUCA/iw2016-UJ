package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.Estado;
import es.uca.iw.uj2016.dominio.Inscripcion;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import es.uca.iw.uj2016.dominio.OfertaTrabajoTitulos;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import es.uca.iw.uj2016.dominio.Usuario;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import org.joda.time.format.DateTimeFormat;

@RequestMapping("/ofertadetrabajoes")
@Controller
@RooWebScaffold(path = "ofertadetrabajoes", formBackingObject = OfertaDeTrabajo.class)
@GvNIXWebJQuery
public class OfertaDeTrabajoController {

	@Autowired
	private JavaMailSender mailSender;
	
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
        
        List<Inscripcion> todosInsc = Inscripcion.findAllInscripcions();
        List<Inscripcion> inscripcionesDeman = new ArrayList<Inscripcion>();
        for(int i=0; i<todosInsc.size(); i++){
        	if(todosInsc.get(i).getIdDemandante().getId() == idDemanActual){
        		inscripcionesDeman.add(todosInsc.get(i));
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
        
        //Ofertas de trabajo activas y que no este inscritos
        boolean inscrito = false;
        List<OfertaDeTrabajo> of_dem = new ArrayList<OfertaDeTrabajo>();
        for(int i=0; i<of.size(); i++){
        	if((of.get(i).getIdEstado().getNombre()).equals("Activa")){
        		inscrito=false;
        		for(int j=0; j<inscripcionesDeman.size(); j++){
        			if(inscripcionesDeman.get(j).getIdOfertaDeTrabajo().getId() == of.get(i).getId()){
        				inscrito=true;
        			}
        		}
        		if(!inscrito){
        			of_dem.add(of.get(i));
        		}
        		
        	}
        }
       //Ofertas de trabajo relacionadas con la empresa
        uiModel.addAttribute("ofEmpr", of_empr);
        
        //Ofertas de trabajo activas
        uiModel.addAttribute("ofDem", of_dem);
        addDateTimeFormatPatterns(uiModel);
        return "ofertadetrabajoes/list";
    }

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid OfertaDeTrabajo ofertaDeTrabajo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ofertaDeTrabajo);
            return "ofertadetrabajoes/create";
        }
        uiModel.asMap().clear();
        ofertaDeTrabajo.persist();
        return "redirect:/ofertadetrabajoes/" + encodeUrlPathSegment(ofertaDeTrabajo.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new OfertaDeTrabajo());
        return "ofertadetrabajoes/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ofertadetrabajo", OfertaDeTrabajo.findOfertaDeTrabajo(id));
        uiModel.addAttribute("itemId", id);
        return "ofertadetrabajoes/show";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid OfertaDeTrabajo ofertaDeTrabajo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ofertaDeTrabajo);
            return "ofertadetrabajoes/update";
        }        
        List<Inscripcion> todosInsc = Inscripcion.findAllInscripcions();
        List<Inscripcion> inscritos = new ArrayList<Inscripcion>();
        for(int i=0; i<todosInsc.size(); i++){
        	if(todosInsc.get(i).getIdOfertaDeTrabajo().getId() == ofertaDeTrabajo.getId()){
        		inscritos.add(todosInsc.get(i));
        	}
        }
     
        //Enviar email
        for(int i=0; i<inscritos.size(); i++){
        	System.out.println("Llega");
            String emailDeman = inscritos.get(i).getIdDemandante().getEmail();
            String estadoIns = ofertaDeTrabajo.getIdEstado().getNombre();
            String nombreEmpresa = ofertaDeTrabajo.getIdEmpresa().getNombre();
                    
            //Enviar correos electronicos
             SimpleMailMessage msg = new SimpleMailMessage();
             msg.setFrom("Ucas_Jobs");
             msg.setTo(emailDeman);
             msg.setSubject("El estado de la oferta de trabajo ha cambiado.");
             msg.setText("El estado de la oferta de tarbajo a la que estabas inscrito, de la empresa "+nombreEmpresa+" ha pasado a un nuevo estado: "+estadoIns);
             try {
                 mailSender.send(msg);
             } catch (MailException ex) {
                 System.err.println(ex.getMessage());
             }        	
        }

        
        
        
        
        
        uiModel.asMap().clear();
        ofertaDeTrabajo.merge();
        return "redirect:/ofertadetrabajoes/" + encodeUrlPathSegment(ofertaDeTrabajo.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, OfertaDeTrabajo.findOfertaDeTrabajo(id));
        return "ofertadetrabajoes/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OfertaDeTrabajo ofertaDeTrabajo = OfertaDeTrabajo.findOfertaDeTrabajo(id);
        ofertaDeTrabajo.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ofertadetrabajoes";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ofertaDeTrabajo_fechainicio_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("ofertaDeTrabajo_fechadefin_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
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
