package es.uca.iw.uj2016.web;
import es.uca.iw.uj2016.dominio.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/ObtenerIdController")
@Controller
@GvNIXWebJQuery
public class ObtenerIdController {

	@RequestMapping(value="/inicio", produces = "text/html")
	public String inicio(Model uiModel) {
		uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
		return "index";
    }
	
}