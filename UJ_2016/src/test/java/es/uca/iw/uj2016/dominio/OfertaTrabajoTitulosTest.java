package es.uca.iw.uj2016.dominio;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.springframework.mock.staticmock.MockStaticEntityMethods;

@RunWith(JUnit4.class)
@MockStaticEntityMethods
public class OfertaTrabajoTitulosTest {

    @Test
    public void testMethod() {
        int expectedCount = 13;
        OfertaTrabajoTitulos.countOfertaTrabajoTituloses();
        org.springframework.mock.staticmock.AnnotationDrivenStaticEntityMockingControl.expectReturn(expectedCount);
        org.springframework.mock.staticmock.AnnotationDrivenStaticEntityMockingControl.playback();
        org.junit.Assert.assertEquals(expectedCount, OfertaTrabajoTitulos.countOfertaTrabajoTituloses());
    }
}
