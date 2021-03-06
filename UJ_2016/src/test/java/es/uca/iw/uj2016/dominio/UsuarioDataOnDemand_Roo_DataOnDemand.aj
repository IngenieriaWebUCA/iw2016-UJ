// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.RolUsuario;
import es.uca.iw.uj2016.dominio.RolUsuarioDataOnDemand;
import es.uca.iw.uj2016.dominio.Usuario;
import es.uca.iw.uj2016.dominio.UsuarioDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect UsuarioDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UsuarioDataOnDemand: @Component;
    
    private Random UsuarioDataOnDemand.rnd = new SecureRandom();
    
    private List<Usuario> UsuarioDataOnDemand.data;
    
    @Autowired
    RolUsuarioDataOnDemand UsuarioDataOnDemand.rolUsuarioDataOnDemand;
    
    public Usuario UsuarioDataOnDemand.getNewTransientUsuario(int index) {
        Usuario obj = new Usuario();
        setIdRolUsuario(obj, index);
        setNombre(obj, index);
        setPassword(obj, index);
        return obj;
    }
    
    public void UsuarioDataOnDemand.setIdRolUsuario(Usuario obj, int index) {
        RolUsuario idRolUsuario = rolUsuarioDataOnDemand.getRandomRolUsuario();
        obj.setIdRolUsuario(idRolUsuario);
    }
    
    public void UsuarioDataOnDemand.setNombre(Usuario obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 32) {
            nombre = new Random().nextInt(10) + nombre.substring(1, 32);
        }
        obj.setNombre(nombre);
    }
    
    public void UsuarioDataOnDemand.setPassword(Usuario obj, int index) {
        String password = "password_" + index;
        if (password.length() > 128) {
            password = password.substring(0, 128);
        }
        obj.setPassword(password);
    }
    
    public Usuario UsuarioDataOnDemand.getSpecificUsuario(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Usuario obj = data.get(index);
        Integer id = obj.getId();
        return Usuario.findUsuario(id);
    }
    
    public Usuario UsuarioDataOnDemand.getRandomUsuario() {
        init();
        Usuario obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Usuario.findUsuario(id);
    }
    
    public boolean UsuarioDataOnDemand.modifyUsuario(Usuario obj) {
        return false;
    }
    
    public void UsuarioDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Usuario.findUsuarioEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Usuario' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Usuario>();
        for (int i = 0; i < 10; i++) {
            Usuario obj = getNewTransientUsuario(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
