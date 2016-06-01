package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Ciudad;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.Localizacion;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/localizacions")
@Controller
@RooWebScaffold(path = "localizacions", formBackingObject = Localizacion.class)
@GvNIXWebJQuery
public class LocalizacionController {

	void populateEditForm(Model uiModel, Localizacion localizacion) {
    	List<Empresa> empres = Empresa.findAllEmpresas();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<empres.size(); i++){
        	us.add(empres.get(i).getIdUsuario());
        }
        uiModel.addAttribute("userempresa", us);
    	uiModel.addAttribute("localizacion", localizacion);
        uiModel.addAttribute("ciudads", Ciudad.findAllCiudads());
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
    }
}
