// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.uj2016.dominio;

import es.uca.iw.uj2016.dominio.TitulosAcademicos;
import es.uca.iw.uj2016.dominio.TitulosAcademicosDataOnDemand;
import es.uca.iw.uj2016.dominio.TitulosAcademicosIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TitulosAcademicosIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TitulosAcademicosIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TitulosAcademicosIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TitulosAcademicosIntegrationTest: @Transactional;
    
    @Autowired
    TitulosAcademicosDataOnDemand TitulosAcademicosIntegrationTest.dod;
    
    @Test
    public void TitulosAcademicosIntegrationTest.testCountTitulosAcademicoses() {
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to initialize correctly", dod.getRandomTitulosAcademicos());
        long count = TitulosAcademicos.countTitulosAcademicoses();
        Assert.assertTrue("Counter for 'TitulosAcademicos' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TitulosAcademicosIntegrationTest.testFindTitulosAcademicos() {
        TitulosAcademicos obj = dod.getRandomTitulosAcademicos();
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to provide an identifier", id);
        obj = TitulosAcademicos.findTitulosAcademicos(id);
        Assert.assertNotNull("Find method for 'TitulosAcademicos' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TitulosAcademicos' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TitulosAcademicosIntegrationTest.testFindAllTitulosAcademicoses() {
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to initialize correctly", dod.getRandomTitulosAcademicos());
        long count = TitulosAcademicos.countTitulosAcademicoses();
        Assert.assertTrue("Too expensive to perform a find all test for 'TitulosAcademicos', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TitulosAcademicos> result = TitulosAcademicos.findAllTitulosAcademicoses();
        Assert.assertNotNull("Find all method for 'TitulosAcademicos' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TitulosAcademicos' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TitulosAcademicosIntegrationTest.testFindTitulosAcademicosEntries() {
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to initialize correctly", dod.getRandomTitulosAcademicos());
        long count = TitulosAcademicos.countTitulosAcademicoses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TitulosAcademicos> result = TitulosAcademicos.findTitulosAcademicosEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TitulosAcademicos' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TitulosAcademicos' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TitulosAcademicosIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to initialize correctly", dod.getRandomTitulosAcademicos());
        TitulosAcademicos obj = dod.getNewTransientTitulosAcademicos(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TitulosAcademicos' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'TitulosAcademicos' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TitulosAcademicosIntegrationTest.testRemove() {
        TitulosAcademicos obj = dod.getRandomTitulosAcademicos();
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TitulosAcademicos' failed to provide an identifier", id);
        obj = TitulosAcademicos.findTitulosAcademicos(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'TitulosAcademicos' with identifier '" + id + "'", TitulosAcademicos.findTitulosAcademicos(id));
    }
    
}
