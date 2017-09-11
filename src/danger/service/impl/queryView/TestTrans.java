package danger.service.impl.queryView;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/applicationContext-*.xml")
public class TestTrans {

	@Autowired
	private TestTranServiceImpl testTranServiceImpl;
	@Test
	public void test(){
		testTranServiceImpl.deleteTestTrans();
	}
}
