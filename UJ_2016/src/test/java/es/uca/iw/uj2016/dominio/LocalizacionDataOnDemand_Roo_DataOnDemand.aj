// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.Ciudad;
import es.uca.iw.uj2016.dominio.CiudadDataOnDemand;
import es.uca.iw.uj2016.dominio.Empresa;
import es.uca.iw.uj2016.dominio.EmpresaDataOnDemand;
import es.uca.iw.uj2016.dominio.Localizacion;
import es.uca.iw.uj2016.dominio.LocalizacionDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect LocalizacionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LocalizacionDataOnDemand: @Component;
    
    private Random LocalizacionDataOnDemand.rnd = new SecureRandom();
    
    private List<Localizacion> LocalizacionDataOnDemand.data;
    
    @Autowired
    CiudadDataOnDemand LocalizacionDataOnDemand.ciudadDataOnDemand;
    
    @Autowired
    EmpresaDataOnDemand LocalizacionDataOnDemand.empresaDataOnDemand;
    
    public Localizacion LocalizacionDataOnDemand.getNewTransientLocalizacion(int index) {
        Localizacion obj = new Localizacion();
        setDireccion(obj, index);
        setIdCiudad(obj, index);
        setIdEmpresa(obj, index);
        return obj;
    }
    
    public void LocalizacionDataOnDemand.setDireccion(Localizacion obj, int index) {
        String direccion = "direccion_" + index;
        if (direccion.length() > 128) {
            direccion = direccion.substring(0, 128);
        }
        obj.setDireccion(direccion);
    }
    
    public void LocalizacionDataOnDemand.setIdCiudad(Localizacion obj, int index) {
        Ciudad idCiudad = ciudadDataOnDemand.getRandomCiudad();
        obj.setIdCiudad(idCiudad);
    }
    
    public void LocalizacionDataOnDemand.setIdEmpresa(Localizacion obj, int index) {
        Empresa idEmpresa = empresaDataOnDemand.getRandomEmpresa();
        obj.setIdEmpresa(idEmpresa);
    }
    
    public Localizacion LocalizacionDataOnDemand.getSpecificLocalizacion(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Localizacion obj = data.get(index);
        Integer id = obj.getId();
        return Localizacion.findLocalizacion(id);
    }
    
    public Localizacion LocalizacionDataOnDemand.getRandomLocalizacion() {
        init();
        Localizacion obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Localizacion.findLocalizacion(id);
    }
    
    public boolean LocalizacionDataOnDemand.modifyLocalizacion(Localizacion obj) {
        return false;
    }
    
    public void LocalizacionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Localizacion.findLocalizacionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Localizacion' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Localizacion>();
        for (int i = 0; i < 10; i++) {
            Localizacion obj = getNewTransientLocalizacion(i);
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
