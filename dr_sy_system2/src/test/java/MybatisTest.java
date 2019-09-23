import com.sy.dao.CateMapper;
import com.sy.dao.EmployeeMapper;
import com.sy.pojo.Employee;
import com.sy.pojo.Goodstype;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-dao.xml")

public class MybatisTest {

    @Autowired
    private CateMapper cateMapper;

    @Test
    public void test01(){
        String gtNo = "00010004,00020000,";

        String sb = selGtNo(gtNo);
        System.out.println("-----------总结--------------");
        System.out.println("需要删除的节点："  + sb);
       /* Digui("00010000");*/
    }

    private Set<String> set = new HashSet<>();

    private String selGtNo(String gtNos){
        // 切割字符串，获取 当前 节点
        String[] gt_nos = gtNos.split(",");
        System.out.println("需要删除的节点:" + Arrays.toString(gt_nos));

    /*    // 用于记录需要删除的节点
        StringBuilder sb = new StringBuilder();*/
        // 遍历所有的 子节点
        for (int i = 0; i < gt_nos.length; i++){
            set.add(gt_nos[i]);

            System.out.println("当前操作节点：" + gt_nos[i]);
            // 获取当前 子 节点的所有信息
            Goodstype goodstype = cateMapper.selTypeForGtNo(gt_nos[i]);
            // 判断当前节点是否是 父节点， 如果不是父节点 则已经是最小子节点了，需要删除
            if (goodstype.getGtIsparent() == 0){
                System.out.println("已经是最小节点了");
                /*sb.append(goodstype.getGtNo() + ",");*/
                set.add(goodstype.getGtNo());
            }else{
                // 遍历 当前的子节点 是否还存在子节点。
                for (Goodstype child : cateMapper.selGoodsTypeByGtNo(gt_nos[i])) {
                    System.out.println("子节点:" + child);
                    // 子节点为 的 isparent 为 1 ,说明存在还存在子节点。
                    if (child.getGtIsparent() == 1){
                        // 还存在子节点就进行 递归操作
                       String str =  selGtNo(child.getGtNo());
                       System.out.println("子节点的 子节点 ：" +  str);
                    }else{
                        //  == 0 就说明没有字节点，为最小子节点
                        set.add(child.getGtNo());
                        /*sb.append(child.getGtNo() + ",");*/
                    }
                }

                System.out.println("所有的子节点：" + set.toString());
                /*System.out.println("所有子节点:" + sb.toString());*/
            }

            System.out.println("***遍历操作" + gt_nos[i] + " 结束***");
            System.out.println("-------------------------------");
        }
        System.out.println("所有节点遍历完成");
        System.out.println("-------------------------------");

        // 判断是需要递归还是 直接返回数据
        return set.toString();
    }

    private String Digui(String gtNo){
        System.out.println("当前节点：【" + gtNo + "】" );

        StringBuilder sb = new StringBuilder();

        // 获取当前 子 节点的所有信息
        Goodstype goodstype = cateMapper.selTypeForGtNo(gtNo);

        // 判断当前节点是否是 父节点， 如果不是父节点 则已经是最小子节点了，需要删除
        if (goodstype.getGtIsparent() == 0){
            System.out.println("已经是最小节点了");
            sb.append(goodstype.getGtNo());
            return sb.toString();
        }else{
            // 遍历 当前的子节点 是否还存在子节点。
            for (Goodstype child : cateMapper.selGoodsTypeByGtNo(gtNo)) {
                System.out.println("子节点:" + child);
                sb.append(child.getGtNo() + ",");
            }

            System.out.println("所有子节点:" + sb.toString());

            if  (sb.length() != 0 || sb.length() > 1){
                // 删除 节点的 ","
                sb.deleteCharAt(sb.length() - 1);
            }

            System.out.println("-------------------------------");
            return sb.toString();
        }
    }

/*    private Object selectGtNo(String gtNo){
        Goodstype goodstype = cateMapper.selTypeForGtNo(gtNo);
        System.out.println(goodstype);

        // 根据 gtNo 查询出所有的子节点
        if  (goodstype.getGtIsparent() == 0){
            // 没有子节点
            return 0;
        }else{
            // 说明存在子节点
            StringBuilder sb = new StringBuilder();
            for (Goodstype child : cateMapper.selGoodsTypeByGtNo(gtNo)) {
                System.out.println("子节点:" + child);
                sb.append(child.getGtNo() + ",");
            }
            System.out.println("所有子节点:" + sb.toString());

            selGtNo(sb.toString());
            return 0;
        }
    }*/


    @Test
    public void StringToSet(){
        String str = "12345";
        String[] strs= str.split("");

        //方式一
        List<String> list1 = Arrays.asList(strs);
        Set<String> set1 = new HashSet<>(list1);

        //方式二
        Set<String> set2 = new HashSet<>();
        Collections.addAll(set2, strs);
        System.out.println(set2);

        String str2 = String.join("", set2);
        System.out.println(str2);
    }

    @Test
    public void test(){
        // 获取所有的商品类型
        List<Goodstype> goodstypes = cateMapper.selAll();

        //
        for (Goodstype goodstype : goodstypes) {

        }



    }

/*    private static List<Goodstype> childCategoryList = new ArrayList<>();*/
/*

    public static List<Goodstype> getChildGoodstype(List<Goodstype> allGoodsTypeList, String parentId){
        for (Goodstype goodstype : allGoodsTypeList) {
            // 判断是否存在子节点
            if (goodstype.getGtPno().equals(parentId)) {
                // 递归遍历下一级
                getChildGoodstype(allGoodsTypeList, goodstype.getGtNo());
                childCategoryList.add(goodstype);
            }
        }
        System.out.println("childCategoryList=" + childCategoryList);
        return childCategoryList;
    }
*/




}
