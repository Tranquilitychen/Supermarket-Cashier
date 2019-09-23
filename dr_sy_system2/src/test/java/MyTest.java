import com.sy.dao.EmployeeMapper;
import com.sy.pojo.Employee;
import com.sy.pojo.User;
import com.sy.utils.CommonsUtil;
import com.sy.utils.GoodsNoUtil;
import com.sy.utils.MD5Util;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.InputStream;

public class MyTest {

    @Test
    public void test01(){
        String str = "[[00010004,  00010006,  00010005,  00010000,  00010002,  00010001]]";
        str = str.substring(1,str.length() - 1);
        System.out.println(str);
    }

    @Test
    public void testSpring(){
        //1.去得到Spring框架上下文对象
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        //2.获取Bean对象
        User user = (User)context.getBean("user");
        System.out.println(user);
    }

    @Test
    public void testMyBatis() throws IOException {
        //1.加载配置文件：转换成输入流
        InputStream inputStream = Resources.getResourceAsStream("sqlMapConfig.xml");
        //2.获取SessionFactory : session工厂
        SqlSessionFactory factory =  new SqlSessionFactoryBuilder().build(inputStream);
        //3.获取session ：相当于JDBC中connection
        SqlSession session = factory.openSession();
        //4.获取Mapper代理对象
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        //5.实际CURD
       // List<Employee> all= mapper.findAll();
        Employee employee=mapper.findByName("jack");
        //6.提交事务
        session.commit();
        //打印
        System.out.println(employee);
        //7.关闭资源
    }

    @Test
    public void testMD5(){
        System.out.println(MD5Util.MD55("123123"));

    }

    @Test
    public void test05(){
        String emplNum = CommonsUtil.createEmplNum(99, "GL1001");
        System.out.println(emplNum);
    }



    @Test
    public void test06(){
        GoodsNoUtil goodsNo = new GoodsNoUtil();

        String gno =  goodsNo.createGoodsNo("00010002000001");
        System.out.println(gno);

    }


}
