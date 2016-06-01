package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.Localizacion;
import es.uca.iw.uj2016.dominio.OfertaDeTrabajo;
import es.uca.iw.uj2016.dominio.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/empresas")
@Controller
@RooWebScaffold(path = "empresas", formBackingObject = Empresa.class)
@GvNIXWebJQuery
public class EmpresaController {

	void populateEditForm(Model uiModel, Empresa empresa) {
        uiModel.addAttribute("empresa", empresa);
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        uiModel.addAttribute("localizacions", Localizacion.findAllLocalizacions());
        uiModel.addAttribute("ofertadetrabajoes", OfertaDeTrabajo.findAllOfertaDeTrabajoes());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
        List<Empresa> empr = Empresa.findAllEmpresas();
        List<Usuario> us = new ArrayList<Usuario>();
        for(int i=0; i<empr.size(); i++){
        	us.add(empr.get(i).getIdUsuario());
        }
        uiModel.addAttribute("userempresa", us);
    }
}
