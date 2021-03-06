// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Demandante;
import es.uca.iw.uj2016.dominio.DemandanteDataOnDemand;
import es.uca.iw.uj2016.dominio.Perfil;
import es.uca.iw.uj2016.dominio.PerfilDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PerfilDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PerfilDataOnDemand: @Component;
    
    private Random PerfilDataOnDemand.rnd = new SecureRandom();
    
    private List<Perfil> PerfilDataOnDemand.data;
    
    @Autowired
    DemandanteDataOnDemand PerfilDataOnDemand.demandanteDataOnDemand;
    
    public Perfil PerfilDataOnDemand.getNewTransientPerfil(int index) {
        Perfil obj = new Perfil();
        setFoto(obj, index);
        setIdDemandante(obj, index);
        setPresentacion(obj, index);
        return obj;
    }
    
    public void PerfilDataOnDemand.setFoto(Perfil obj, int index) {
        String foto = "foto_" + index;
        if (foto.length() > 256) {
            foto = foto.substring(0, 256);
        }
        obj.setFoto(foto);
    }
    
    public void PerfilDataOnDemand.setIdDemandante(Perfil obj, int index) {
        Demandante idDemandante = demandanteDataOnDemand.getRandomDemandante();
        obj.setIdDemandante(idDemandante);
    }
    
    public void PerfilDataOnDemand.setPresentacion(Perfil obj, int index) {
        String presentacion = "presentacion_" + index;
        obj.setPresentacion(presentacion);
    }
    
    public Perfil PerfilDataOnDemand.getSpecificPerfil(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Perfil obj = data.get(index);
        Integer id = obj.getId();
        return Perfil.findPerfil(id);
    }
    
    public Perfil PerfilDataOnDemand.getRandomPerfil() {
        init();
        Perfil obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Perfil.findPerfil(id);
    }
    
    public boolean PerfilDataOnDemand.modifyPerfil(Perfil obj) {
        return false;
    }
    
    public void PerfilDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Perfil.findPerfilEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Perfil' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Perfil>();
        for (int i = 0; i < 10; i++) {
            Perfil obj = getNewTransientPerfil(i);
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
