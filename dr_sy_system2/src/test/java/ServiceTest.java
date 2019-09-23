import com.sy.pojo.Employee;
import com.sy.pojo.Goods;
import com.sy.service.EmployeeService;
import com.sy.service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath:spring-service.xml",
        "classpath:spring-dao.xml"
})
public class ServiceTest {

    @Autowired
    private GoodsService goodsServiceImpl;

    @Test
    public void test01(){
        List<Goods> allGoods = goodsServiceImpl.getAllGoods(1,3);

        System.out.println(allGoods);
    }
}
