// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.PerfilDataOnDemand;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajo;
import es.uca.iw.uj2016.dominio.PuestoDeTrabajoDataOnDemand;
import es.uca.iw.uj2016.dominio.PuestoTrabajoPerfil;
import es.uca.iw.uj2016.dominio.PuestoTrabajoPerfilDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PuestoTrabajoPerfilDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PuestoTrabajoPerfilDataOnDemand: @Component;
    
    private Random PuestoTrabajoPerfilDataOnDemand.rnd = new SecureRandom();
    
    private List<PuestoTrabajoPerfil> PuestoTrabajoPerfilDataOnDemand.data;
    
    @Autowired
    PerfilDataOnDemand PuestoTrabajoPerfilDataOnDemand.perfilDataOnDemand;
    
    @Autowired
    PuestoDeTrabajoDataOnDemand PuestoTrabajoPerfilDataOnDemand.puestoDeTrabajoDataOnDemand;
    
    public PuestoTrabajoPerfil PuestoTrabajoPerfilDataOnDemand.getNewTransientPuestoTrabajoPerfil(int index) {
        PuestoTrabajoPerfil obj = new PuestoTrabajoPerfil();
        setIdPerfil(obj, index);
        setIdPuestoDeTrabajo(obj, index);
        return obj;
    }
    
    public void PuestoTrabajoPerfilDataOnDemand.setIdPerfil(PuestoTrabajoPerfil obj, int index) {
        Perfil idPerfil = perfilDataOnDemand.getRandomPerfil();
        obj.setIdPerfil(idPerfil);
    }
    
    public void PuestoTrabajoPerfilDataOnDemand.setIdPuestoDeTrabajo(PuestoTrabajoPerfil obj, int index) {
        PuestoDeTrabajo idPuestoDeTrabajo = puestoDeTrabajoDataOnDemand.getRandomPuestoDeTrabajo();
        obj.setIdPuestoDeTrabajo(idPuestoDeTrabajo);
    }
    
    public PuestoTrabajoPerfil PuestoTrabajoPerfilDataOnDemand.getSpecificPuestoTrabajoPerfil(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PuestoTrabajoPerfil obj = data.get(index);
        Integer id = obj.getId();
        return PuestoTrabajoPerfil.findPuestoTrabajoPerfil(id);
    }
    
    public PuestoTrabajoPerfil PuestoTrabajoPerfilDataOnDemand.getRandomPuestoTrabajoPerfil() {
        init();
        PuestoTrabajoPerfil obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return PuestoTrabajoPerfil.findPuestoTrabajoPerfil(id);
    }
    
    public boolean PuestoTrabajoPerfilDataOnDemand.modifyPuestoTrabajoPerfil(PuestoTrabajoPerfil obj) {
        return false;
    }
    
    public void PuestoTrabajoPerfilDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = PuestoTrabajoPerfil.findPuestoTrabajoPerfilEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PuestoTrabajoPerfil' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PuestoTrabajoPerfil>();
        for (int i = 0; i < 10; i++) {
            PuestoTrabajoPerfil obj = getNewTransientPuestoTrabajoPerfil(i);
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
