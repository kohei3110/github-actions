package githubactions.resources;

import static org.hamcrest.CoreMatchers.is;
import org.mockito.MockitoAnnotations;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.mockito.InjectMocks;

/**
 * サンプルクラスのテストクラス。
 * @author kohei
 */
public class GhTest {
    
    @InjectMocks
    Gh gh;
    
    @Before
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }
    
     @Test
     public void echoTest() {
         String expected = "hey";
         String actual = gh.echo();
         assertThat(actual, is(expected));
     }
     
     @Test
     public void calcTest() {
         int expected = 1;
         int actual = gh.calc();
         assertThat(actual, is(expected));
     }
}
