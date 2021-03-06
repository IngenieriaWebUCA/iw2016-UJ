// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.FormacionAcademica;
import es.uca.iw.uj2016.dominio.FormacionAcademicaDataOnDemand;
import es.uca.iw.uj2016.dominio.TitulosAcademicos;
import es.uca.iw.uj2016.dominio.TitulosAcademicosDataOnDemand;
import es.uca.iw.uj2016.dominio.TitulosFormacion;
import es.uca.iw.uj2016.dominio.TitulosFormacionDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TitulosFormacionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TitulosFormacionDataOnDemand: @Component;
    
    private Random TitulosFormacionDataOnDemand.rnd = new SecureRandom();
    
    private List<TitulosFormacion> TitulosFormacionDataOnDemand.data;
    
    @Autowired
    FormacionAcademicaDataOnDemand TitulosFormacionDataOnDemand.formacionAcademicaDataOnDemand;
    
    @Autowired
    TitulosAcademicosDataOnDemand TitulosFormacionDataOnDemand.titulosAcademicosDataOnDemand;
    
    public TitulosFormacion TitulosFormacionDataOnDemand.getNewTransientTitulosFormacion(int index) {
        TitulosFormacion obj = new TitulosFormacion();
        setIdFormacionAcademica(obj, index);
        setIdTitulosAcademicos(obj, index);
        return obj;
    }
    
    public void TitulosFormacionDataOnDemand.setIdFormacionAcademica(TitulosFormacion obj, int index) {
        FormacionAcademica idFormacionAcademica = formacionAcademicaDataOnDemand.getRandomFormacionAcademica();
        obj.setIdFormacionAcademica(idFormacionAcademica);
    }
    
    public void TitulosFormacionDataOnDemand.setIdTitulosAcademicos(TitulosFormacion obj, int index) {
        TitulosAcademicos idTitulosAcademicos = titulosAcademicosDataOnDemand.getRandomTitulosAcademicos();
        obj.setIdTitulosAcademicos(idTitulosAcademicos);
    }
    
    public TitulosFormacion TitulosFormacionDataOnDemand.getSpecificTitulosFormacion(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TitulosFormacion obj = data.get(index);
        Integer id = obj.getId();
        return TitulosFormacion.findTitulosFormacion(id);
    }
    
    public TitulosFormacion TitulosFormacionDataOnDemand.getRandomTitulosFormacion() {
        init();
        TitulosFormacion obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return TitulosFormacion.findTitulosFormacion(id);
    }
    
    public boolean TitulosFormacionDataOnDemand.modifyTitulosFormacion(TitulosFormacion obj) {
        return false;
    }
    
    public void TitulosFormacionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = TitulosFormacion.findTitulosFormacionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TitulosFormacion' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TitulosFormacion>();
        for (int i = 0; i < 10; i++) {
            TitulosFormacion obj = getNewTransientTitulosFormacion(i);
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
