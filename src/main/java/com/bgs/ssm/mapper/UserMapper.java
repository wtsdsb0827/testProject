package com.bgs.ssm.mapper;


import com.bgs.ssm.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {


	User selectUser(@Param("userName") String userName, @Param("password") String password);


    List<Relation> selectUseQuanXian(@Param("id") Integer id);


    List<Relation> selectUseQuanXian1(@Param("pId") Integer pId);


    List<Role> JueSeQuanXian();


    boolean addRole(@Param("roleName") String roleName, @Param("roleSort")  String roleSort);


    boolean deleteRole(@Param("id") Integer id);


    boolean xiugaiRole(@Param("roleName") String roleName, @Param("roleSort") String roleSort, @Param("id") Integer id);


    List<User> YongHuQuanXian(@Param("userName") String userName, @Param("allName") String allName, @Param("telphone") Integer telphone, @Param("deptId") Integer deptId);


    List<Dept> selectDept();


    List<Role> selectRole();


    boolean addYongHu(User user);


    boolean deleteYongHu(@Param("id") Integer id);


    boolean updateYongHu(User user);


    List<User> DanChaYongHu(@Param("id") Integer id);


    List<User> selectMoHu(@Param("user") User user);


    List<Dept> BuMenQuanXian(@Param("deptName") String deptName, @Param("contact") String contact, @Param("contactphone") String contactphone);


    boolean deleteBuMen(@Param("id") Integer id);


    List<Dept> selectDeptHuiXian();


    boolean addDept(Dept dept);


    List<Dept> DanChaBuMen(Integer id);


    boolean updateBuMen(Dept dept);


    List<Product> GuiGeQuanXian(@Param("bianma") Integer bianma, @Param("productName")  String productName, @Param("productSize")  String productSize, @Param("productStatus") String productStatus);


    boolean addGuiGe(Product product);


    boolean deleteGuiGe(@Param("id") Integer id);


    boolean updateGuiGe(Product product);


    List<Product> DanChaGuiGe(@Param("id") Integer id);


    List<Product> selectStatus();


    boolean XiuGaiStatus(@Param("id") Integer id,@Param("productStatus") String productStatus);


    List<Customer> HuiXianDingDanManager2();
    List<Dept> HuiXianDingDanManager3();
    List<User>  HuiXianDingDanManager4();




    List<DingDanInfo> selectDingDanCha(@Param("dingDanInfo") DingDanInfo dingDanInfo);



    List<DingDan> DingDanQuanXian(DingDan dingDan);



    DingDan DingDanXiangQing(@Param("dingdan") DingDan dingdan);


    boolean deleteDingDan(@Param("dingdan") DingDan dingdan);


    boolean TianJiaDingDan(Map<String, Object> list);


    boolean XiuGaiDingDan(DingDan dingdan);


    boolean dingdanWanCheng(@Param("dingdan") DingDan dingdan,@Param("id")Integer id,@Param("orderStatus") String orderStatus);

    List<Product> selectBianMa();

    Product loadProperty(@Param("product") Product product);
    Product loadProperty2(@Param("product")Product product);

    List<DingDanInfo> xiugaiDingDanDanCha(Integer id);

    boolean XiuGaiQueRen(@Param("id")Integer id,@Param("infoWillrenumber")Integer infoWillrenumber,@Param("infoAllrenumber")Integer infoAllrenumber,@Param("infoTime")Date infoTime);


    boolean XiuGaiShanChu(@Param("dingDanInfo")DingDanInfo dingDanInfo);



    boolean TianJiaDingDanInfo(@Param("id") Object id,@Param("dingdid") Integer dingdid, @Param("infoTime") Date infoTime, @Param("infoNumber") Object infoNumber,@Param("productId") Object productId);

    boolean updateDingDanXinXi(@Param("id") Integer id, @Param("infoAllrenumber") Integer infoAllrenumber, @Param("infoWillrenumber") Integer infoWillrenumber, @Param("infoTime") Date infoTime);

    List<Schedulingplan> quanchaPlan(Schedulingplan schedulingplan);

    List<DingDan> selectDingdanEmpno(DingDan dingDan);

    boolean XinZengPaiChan(Map<String,Object> list);

    boolean XinZengPiCi(@Param("id") Object id, @Param("batchEmpno") Object batchEmpno, @Param("batchName") Object batchName);

    List<Batch> PiCiHuiXian(@Param("batch") Batch batch);

    Schedulingplan GenZongHaoHuiXian(Schedulingplan schedulingplan);

    int shanChuPiCi(@Param("batch") Batch batch);


    List<Productioninformation> selectProductionInfo(Productioninformation productioninformation);

    boolean removeProductionInfo(Productioninformation productioninformation);

    List<Followup> selectgenjinInfo(Followup followup);

    boolean removeGenJinInfo(Followup followup);


    List<Batch> QuanHuiXian(Batch batch);



    boolean xiugaiXinXi(@Param("id") Integer id, @Param("batchEmpno") Object batchEmpno, @Param("batchName") Object batchName);
    boolean tianjiaXinXi(@Param("batchEmpno") Object batchEmpno, @Param("batchName") Object batchName, @Param("batchId") Object batchId);

    List<Schedulingplan> LianChaXinZengPanDuan(Schedulingplan schedulingplan);

    Schedulingplan selectPaiChanHao( Schedulingplan schedulingplan);

    List<Batch> selectPiCiHao(Batch batch);

    List<Product> selectProduct(Product product);

    List<Followup> selectFollowUp(Followup followup);

    User DanChaYongHu1(Integer id);








    //爬虫小说
    List<XiaoShuo> selectZongTuiJian(XiaoShuo xiaoShuo);
    List<XiaoShuo> FirstClassify(XiaoShuo xiaoShuo);
    List<XiaoShuo> SecondClassify(XiaoShuo xiaoShuo);
    List<XiaoShuo> ThirdClassify(XiaoShuo xiaoShuo);
}
